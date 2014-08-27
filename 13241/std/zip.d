// Written in the D programming language.

/**
 * Read/write data in the $(LINK2 http://www.info-_zip.org, zip archive) format.
 * Makes use of the etc.c.zlib compression library.
 *
 * Bugs:
 *      $(UL
 *      $(LI Multi-disk zips not supported.)
 *      $(LI Only Zip version 20 formats are supported.)
 *      $(LI Only supports compression modes 0 (no compression) and 8 (deflate).)
 *      $(LI Does not support encryption.)
 *      $(LI $(BUGZILLA 592))
 *      $(LI $(BUGZILLA 1832))
 *      $(LI $(BUGZILLA 2137))
 *      $(LI $(BUGZILLA 2138))
 *      )
 *
 * Macros:
 *      WIKI = Phobos/StdZip
 *
 * Copyright: Copyright Digital Mars 2000 - 2009.
 * License:   <a href="http://www.boost.org/LICENSE_1_0.txt">Boost License 1.0</a>.
 * Authors:   $(WEB digitalmars.com, Walter Bright)
 * Source:    $(PHOBOSSRC std/_zip.d)
 */

/*          Copyright Digital Mars 2000 - 2009.
 * Distributed under the Boost Software License, Version 1.0.
 *    (See accompanying file LICENSE_1_0.txt or copy at
 *          http://www.boost.org/LICENSE_1_0.txt)
 */
module std.zip;

import std.zlib;
import std.datetime;
import core.bitop;
import std.conv;
import std.algorithm;
import std.bitmanip : littleEndianToNative, nativeToLittleEndian;

//debug=print;

/** Thrown on error.
 */
class ZipException : Exception
{
    this(string msg)
    {
        super("ZipException: " ~ msg);
    }
}

/**
 * Compression method used by ArchiveMember
 */
enum CompressionMethod : ushort
{
    none = 0,   /// No compression, just archiving
    deflate = 8 /// Deflate algorithm. Use zlib library to compress
}

/**
 * A member of the ZipArchive.
 */
final class ArchiveMember
{
    /**
     * Read/Write: Usually the file name of the archive member; it is used to
     * index the archive directory for the member. Each member must have a unique
     * name[]. Do not change without removing member from the directory first.
     */
    string name;

    ubyte[] extra;              /// Read/Write: extra data for this member.
    string comment;             /// Read/Write: comment associated with this member.

    private ubyte[] _compressedData;
    private ubyte[] _expandedData;
    private uint offset;
    private uint _crc32;
    private uint _compressedSize;
    private uint _expandedSize;
    private CompressionMethod _compressionMethod;
    private ushort _madeVersion = 20;
    private ushort _extractVersion = 20;
    private ushort _diskNumber;
    private uint _externalAttributes;
    private DosFileTime _time;

    ushort flags;                  /// Read/Write: normally set to 0
    ushort internalAttributes;     /// Read/Write

    @property ushort extractVersion()     { return _extractVersion; }    /// Read Only
    @property uint crc32()         { return _crc32; }    /// Read Only: cyclic redundancy check (CRC) value

    // Explicitly undocumented. It will be removed in January 2015.
    deprecated("Please use fileAttributes instead.")
    @property ref inout(ushort) madeVersion() inout @safe pure nothrow
    { return _madeVersion; }

    // Explicitly undocumented. It will be removed in January 2015.
    deprecated("Please use fileAttributes instead.")
    @property ref inout(uint) externalAttributes() inout @safe pure nothrow
    { return _externalAttributes; }

    /// Read Only: size of data of member in compressed form.
    @property uint compressedSize()     { return _compressedSize; }

    /// Read Only: size of data of member in expanded form.
    @property uint expandedSize()     { return _expandedSize; }
    @property ushort diskNumber()     { return _diskNumber; }        /// Read Only: should be 0.

    /// Read Only: data of member in compressed form.
    @property ubyte[] compressedData()     { return _compressedData; }

    /// Read data of member in uncompressed form.
    @property ubyte[] expandedData()     { return _expandedData; }

    /// Write data of member in uncompressed form.
    @property void expandedData(ubyte[] ed)
    {
        _expandedData = ed;
        _expandedSize  = to!uint(_expandedData.length);

        // Clean old compressed data, if any
        _compressedData.length = 0;
        _compressedSize = 0;
    }

    /**
     * Set the OS specific file attributes, as obtained by
     * $(XREF file,getAttributes) or $(XREF file,DirEntry.attributes), for this archive member.
     */
    @property void fileAttributes(uint attr)
    {
        version (Posix)
        {
            _externalAttributes = (attr & 0xFFFF) << 16;
            _madeVersion &= 0x00FF;
            _madeVersion |= 0x0300; // attributes are in UNIX format
        }
        else version (Windows)
        {
            _externalAttributes = attr;
            _madeVersion &= 0x00FF; // attributes are in MS-DOS and OS/2 format
        }
        else
        {
            static assert(0, "Unimplemented platform");
        }
    }

    version (Posix) unittest
    {
        auto am = new ArchiveMember();
        am.fileAttributes = octal!100644;
        assert(am._externalAttributes == octal!100644 << 16);
        assert((am._madeVersion & 0xFF00) == 0x0300);
    }

    /**
     * Get the OS specific file attributes for the archive member.
     *
     * Returns: The file attributes or 0 if the file attributes were
     * encoded for an incompatible OS (Windows vs. Posix).
     *
     */
    @property uint fileAttributes() const
    {
        version (Posix)
        {
            if ((_madeVersion & 0xFF00) == 0x0300)
                return _externalAttributes >> 16;
            return 0;
        }
        else version (Windows)
        {
            if ((_madeVersion & 0xFF00) == 0x0000)
                return _externalAttributes;
            return 0;
        }
        else
        {
            static assert(0, "Unimplemented platform");
        }
    }

    /// Set the last modification time for this member.
    @property void time(SysTime time)
    {
        _time = SysTimeToDosFileTime(time);
    }

    /// ditto
    @property void time(DosFileTime time)
    {
        _time = time;
    }

    /// Get the last modification time for this member.
    @property DosFileTime time() const
    {
        return _time;
    }

    /**
     * Read compression method used for this member
     * See_Also:
     *     CompressionMethod
     **/
    @property CompressionMethod compressionMethod() { return _compressionMethod; }

    // Explicitly undocumented. It will be removed in January 2015.
    deprecated("Please use the enum CompressionMethod to set this property instead.")
    @property void compressionMethod(ushort cm)
    {
        compressionMethod = cast(CompressionMethod)(cm);
    }

    /**
     * Write compression method used for this member
     * See_Also:
     *     CompressionMethod
     **/
    @property void compressionMethod(CompressionMethod cm)
    {
        if (cm == _compressionMethod) return;

        if (_compressedSize > 0)
            throw new ZipException("Can't change compression method for a compressed element");

        _compressionMethod = cm;
    }

    debug(print)
    {
    void print()
    {
        printf("name = '%.*s'\n", name.length, name.ptr);
        printf("\tcomment = '%.*s'\n", comment.length, comment.ptr);
        printf("\tmadeVersion = x%04x\n", _madeVersion);
        printf("\textractVersion = x%04x\n", extractVersion);
        printf("\tflags = x%04x\n", flags);
        printf("\tcompressionMethod = %d\n", compressionMethod);
        printf("\ttime = %d\n", time);
        printf("\tcrc32 = x%08x\n", crc32);
        printf("\texpandedSize = %d\n", expandedSize);
        printf("\tcompressedSize = %d\n", compressedSize);
        printf("\tinternalAttributes = x%04x\n", internalAttributes);
        printf("\texternalAttributes = x%08x\n", externalAttributes);
    }
    }
}

/**
 * Object representing the entire archive.
 * ZipArchives are collections of ArchiveMembers.
 */
final class ZipArchive
{
    string comment;     /// Read/Write: the archive comment. Must be less than 65536 bytes in length.

    private ubyte[] _data;
    private uint endrecOffset;

    private uint _diskNumber;
    private uint _diskStartDir;
    private uint _numEntries;
    private uint _totalEntries;

    /// Read Only: array representing the entire contents of the archive.
    @property ubyte[] data()       { return _data; }

    /// Read Only: 0 since multi-disk zip archives are not supported.
    @property uint diskNumber()    { return _diskNumber; }

    /// Read Only: 0 since multi-disk zip archives are not supported
    @property uint diskStartDir()  { return _diskStartDir; }

    /// Read Only: number of ArchiveMembers in the directory.
    @property uint numEntries()    { return _numEntries; }
    @property uint totalEntries()  { return _totalEntries; }    /// ditto
    /**
     * Read Only: array indexed by the name of each member of the archive.
     *  All the members of the archive can be accessed with a foreach loop:
     * Example:
     * --------------------
     * ZipArchive archive = new ZipArchive(data);
     * foreach (ArchiveMember am; archive.directory)
     * {
     *     writefln("member name is '%s'", am.name);
     * }
     * --------------------
     */
    @property ArchiveMember[string] directory() { return _directory; }

    private ArchiveMember[string] _directory;

    debug (print)
    {
    void print()
    {
        printf("\tdiskNumber = %u\n", diskNumber);
        printf("\tdiskStartDir = %u\n", diskStartDir);
        printf("\tnumEntries = %u\n", numEntries);
        printf("\ttotalEntries = %u\n", totalEntries);
        printf("\tcomment = '%.*s'\n", comment.length, comment.ptr);
    }
    }

    /* ============ Creating a new archive =================== */

    /** Constructor to use when creating a new archive.
     */
    this()
    {
    }

    /** Add de to the archive.
     */
    void addMember(ArchiveMember de)
    {
        _directory[de.name] = de;
    }

    /** Delete de from the archive.
     */
    void deleteMember(ArchiveMember de)
    {
        _directory.remove(de.name);
    }

    /**
     * Construct an archive out of the current members of the archive.
     *
     * Fills in the properties data[], diskNumber, diskStartDir, numEntries,
     * totalEntries, and directory[].
     * For each ArchiveMember, fills in properties crc32, compressedSize,
     * compressedData[].
     *
     * Returns: array representing the entire archive.
     */
    void[] build()
    {   uint i;
        uint directoryOffset;

        if (comment.length > 0xFFFF)
            throw new ZipException("archive comment longer than 65535");

        // Compress each member; compute size
        uint archiveSize = 0;
        uint directorySize = 0;
        foreach (ArchiveMember de; _directory)
        {
            if (!de._compressedData.length)
            {
                switch (de.compressionMethod)
                {
                    case CompressionMethod.none:
                        de._compressedData = de._expandedData;
                        break;

                    case CompressionMethod.deflate:
                        de._compressedData = cast(ubyte[])std.zlib.compress(cast(void[])de._expandedData);
                        de._compressedData = de._compressedData[2 .. de._compressedData.length - 4];
                        break;

                    default:
                        throw new ZipException("unsupported compression method");
                }

                de._compressedSize = to!uint(de._compressedData.length);
                de._crc32 = std.zlib.crc32(0, cast(void[])de._expandedData);
            }
            assert(de._compressedData.length == de._compressedSize);

            archiveSize += 30 + de.name.length +
                                de.extra.length +
                                de.compressedSize;
            directorySize += 46 + de.name.length +
                                de.extra.length +
                                de.comment.length;
        }

        _data = new ubyte[archiveSize + directorySize + 22 + comment.length];

        // Populate the data[]

        // Store each archive member
        i = 0;
        foreach (ArchiveMember de; _directory)
        {
            de.offset = i;
            _data[i .. i + 4] = cast(ubyte[])"PK\x03\x04";
            putUshort(i + 4,  de.extractVersion);
            putUshort(i + 6,  de.flags);
            putUshort(i + 8,  de._compressionMethod);
            putUint  (i + 10, cast(uint)de.time);
            putUint  (i + 14, de.crc32);
            putUint  (i + 18, de.compressedSize);
            putUint  (i + 22, to!uint(de.expandedSize));
            putUshort(i + 26, cast(ushort)de.name.length);
            putUshort(i + 28, cast(ushort)de.extra.length);
            i += 30;

            _data[i .. i + de.name.length] = (cast(ubyte[])de.name)[];
            i += de.name.length;
            _data[i .. i + de.extra.length] = (cast(ubyte[])de.extra)[];
            i += de.extra.length;
            _data[i .. i + de.compressedSize] = de.compressedData[];
            i += de.compressedSize;
        }

        // Write directory
        directoryOffset = i;
        _numEntries = 0;
        foreach (ArchiveMember de; _directory)
        {
            _data[i .. i + 4] = cast(ubyte[])"PK\x01\x02";
            putUshort(i + 4,  de._madeVersion);
            putUshort(i + 6,  de.extractVersion);
            putUshort(i + 8,  de.flags);
            putUshort(i + 10, de._compressionMethod);
            putUint  (i + 12, cast(uint)de.time);
            putUint  (i + 16, de.crc32);
            putUint  (i + 20, de.compressedSize);
            putUint  (i + 24, de.expandedSize);
            putUshort(i + 28, cast(ushort)de.name.length);
            putUshort(i + 30, cast(ushort)de.extra.length);
            putUshort(i + 32, cast(ushort)de.comment.length);
            putUshort(i + 34, de.diskNumber);
            putUshort(i + 36, de.internalAttributes);
            putUint  (i + 38, de._externalAttributes);
            putUint  (i + 42, de.offset);
            i += 46;

            _data[i .. i + de.name.length] = (cast(ubyte[])de.name)[];
            i += de.name.length;
            _data[i .. i + de.extra.length] = (cast(ubyte[])de.extra)[];
            i += de.extra.length;
            _data[i .. i + de.comment.length] = (cast(ubyte[])de.comment)[];
            i += de.comment.length;
            _numEntries++;
        }
        _totalEntries = numEntries;

        // Write end record
        endrecOffset = i;
        _data[i .. i + 4] = cast(ubyte[])"PK\x05\x06";
        putUshort(i + 4,  cast(ushort)diskNumber);
        putUshort(i + 6,  cast(ushort)diskStartDir);
        putUshort(i + 8,  cast(ushort)numEntries);
        putUshort(i + 10, cast(ushort)totalEntries);
        putUint  (i + 12, directorySize);
        putUint  (i + 16, directoryOffset);
        putUshort(i + 20, cast(ushort)comment.length);
        i += 22;

        // Write archive comment
        assert(i + comment.length == data.length);
        _data[i .. data.length] = (cast(ubyte[])comment)[];

        return cast(void[])data;
    }

    /* ============ Reading an existing archive =================== */

    /**
     * Constructor to use when reading an existing archive.
     *
     * Fills in the properties data[], diskNumber, diskStartDir, numEntries,
     * totalEntries, comment[], and directory[].
     * For each ArchiveMember, fills in
     * properties madeVersion, extractVersion, flags, compressionMethod, time,
     * crc32, compressedSize, expandedSize, compressedData[], diskNumber,
     * internalAttributes, externalAttributes, name[], extra[], comment[].
     * Use expand() to get the expanded data for each ArchiveMember.
     *
     * Params:
     *  buffer = the entire contents of the archive.
     */

    this(void[] buffer)
    {   int iend;
        int i;
        int endcommentlength;
        uint directorySize;
        uint directoryOffset;

        this._data = cast(ubyte[]) buffer;

        // Find 'end record index' by searching backwards for signature
        iend = to!uint(data.length) - 66000;
        if (iend < 0)
            iend = 0;
        for (i = to!uint(data.length) - 22; 1; i--)
        {
            if (i < iend)
                throw new ZipException("no end record");

            if (_data[i .. i + 4] == cast(ubyte[])"PK\x05\x06")
            {
                endcommentlength = getUshort(i + 20);
                if (i + 22 + endcommentlength > data.length)
                    continue;
                comment = cast(string)(_data[i + 22 .. i + 22 + endcommentlength]);
                endrecOffset = i;
                break;
            }
        }

        // Read end record data
        _diskNumber = getUshort(i + 4);
        _diskStartDir = getUshort(i + 6);

        _numEntries = getUshort(i + 8);
        _totalEntries = getUshort(i + 10);

        if (numEntries != totalEntries)
            throw new ZipException("multiple disk zips not supported");

        directorySize = getUint(i + 12);
        directoryOffset = getUint(i + 16);

        if (directoryOffset + directorySize > i)
            throw new ZipException("corrupted directory");

        i = directoryOffset;
        for (int n = 0; n < numEntries; n++)
        {
            /* The format of an entry is:
             *  'PK' 1, 2
             *  directory info
             *  path
             *  extra data
             *  comment
             */

            uint offset;
            uint namelen;
            uint extralen;
            uint commentlen;

            if (_data[i .. i + 4] != cast(ubyte[])"PK\x01\x02")
                throw new ZipException("invalid directory entry 1");
            ArchiveMember de = new ArchiveMember();
            de._madeVersion = getUshort(i + 4);
            de._extractVersion = getUshort(i + 6);
            de.flags = getUshort(i + 8);
            de._compressionMethod = cast(CompressionMethod)getUshort(i + 10);
            de.time = cast(DosFileTime)getUint(i + 12);
            de._crc32 = getUint(i + 16);
            de._compressedSize = getUint(i + 20);
            de._expandedSize = getUint(i + 24);
            namelen = getUshort(i + 28);
            extralen = getUshort(i + 30);
            commentlen = getUshort(i + 32);
            de._diskNumber = getUshort(i + 34);
            de.internalAttributes = getUshort(i + 36);
            de._externalAttributes = getUint(i + 38);
            de.offset = getUint(i + 42);
            i += 46;

            if (i + namelen + extralen + commentlen > directoryOffset + directorySize)
                throw new ZipException("invalid directory entry 2");

            de.name = cast(string)(_data[i .. i + namelen]);
            i += namelen;
            de.extra = _data[i .. i + extralen];
            i += extralen;
            de.comment = cast(string)(_data[i .. i + commentlen]);
            i += commentlen;

            immutable uint dataOffset = de.offset + 30 + namelen + extralen;
            if (dataOffset + de.compressedSize > endrecOffset)
                throw new ZipException("Invalid directory entry offset or size.");
            de._compressedData = _data[dataOffset .. dataOffset + de.compressedSize];

            _directory[de.name] = de;

        }
        if (i != directoryOffset + directorySize)
            throw new ZipException("invalid directory entry 3");
    }

    /*****
     * Decompress the contents of archive member de and return the expanded
     * data.
     *
     * Fills in properties extractVersion, flags, compressionMethod, time,
     * crc32, compressedSize, expandedSize, expandedData[], name[], extra[].
     */
    ubyte[] expand(ArchiveMember de)
    {   uint namelen;
        uint extralen;

        if (_data[de.offset .. de.offset + 4] != cast(ubyte[])"PK\x03\x04")
            throw new ZipException("invalid directory entry 4");

        // These values should match what is in the main zip archive directory
        de._extractVersion = getUshort(de.offset + 4);
        de.flags = getUshort(de.offset + 6);
        de._compressionMethod = cast(CompressionMethod)getUshort(de.offset + 8);
        de.time = cast(DosFileTime)getUint(de.offset + 10);
        de._crc32 = getUint(de.offset + 14);
        de._compressedSize = max(getUint(de.offset + 18), de.compressedSize);
        de._expandedSize = max(getUint(de.offset + 22), de.expandedSize);
        namelen = getUshort(de.offset + 26);
        extralen = getUshort(de.offset + 28);

        debug(print)
        {
            printf("\t\texpandedSize = %d\n", de.expandedSize);
            printf("\t\tcompressedSize = %d\n", de.compressedSize);
            printf("\t\tnamelen = %d\n", namelen);
            printf("\t\textralen = %d\n", extralen);
        }

        if (de.flags & 1)
            throw new ZipException("encryption not supported");

        int i;
        i = de.offset + 30 + namelen + extralen;
        if (i + de.compressedSize > endrecOffset)
            throw new ZipException("invalid directory entry 5");

        de._compressedData = _data[i .. i + de.compressedSize];
        debug(print) arrayPrint(de.compressedData);

        switch (de.compressionMethod)
        {
            case CompressionMethod.none:
                de._expandedData = de.compressedData;
                return de.expandedData;

            case CompressionMethod.deflate:
                // -15 is a magic value used to decompress zip files.
                // It has the effect of not requiring the 2 byte header
                // and 4 byte trailer.
                de._expandedData = cast(ubyte[])std.zlib.uncompress(cast(void[])de.compressedData, de.expandedSize, -15);
                return de.expandedData;

            default:
                throw new ZipException("unsupported compression method");
        }
    }

    /* ============ Utility =================== */

    ushort getUshort(int i)
    {
        ubyte[2] result = data[i .. i + 2];
        return littleEndianToNative!ushort(result);
    }

    uint getUint(int i)
    {
        ubyte[4] result = data[i .. i + 4];
        return littleEndianToNative!uint(result);
    }

    void putUshort(int i, ushort us)
    {
        data[i .. i + 2] = nativeToLittleEndian(us);
    }

    void putUint(int i, uint ui)
    {
        data[i .. i + 4] = nativeToLittleEndian(ui);
    }
}

debug(print)
{
    void arrayPrint(ubyte[] array)
    {
        printf("array %p,%d\n", cast(void*)array, array.length);
        for (int i = 0; i < array.length; i++)
        {
            printf("%02x ", array[i]);
            if (((i + 1) & 15) == 0)
                printf("\n");
        }
        printf("\n");
    }
}

unittest
{
    auto zip1 = new ZipArchive();
    auto zip2 = new ZipArchive();
    auto am1 = new ArchiveMember();
    am1.name = "foo";
    am1.expandedData = new ubyte[](1024);
    zip1.addMember(am1);
    auto data1 = zip1.build();
    zip2.addMember(zip1.directory["foo"]);
    zip2.build();
    auto am2 = zip2.directory["foo"];
    zip2.expand(am2);
    assert(am1.expandedData == am2.expandedData);
    auto zip3 = new ZipArchive(data1);
    zip3.build();
    assert(zip3.directory["foo"].compressedSize == am1.compressedSize);
}
