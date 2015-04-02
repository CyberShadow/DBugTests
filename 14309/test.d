import std.stdio, core.sys.windows.com, std.uuid;

pragma(lib, "uuid"); // for IID_IClassFactory

void main()
{
  // IID of IClassFactory
  // https://msdn.microsoft.com/en-us/library/microsoft.visualstudio.ole.interop.iclassfactory.aspx
  immutable id = UUID("00000001-0000-0000-C000-000000000046");
  static assert(UUID.sizeof == 16);
  static assert(IID_IClassFactory.sizeof == 16);

  // 01 00 00 00 00 00 00 00 C0 00 00 00 00 00 00 46
  writefln("IID_IClassFactory: %(%02X %)", *cast(ubyte[16]*)&IID_IClassFactory);
  // 00 00 00 01 00 00 00 00 C0 00 00 00 00 00 00 46
  writefln("std.uuid.UUID:     %(%02X %)", id.data);

  assert(id.data == *cast(ubyte[16]*)&IID_IClassFactory);   // failure
  assert(UUID("01000000-0000-0000-C000-000000000046").data
          == *cast(ubyte[16]*)&IID_IClassFactory);          // success
}
