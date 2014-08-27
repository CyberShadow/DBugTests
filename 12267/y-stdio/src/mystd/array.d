// Written in the D programming language.
/**
Functions and types that manipulate built-in arrays.

Copyright: Copyright Andrei Alexandrescu 2008- and Jonathan M Davis 2011-.

License:   $(WEB boost.org/LICENSE_1_0.txt, Boost License 1.0).

Authors:   $(WEB erdani.org, Andrei Alexandrescu) and Jonathan M Davis

Source: $(PHOBOSSRC std/_array.d)
*/
module mystd.array;

import core.memory, core.bitop;
import mystd.algorithm, mystd.ascii, mystd.conv, mystd.exception, mystd.functional,
       mystd.range, mystd.string, mystd.traits, mystd.typecons, mystd.typetuple,
       mystd.uni, mystd.utf;
import mystd.c.string : memcpy;
version(unittest) import core.exception, mystd.stdio;

/**
Returns a newly-allocated dynamic array consisting of a copy of the
input range, static array, dynamic array, or class or struct with an
$(D opApply) function $(D r).  Note that narrow strings are handled as
a special case in an overload.
 */
ForeachType!Range[] array(Range)(Range r)
if (isIterable!Range && !isNarrowString!Range && !isInfinite!Range)
{
    alias E = ForeachType!Range;
    static if (hasLength!Range)
    {
        if(r.length == 0) return null;

        static auto trustedAllocateArray(size_t n) @trusted nothrow
        {
            return uninitializedArray!(Unqual!E[])(n);
        }
        auto result = trustedAllocateArray(r.length);

        size_t i;
        foreach (e; r)
        {
            emplaceRef(result[i], e);
            ++i;
        }
        return cast(E[])result;
    }
    else
    {
        auto a = appender!(E[])();
        foreach (e; r)
        {
            a.put(e);
        }
        return a.data;
    }
}

///
@safe pure nothrow unittest
{
    auto a = array([1, 2, 3, 4, 5][]);
    assert(a == [ 1, 2, 3, 4, 5 ]);
}

@safe pure nothrow unittest
{
    struct Foo
    {
        int a;
    }
    auto a = array([Foo(1), Foo(2), Foo(3), Foo(4), Foo(5)][]);
    assert(equal(a, [Foo(1), Foo(2), Foo(3), Foo(4), Foo(5)]));
}

@system unittest
{
    struct Foo
    {
        int a;
        auto opAssign(Foo foo)
        {
            assert(0);
        }
        auto opEquals(Foo foo)
        {
            return a == foo.a;
        }
    }
    auto a = array([Foo(1), Foo(2), Foo(3), Foo(4), Foo(5)][]);
    assert(equal(a, [Foo(1), Foo(2), Foo(3), Foo(4), Foo(5)]));
}

/**
Convert a narrow string to an array type that fully supports random access.
This is handled as a special case and always returns a $(D dchar[]),
$(D const(dchar)[]), or $(D immutable(dchar)[]) depending on the constness of
the input.
*/
ElementType!String[] array(String)(String str) if (isNarrowString!String)
{
    return to!(typeof(return))(str);
}

unittest
{
    static struct TestArray { int x; string toString() { return .to!string(x); } }

    static struct OpAssign
    {
        uint num;
        this(uint num) { this.num = num; }

        // Templating opAssign to make sure the bugs with opAssign being
        // templated are fixed.
        void opAssign(T)(T rhs) { this.num = rhs.num; }
    }

    static struct OpApply
    {
        int opApply(int delegate(ref int) dg)
        {
            int res;
            foreach(i; 0..10)
            {
                res = dg(i);
                if(res) break;
            }

            return res;
        }
    }

    auto a = array([1, 2, 3, 4, 5][]);
    //writeln(a);
    assert(a == [ 1, 2, 3, 4, 5 ]);

    auto b = array([TestArray(1), TestArray(2)][]);
    //writeln(b);

    class C
    {
        int x;
        this(int y) { x = y; }
        override string toString() const { return .to!string(x); }
    }
    auto c = array([new C(1), new C(2)][]);
    //writeln(c);

    auto d = array([1.0, 2.2, 3][]);
    assert(is(typeof(d) == double[]));
    //writeln(d);

    auto e = [OpAssign(1), OpAssign(2)];
    auto f = array(e);
    assert(e == f);

    assert(array(OpApply.init) == [0,1,2,3,4,5,6,7,8,9]);
    assert(array("ABC") == "ABC"d);
    assert(array("ABC".dup) == "ABC"d.dup);
}

//Bug# 8233
unittest
{
    assert(array("hello world"d) == "hello world"d);
    immutable a = [1, 2, 3, 4, 5];
    assert(array(a) == a);
    const b = a;
    assert(array(b) == a);

    //To verify that the opAssign branch doesn't get screwed up by using Unqual.
    //EDIT: array no longer calls opAssign.
    struct S
    {
        ref S opAssign(S)(const ref S rhs)
        {
            assert(0);
        }

        int i;
    }

    foreach(T; TypeTuple!(S, const S, immutable S))
    {
        auto arr = [T(1), T(2), T(3), T(4)];
        assert(array(arr) == arr);
    }
}

unittest
{
    //9824
    static struct S
    {
        @disable void opAssign(S);
        int i;
    }
    auto arr = [S(0), S(1), S(2)];
    arr.array();
}

// Bugzilla 10220
unittest
{
    import mystd.algorithm : equal;
    import mystd.range : repeat;

    static struct S
    {
        int val;

        @disable this();
        this(int v) { val = v; }
    }
    assertCTFEable!(
    {
        auto r = S(1).repeat(2).array();
        assert(equal(r, [S(1), S(1)]));
    });
}

unittest
{
    //Turn down infinity:
    static assert(!is(typeof(
        repeat(1).array()
    )));
}

/**
Returns a newly allocated associative array out of elements of the input range,
which must be a range of tuples (Key, Value).
 */

auto assocArray(Range)(Range r)
    if (isInputRange!Range && isTuple!(ElementType!Range) &&
        ElementType!Range.length == 2)
{
    alias KeyType = ElementType!Range.Types[0];
    alias ValueType = ElementType!Range.Types[1];
    ValueType[KeyType] aa;
    foreach (t; r)
        aa[t[0]] = t[1];
    return aa;
}

///
/*@safe*/ pure /*nothrow*/ unittest
{
    auto a = assocArray(zip([0, 1, 2], ["a", "b", "c"]));
    assert(is(typeof(a) == string[int]));
    assert(a == [0:"a", 1:"b", 2:"c"]);

    auto b = assocArray([ tuple("foo", "bar"), tuple("baz", "quux") ]);
    assert(is(typeof(b) == string[string]));
    assert(b == ["foo":"bar", "baz":"quux"]);
}

/// @@@11053@@@ - Cannot be version(unittest) - recursive instantiation error
unittest
{
    static assert(!__traits(compiles, [ tuple("foo", "bar", "baz") ].assocArray()));
    static assert(!__traits(compiles, [ tuple("foo") ].assocArray()));
    static assert( __traits(compiles, [ tuple("foo", "bar") ].assocArray()));
}

private template blockAttribute(T)
{
    static if (hasIndirections!(T) || is(T == void))
    {
        enum blockAttribute = 0;
    }
    else
    {
        enum blockAttribute = GC.BlkAttr.NO_SCAN;
    }
}
version(unittest)
{
    static assert(!(blockAttribute!void & GC.BlkAttr.NO_SCAN));
}

// Returns the number of dimensions in an array T.
private template nDimensions(T)
{
    static if(isArray!T)
    {
        enum nDimensions = 1 + nDimensions!(typeof(T.init[0]));
    }
    else
    {
        enum nDimensions = 0;
    }
}

version(unittest)
{
    static assert(nDimensions!(uint[]) == 1);
    static assert(nDimensions!(float[][]) == 2);
}

/++
Returns a new array of type $(D T) allocated on the garbage collected heap
without initializing its elements.  This can be a useful optimization if every
element will be immediately initialized.  $(D T) may be a multidimensional
array.  In this case sizes may be specified for any number of dimensions from 0
to the number in $(D T).

uninitializedArray is nothrow and weakly pure.
+/
auto uninitializedArray(T, I...)(I sizes) nothrow @trusted
if (isDynamicArray!T && allSatisfy!(isIntegral, I))
{
    enum isSize_t(E) = is (E : size_t);
    alias toSize_t(E) = size_t;

    static assert(allSatisfy!(isSize_t, I),
        format("Argument types in %s are not all convertible to size_t: %s",
        I.stringof, Filter!(templateNot!(isSize_t), I).stringof));

    //Eagerlly transform non-size_t into size_t to avoid template bloat
    alias ST = staticMap!(toSize_t, I);

    return arrayAllocImpl!(false, T, ST)(sizes);
}
///
nothrow pure unittest
{
    double[] arr = uninitializedArray!(double[])(100);
    assert(arr.length == 100);

    double[][] matrix = uninitializedArray!(double[][])(42, 31);
    assert(matrix.length == 42);
    assert(matrix[0].length == 31);
}

/++
Returns a new array of type $(D T) allocated on the garbage collected heap.

Partial initialization is done for types with indirections, for preservation
of memory safety. Note that elements will only be initialized to 0, but not
necessarily the element type's $(D .init).

minimallyInitializedArray is nothrow and weakly pure.
+/
auto minimallyInitializedArray(T, I...)(I sizes) nothrow @trusted
if (isDynamicArray!T && allSatisfy!(isIntegral, I))
{
    enum isSize_t(E) = is (E : size_t);
    alias toSize_t(E) = size_t;

    static assert(allSatisfy!(isSize_t, I),
        format("Argument types in %s are not all convertible to size_t: %s",
        I.stringof, Filter!(templateNot!(isSize_t), I).stringof));

    //Eagerlly transform non-size_t into size_t to avoid template bloat
    alias ST = staticMap!(toSize_t, I);

    return arrayAllocImpl!(true, T, ST)(sizes);
}

@safe nothrow pure unittest
{
    minimallyInitializedArray!(int[][][][][])();
    double[] arr = minimallyInitializedArray!(double[])(100);
    assert(arr.length == 100);

    double[][] matrix = minimallyInitializedArray!(double[][])(42);
    assert(matrix.length == 42);
    foreach(elem; matrix)
    {
        assert(elem.ptr is null);
    }
}

private auto arrayAllocImpl(bool minimallyInitialized, T, I...)(I sizes) nothrow
{
    static assert(I.length <= nDimensions!T,
        format("%s dimensions specified for a %s dimensional array.", I.length, nDimensions!T));

    alias E = ElementEncodingType!T;

    E[] ret;

    static if (I.length != 0)
    {
        static assert (is(I[0] == size_t));
        alias size = sizes[0];
    }

    static if (I.length == 1)
    {
        if (__ctfe)
        {
            static if (__traits(compiles, new E[](size)))
                ret = new E[](size);
            else static if (__traits(compiles, ret ~= E.init))
            {
                try
                {
                    //Issue: if E has an impure postblit, then all of arrayAllocImpl
                    //Will be impure, even during non CTFE.
                    foreach (i; 0 .. size)
                        ret ~= E.init;
                }
                catch (Exception e)
                    throw new Error(e.msg);
            }
            else
                assert(0, "No postblit nor default init on " ~ E.stringof ~
                    ": At least one is required for CTFE.");
        }
        else
        {
            import core.stdc.string : memset;
            auto ptr = cast(E*) GC.malloc(sizes[0] * E.sizeof, blockAttribute!E);
            static if (minimallyInitialized && hasIndirections!E)
                memset(ptr, 0, size * E.sizeof);
            ret = ptr[0 .. size];
        }
    }
    else static if (I.length > 1)
    {
        ret = arrayAllocImpl!(false, E[])(size);
        foreach(ref elem; ret)
            elem = arrayAllocImpl!(minimallyInitialized, E)(sizes[1..$]);
    }

    return ret;
}

nothrow pure unittest
{
    auto s1 = uninitializedArray!(int[])();
    auto s2 = minimallyInitializedArray!(int[])();
    assert(s1.length == 0);
    assert(s2.length == 0);
}

nothrow pure unittest //@@@9803@@@
{
    auto a = minimallyInitializedArray!(int*[])(1);
    assert(a[0] == null);
    auto b = minimallyInitializedArray!(int[][])(1);
    assert(b[0].empty);
    auto c = minimallyInitializedArray!(int*[][])(1, 1);
    assert(c[0][0] == null);
}

unittest //@@@10637@@@
{
    static struct S
    {
        static struct I{int i; alias i this;}
        int* p;
        this() @disable;
        this(int i)
        {
            p = &(new I(i)).i;
        }
        this(this)
        {
            p = &(new I(*p)).i;
        }
        ~this()
        {
            assert(p != null);
        }
    }
    auto a = minimallyInitializedArray!(S[])(1);
    assert(a[0].p == null);
    enum b = minimallyInitializedArray!(S[])(1);
}

nothrow unittest
{
    static struct S1
    {
        this() @disable;
        this(this) @disable;
    }
    auto a1 = minimallyInitializedArray!(S1[][])(2, 2);
    //enum b1 = minimallyInitializedArray!(S1[][])(2, 2);
    static struct S2
    {
        this() @disable;
        //this(this) @disable;
    }
    auto a2 = minimallyInitializedArray!(S2[][])(2, 2);
    enum b2 = minimallyInitializedArray!(S2[][])(2, 2);
    static struct S3
    {
        //this() @disable;
        this(this) @disable;
    }
    auto a3 = minimallyInitializedArray!(S3[][])(2, 2);
    enum b3 = minimallyInitializedArray!(S3[][])(2, 2);
}

/**
Implements the range interface primitive $(D empty) for built-in
arrays. Due to the fact that nonmember functions can be called with
the first argument using the dot notation, $(D array.empty) is
equivalent to $(D empty(array)).
 */

@property bool empty(T)(in T[] a) @safe pure nothrow
{
    return !a.length;
}

///
@safe pure nothrow unittest
{
    auto a = [ 1, 2, 3 ];
    assert(!a.empty);
    assert(a[3 .. $].empty);
}

/**
Implements the range interface primitive $(D save) for built-in
arrays. Due to the fact that nonmember functions can be called with
the first argument using the dot notation, $(D array.save) is
equivalent to $(D save(array)). The function does not duplicate the
content of the array, it simply returns its argument.
 */

@property T[] save(T)(T[] a) @safe pure nothrow
{
    return a;
}

///
@safe pure nothrow unittest
{
    auto a = [ 1, 2, 3 ];
    auto b = a.save;
    assert(b is a);
}
/**
Implements the range interface primitive $(D popFront) for built-in
arrays. Due to the fact that nonmember functions can be called with
the first argument using the dot notation, $(D array.popFront) is
equivalent to $(D popFront(array)). For $(GLOSSARY narrow strings),
$(D popFront) automaticaly advances to the next $(GLOSSARY code
point).
*/

void popFront(T)(ref T[] a) @safe pure nothrow
if (!isNarrowString!(T[]) && !is(T[] == void[]))
{
    assert(a.length, "Attempting to popFront() past the end of an array of " ~ T.stringof);
    a = a[1 .. $];
}

///
@safe pure nothrow unittest
{
    auto a = [ 1, 2, 3 ];
    a.popFront();
    assert(a == [ 2, 3 ]);
}

version(unittest)
{
    static assert(!is(typeof({          int[4] a; popFront(a); })));
    static assert(!is(typeof({ immutable int[] a; popFront(a); })));
    static assert(!is(typeof({          void[] a; popFront(a); })));
}

// Specialization for narrow strings. The necessity of
void popFront(C)(ref C[] str) @trusted pure nothrow
if (isNarrowString!(C[]))
{
    assert(str.length, "Attempting to popFront() past the end of an array of " ~ C.stringof);

    static if(is(Unqual!C == char))
    {
        immutable c = str[0];
        if(c < 0x80)
        {
            //ptr is used to avoid unnnecessary bounds checking.
            str = str.ptr[1 .. str.length];
        }
        else
        {
             import core.bitop;
             auto msbs = 7 - bsr(~c);
             if((msbs < 2) | (msbs > 6))
             {
                 //Invalid UTF-8
                 msbs = 1;
             }
             str = str[msbs .. $];
        }
    }
    else static if(is(Unqual!C == wchar))
    {
        immutable u = str[0];
        str = str[1 + (u >= 0xD800 && u <= 0xDBFF) .. $];
    }
    else static assert(0, "Bad template constraint.");
}

@safe pure unittest
{
    foreach(S; TypeTuple!(string, wstring, dstring))
    {
        S s = "\xC2\xA9hello";
        s.popFront();
        assert(s == "hello");

        S str = "hello\U00010143\u0100\U00010143";
        foreach(dchar c; ['h', 'e', 'l', 'l', 'o', '\U00010143', '\u0100', '\U00010143'])
        {
            assert(str.front == c);
            str.popFront();
        }
        assert(str.empty);

        static assert(!is(typeof({          immutable S a; popFront(a); })));
        static assert(!is(typeof({ typeof(S.init[0])[4] a; popFront(a); })));
    }

    C[] _eatString(C)(C[] str)
    {
        while(!str.empty)
            str.popFront();

        return str;
    }
    enum checkCTFE = _eatString("ウェブサイト@La_Verité.com");
    static assert(checkCTFE.empty);
    enum checkCTFEW = _eatString("ウェブサイト@La_Verité.com"w);
    static assert(checkCTFEW.empty);
}

/**
Implements the range interface primitive $(D popBack) for built-in
arrays. Due to the fact that nonmember functions can be called with
the first argument using the dot notation, $(D array.popBack) is
equivalent to $(D popBack(array)). For $(GLOSSARY narrow strings), $(D
popFront) automaticaly eliminates the last $(GLOSSARY code point).
*/

void popBack(T)(ref T[] a) @safe pure nothrow
if (!isNarrowString!(T[]) && !is(T[] == void[]))
{
    assert(a.length);
    a = a[0 .. $ - 1];
}

///
@safe pure nothrow unittest
{
    auto a = [ 1, 2, 3 ];
    a.popBack();
    assert(a == [ 1, 2 ]);
}

version(unittest)
{
    static assert(!is(typeof({ immutable int[] a; popBack(a); })));
    static assert(!is(typeof({          int[4] a; popBack(a); })));
    static assert(!is(typeof({          void[] a; popBack(a); })));
}

// Specialization for arrays of char
void popBack(T)(ref T[] a) @safe pure
if (isNarrowString!(T[]))
{
    assert(a.length, "Attempting to popBack() past the front of an array of " ~ T.stringof);
    a = a[0 .. $ - mystd.utf.strideBack(a, $)];
}

@safe pure unittest
{
    foreach(S; TypeTuple!(string, wstring, dstring))
    {
        S s = "hello\xE2\x89\xA0";
        s.popBack();
        assert(s == "hello");
        S s3 = "\xE2\x89\xA0";
        auto c = s3.back;
        assert(c == cast(dchar)'\u2260');
        s3.popBack();
        assert(s3 == "");

        S str = "\U00010143\u0100\U00010143hello";
        foreach(dchar ch; ['o', 'l', 'l', 'e', 'h', '\U00010143', '\u0100', '\U00010143'])
        {
            assert(str.back == ch);
            str.popBack();
        }
        assert(str.empty);

        static assert(!is(typeof({          immutable S a; popBack(a); })));
        static assert(!is(typeof({ typeof(S.init[0])[4] a; popBack(a); })));
    }
}

/**
Implements the range interface primitive $(D front) for built-in
arrays. Due to the fact that nonmember functions can be called with
the first argument using the dot notation, $(D array.front) is
equivalent to $(D front(array)). For $(GLOSSARY narrow strings), $(D
front) automaticaly returns the first $(GLOSSARY code point) as a $(D
dchar).
*/
@property ref T front(T)(T[] a) @safe pure nothrow
if (!isNarrowString!(T[]) && !is(T[] == void[]))
{
    assert(a.length, "Attempting to fetch the front of an empty array of " ~ T.stringof);
    return a[0];
}

///
@safe pure nothrow unittest
{
    int[] a = [ 1, 2, 3 ];
    assert(a.front == 1);
}

@safe pure nothrow unittest
{
    auto a = [ 1, 2 ];
    a.front = 4;
    assert(a.front == 4);
    assert(a == [ 4, 2 ]);

    immutable b = [ 1, 2 ];
    assert(b.front == 1);

    int[2] c = [ 1, 2 ];
    assert(c.front == 1);
}

@property dchar front(T)(T[] a) @safe pure if (isNarrowString!(T[]))
{
    assert(a.length, "Attempting to fetch the front of an empty array of " ~ T.stringof);
    size_t i = 0;
    return decode(a, i);
}

/**
Implements the range interface primitive $(D back) for built-in
arrays. Due to the fact that nonmember functions can be called with
the first argument using the dot notation, $(D array.back) is
equivalent to $(D back(array)). For $(GLOSSARY narrow strings), $(D
back) automaticaly returns the last $(GLOSSARY code point) as a $(D
dchar).
*/
@property ref T back(T)(T[] a) @safe pure nothrow if (!isNarrowString!(T[]))
{
    assert(a.length, "Attempting to fetch the back of an empty array of " ~ T.stringof);
    return a[$ - 1];
}

///
@safe pure nothrow unittest
{
    int[] a = [ 1, 2, 3 ];
    assert(a.back == 3);
    a.back += 4;
    assert(a.back == 7);
}

@safe pure nothrow unittest
{
    immutable b = [ 1, 2, 3 ];
    assert(b.back == 3);

    int[3] c = [ 1, 2, 3 ];
    assert(c.back == 3);
}

// Specialization for strings
@property dchar back(T)(T[] a) @safe pure if (isNarrowString!(T[]))
{
    assert(a.length, "Attempting to fetch the back of an empty array of " ~ T.stringof);
    size_t i = a.length - mystd.utf.strideBack(a, a.length);
    return decode(a, i);
}

// overlap
/*
NOTE: Undocumented for now, overlap does not yet work with ctfe.
Returns the overlapping portion, if any, of two arrays. Unlike $(D
equal), $(D overlap) only compares the pointers in the ranges, not the
values referred by them. If $(D r1) and $(D r2) have an overlapping
slice, returns that slice. Otherwise, returns the null slice.
*/
inout(T)[] overlap(T)(inout(T)[] r1, inout(T)[] r2) @trusted pure nothrow
{
    alias U = inout(T);
    static U* max(U* a, U* b) nothrow { return a > b ? a : b; }
    static U* min(U* a, U* b) nothrow { return a < b ? a : b; }

    auto b = max(r1.ptr, r2.ptr);
    auto e = min(r1.ptr + r1.length, r2.ptr + r2.length);
    return b < e ? b[0 .. e - b] : null;
}

///
@safe pure /*nothrow*/ unittest
{
    int[] a = [ 10, 11, 12, 13, 14 ];
    int[] b = a[1 .. 3];
    assert(overlap(a, b) == [ 11, 12 ]);
    b = b.dup;
    // overlap disappears even though the content is the same
    assert(overlap(a, b).empty);
}

/*@safe nothrow*/ unittest
{
    static void test(L, R)(L l, R r)
    {
        scope(failure) writeln("Types: L %s  R %s", L.stringof, R.stringof);

        assert(overlap(l, r) == [ 100, 12 ]);

        assert(overlap(l, l[0 .. 2]) is l[0 .. 2]);
        assert(overlap(l, l[3 .. 5]) is l[3 .. 5]);
        assert(overlap(l[0 .. 2], l) is l[0 .. 2]);
        assert(overlap(l[3 .. 5], l) is l[3 .. 5]);
    }

    int[] a = [ 10, 11, 12, 13, 14 ];
    int[] b = a[1 .. 3];
    a[1] = 100;

    immutable int[] c = a.idup;
    immutable int[] d = c[1 .. 3];

    test(a, b);
    assert(overlap(a, b.dup).empty);
    test(c, d);
    assert(overlap(c, d.idup).empty);
}

@safe pure nothrow unittest // bugzilla 9836
{
    // range primitives for array should work with alias this types
    struct Wrapper
    {
        int[] data;
        alias data this;

        @property Wrapper save() { return this; }
    }
    auto w = Wrapper([1,2,3,4]);
    mystd.array.popFront(w); // should work

    static assert(isInputRange!Wrapper);
    static assert(isForwardRange!Wrapper);
    static assert(isBidirectionalRange!Wrapper);
    static assert(isRandomAccessRange!Wrapper);
}

/+
Commented out until the insert which has been deprecated has been removed.
I'd love to just remove it in favor of insertInPlace, but then code would then
use this version of insert and silently break. So, it's here so that it can
be used once insert has not only been deprecated but removed, but until then,
it's commented out.

/++
    Creates a new array which is a copy of $(D array) with $(D stuff) (which
    must be an input range or a single item) inserted at position $(D pos).

    Examples:
    --------------------
    int[] a = [ 1, 2, 3, 4 ];
    auto b = a.insert(2, [ 1, 2 ]);
    assert(a == [ 1, 2, 3, 4 ]);
    assert(b == [ 1, 2, 1, 2, 3, 4 ]);
    --------------------
 +/
T[] insert(T, Range)(T[] array, size_t pos, Range stuff)
    if(isInputRange!Range &&
       (is(ElementType!Range : T) ||
        isSomeString!(T[]) && is(ElementType!Range : dchar)))
{
    static if(hasLength!Range && is(ElementEncodingType!Range : T))
    {
        auto retval = new Unqual!(T)[](array.length + stuff.length);
        retval[0 .. pos] = array[0 .. pos];
        copy(stuff, retval[pos .. pos + stuff.length]);
        retval[pos + stuff.length .. $] = array[pos .. $];
        return cast(T[])retval;
    }
    else
    {
        auto app = appender!(T[])();
        app.put(array[0 .. pos]);
        app.put(stuff);
        app.put(array[pos .. $]);
        return app.data;
    }
}

/++ Ditto +/
T[] insert(T)(T[] array, size_t pos, T stuff)
{
    auto retval = new T[](array.length + 1);
    retval[0 .. pos] = array[0 .. pos];
    retval[pos] = stuff;
    retval[pos + 1 .. $] = array[pos .. $];
    return retval;
}

//Verify Example.
unittest
{
    int[] a = [ 1, 2, 3, 4 ];
    auto b = a.insert(2, [ 1, 2 ]);
    assert(a == [ 1, 2, 3, 4 ]);
    assert(b == [ 1, 2, 1, 2, 3, 4 ]);
}

unittest
{
    auto a = [1, 2, 3, 4];
    assert(a.insert(0, [6, 7]) == [6, 7, 1, 2, 3, 4]);
    assert(a.insert(2, [6, 7]) == [1, 2, 6, 7, 3, 4]);
    assert(a.insert(a.length, [6, 7]) == [1, 2, 3, 4, 6, 7]);

    assert(a.insert(0, filter!"true"([6, 7])) == [6, 7, 1, 2, 3, 4]);
    assert(a.insert(2, filter!"true"([6, 7])) == [1, 2, 6, 7, 3, 4]);
    assert(a.insert(a.length, filter!"true"([6, 7])) == [1, 2, 3, 4, 6, 7]);

    assert(a.insert(0, 22) == [22, 1, 2, 3, 4]);
    assert(a.insert(2, 22) == [1, 2, 22, 3, 4]);
    assert(a.insert(a.length, 22) == [1, 2, 3, 4, 22]);
    assert(a == [1, 2, 3, 4]);

    auto testStr(T, U)(string file = __FILE__, size_t line = __LINE__)
    {

        auto l = to!T("hello");
        auto r = to!U(" world");

        enforce(insert(l, 0, r) == " worldhello",
                new AssertError("testStr failure 1", file, line));
        enforce(insert(l, 3, r) == "hel worldlo",
                new AssertError("testStr failure 2", file, line));
        enforce(insert(l, l.length, r) == "hello world",
                new AssertError("testStr failure 3", file, line));
        enforce(insert(l, 0, filter!"true"(r)) == " worldhello",
                new AssertError("testStr failure 4", file, line));
        enforce(insert(l, 3, filter!"true"(r)) == "hel worldlo",
                new AssertError("testStr failure 5", file, line));
        enforce(insert(l, l.length, filter!"true"(r)) == "hello world",
                new AssertError("testStr failure 6", file, line));
    }

    testStr!(string, string)();
    testStr!(string, wstring)();
    testStr!(string, dstring)();
    testStr!(wstring, string)();
    testStr!(wstring, wstring)();
    testStr!(wstring, dstring)();
    testStr!(dstring, string)();
    testStr!(dstring, wstring)();
    testStr!(dstring, dstring)();
}
+/

private void copyBackwards(T)(T[] src, T[] dest)
{
    import core.stdc.string;
    assert(src.length == dest.length);

    void trustedMemmove(void* d, const void* s, size_t len) @trusted
    {
        memmove(d, s, len);
    }

    if (!__ctfe)
        trustedMemmove(dest.ptr, src.ptr, src.length * T.sizeof);
    else
    {
        immutable len = src.length;
        for (size_t i = len; i-- > 0;)
        {
            dest[i] = src[i];
        }
    }
}

/++
    Inserts $(D stuff) (which must be an input range or any number of
    implicitly convertible items) in $(D array) at position $(D pos).

    Example:
    ---
    int[] a = [ 1, 2, 3, 4 ];
    a.insertInPlace(2, [ 1, 2 ]);
    assert(a == [ 1, 2, 1, 2, 3, 4 ]);
    a.insertInPlace(3, 10u, 11);
    assert(a == [ 1, 2, 1, 10, 11, 2, 3, 4]);
    ---
 +/
void insertInPlace(T, U...)(ref T[] array, size_t pos, U stuff)
    if(!isSomeString!(T[])
        && allSatisfy!(isInputRangeOrConvertible!T, U) && U.length > 0)
{
    static if(allSatisfy!(isInputRangeWithLengthOrConvertible!T, U))
    {
        import core.stdc.string;
        auto trustedAllocateArray(size_t n) @trusted nothrow
        {
            return uninitializedArray!(T[])(n);
        }
        void trustedMemcopy(T[] dest, T[] src) @trusted
        {
            assert(src.length == dest.length);
            if (!__ctfe)
                memcpy(dest.ptr, src.ptr, src.length * T.sizeof);
            else
            {
                dest[] = src[];
            }
        }

        immutable oldLen = array.length;
        size_t to_insert = 0;
        foreach (i, E; U)
        {
            static if (is(E : T)) //a single convertible value, not a range
                to_insert += 1;
            else
                to_insert += stuff[i].length;
        }
        auto tmp = trustedAllocateArray(to_insert);
        auto j = 0;
        foreach (i, E; U)
        {
            static if (is(E : T)) //ditto
            {
                emplaceRef(tmp[j++], stuff[i]);
            }
            else
            {
                foreach (v; stuff[i])
                {
                    emplaceRef(tmp[j++], v);
                }
            }
        }
        array.length += to_insert;
        copyBackwards(array[pos..oldLen], array[pos+to_insert..$]);
        trustedMemcopy(array[pos..pos+to_insert], tmp);
    }
    else
    {
        // stuff has some InputRanges in it that don't have length
        // assume that stuff to be inserted is typically shorter
        // then the array that can be arbitrary big
        // TODO: needs a better implementation as there is no need to build an _array_
        // a singly-linked list of memory blocks (rope, etc.) will do
        auto app = appender!(T[])();
        foreach (i, E; U)
            app.put(stuff[i]);
        insertInPlace(array, pos, app.data);
    }
}

/++ Ditto +/
void insertInPlace(T, U...)(ref T[] array, size_t pos, U stuff)
    if(isSomeString!(T[]) && allSatisfy!(isCharOrStringOrDcharRange, U))
{
    static if(is(Unqual!T == T)
        && allSatisfy!(isInputRangeWithLengthOrConvertible!dchar, U))
    {
        // mutable, can do in place
        //helper function: re-encode dchar to Ts and store at *ptr
        static T* putDChar(T* ptr, dchar ch)
        {
            static if(is(T == dchar))
            {
                *ptr++ = ch;
                return ptr;
            }
            else
            {
                T[dchar.sizeof/T.sizeof] buf;
                size_t len = encode(buf, ch);
                final switch(len)
                {
                    static if(T.sizeof == char.sizeof)
                    {
                case 4:
                        ptr[3] = buf[3];
                        goto case;
                case 3:
                        ptr[2] = buf[2];
                        goto case;
                    }
                case 2:
                    ptr[1] = buf[1];
                    goto case;
                case 1:
                    ptr[0] = buf[0];
                }
                ptr += len;
                return ptr;
            }
        }
        immutable oldLen = array.length;
        size_t to_insert = 0;
        //count up the number of *codeunits* to insert
        foreach (i, E; U)
            to_insert += codeLength!T(stuff[i]);
        array.length += to_insert;
        copyBackwards(array[pos..oldLen], array[pos+to_insert..$]);
        auto ptr = array.ptr + pos;
        foreach (i, E; U)
        {
            static if(is(E : dchar))
            {
                ptr = putDChar(ptr, stuff[i]);
            }
            else
            {
                foreach (dchar ch; stuff[i])
                    ptr = putDChar(ptr, ch);
            }
        }
        assert(ptr == array.ptr + pos + to_insert, text(ptr - array.ptr, " vs ", pos + to_insert ));
    }
    else
    {
        // immutable/const, just construct a new array
        auto app = appender!(T[])();
        app.put(array[0..pos]);
        foreach (i, E; U)
            app.put(stuff[i]);
        app.put(array[pos..$]);
        array = app.data;
    }
}

//constraint helpers
private template isInputRangeWithLengthOrConvertible(E)
{
    template isInputRangeWithLengthOrConvertible(R)
    {
        //hasLength not defined for char[], wchar[] and dchar[]
        enum isInputRangeWithLengthOrConvertible =
            (isInputRange!R && is(typeof(R.init.length))
                && is(ElementType!R : E))  || is(R : E);
    }
}

//ditto
private template isCharOrStringOrDcharRange(T)
{
    enum isCharOrStringOrDcharRange = isSomeString!T || isSomeChar!T ||
        (isInputRange!T && is(ElementType!T : dchar));
}

//ditto
private template isInputRangeOrConvertible(E)
{
    template isInputRangeOrConvertible(R)
    {
        enum isInputRangeOrConvertible =
            (isInputRange!R && is(ElementType!R : E))  || is(R : E);
    }
}


//Verify Example.
@safe unittest
{
    int[] a = [ 1, 2, 3, 4 ];
    a.insertInPlace(2, [ 1, 2 ]);
    assert(a == [ 1, 2, 1, 2, 3, 4 ]);
    a.insertInPlace(3, 10u, 11);
    assert(a == [ 1, 2, 1, 10, 11, 2, 3, 4]);
}

unittest
{
    bool test(T, U, V)(T orig, size_t pos, U toInsert, V result,
               string file = __FILE__, size_t line = __LINE__)
    {
        {
            static if(is(T == typeof(T.init.dup)))
                auto a = orig.dup;
            else
                auto a = orig.idup;

            a.insertInPlace(pos, toInsert);
            if(!mystd.algorithm.equal(a, result))
                return false;
        }

        static if(isInputRange!U)
        {
            orig.insertInPlace(pos, filter!"true"(toInsert));
            return mystd.algorithm.equal(orig, result);
        }
        else
            return true;
    }


    assert(test([1, 2, 3, 4], 0, [6, 7], [6, 7, 1, 2, 3, 4]));
    assert(test([1, 2, 3, 4], 2, [8, 9], [1, 2, 8, 9, 3, 4]));
    assert(test([1, 2, 3, 4], 4, [10, 11], [1, 2, 3, 4, 10, 11]));

    assert(test([1, 2, 3, 4], 0, 22, [22, 1, 2, 3, 4]));
    assert(test([1, 2, 3, 4], 2, 23, [1, 2, 23, 3, 4]));
    assert(test([1, 2, 3, 4], 4, 24, [1, 2, 3, 4, 24]));

    auto testStr(T, U)(string file = __FILE__, size_t line = __LINE__)
    {

        auto l = to!T("hello");
        auto r = to!U(" વિશ્વ");

        enforce(test(l, 0, r, " વિશ્વhello"),
                new AssertError("testStr failure 1", file, line));
        enforce(test(l, 3, r, "hel વિશ્વlo"),
                new AssertError("testStr failure 2", file, line));
        enforce(test(l, l.length, r, "hello વિશ્વ"),
                new AssertError("testStr failure 3", file, line));
    }

    foreach (T; TypeTuple!(char, wchar, dchar,
        immutable(char), immutable(wchar), immutable(dchar)))
    {
        foreach (U; TypeTuple!(char, wchar, dchar,
            immutable(char), immutable(wchar), immutable(dchar)))
        {
            testStr!(T[], U[])();
        }

    }

    // variadic version
    bool testVar(T, U...)(T orig, size_t pos, U args)
    {
        static if(is(T == typeof(T.init.dup)))
            auto a = orig.dup;
        else
            auto a = orig.idup;
        auto result = args[$-1];

        a.insertInPlace(pos, args[0..$-1]);
        if (!mystd.algorithm.equal(a, result))
            return false;
        return true;
    }
    assert(testVar([1, 2, 3, 4], 0, 6, 7u, [6, 7, 1, 2, 3, 4]));
    assert(testVar([1L, 2, 3, 4], 2, 8, 9L, [1, 2, 8, 9, 3, 4]));
    assert(testVar([1L, 2, 3, 4], 4, 10L, 11, [1, 2, 3, 4, 10, 11]));
    assert(testVar([1L, 2, 3, 4], 4, [10, 11], 40L, 42L,
                    [1, 2, 3, 4, 10, 11, 40, 42]));
    assert(testVar([1L, 2, 3, 4], 4, 10, 11, [40L, 42],
                    [1, 2, 3, 4, 10, 11, 40, 42]));
    assert(testVar("t".idup, 1, 'e', 's', 't', "test"));
    assert(testVar("!!"w.idup, 1, "\u00e9ll\u00f4", 'x', "TTT"w, 'y',
                    "!\u00e9ll\u00f4xTTTy!"));
    assert(testVar("flipflop"d.idup, 4, '_',
                    "xyz"w, '\U00010143', '_', "abc"d, "__",
                    "flip_xyz\U00010143_abc__flop"));
}

unittest
{
    // insertInPlace interop with postblit
    struct Int
    {
        int* payload;
        this(int k)
        {
            payload = new int;
            *payload = k;
        }
        this(this)
        {
            int* np = new int;
            *np = *payload;
            payload = np;
        }
        ~this()
        {
            if (payload)
                *payload = 0; //'destroy' it
        }
        @property int getPayload(){ return *payload; }
        alias getPayload this;
    }

    Int[] arr = [Int(1), Int(4), Int(5)];
    assert(arr[0] == 1);
    insertInPlace(arr, 1, Int(2), Int(3));
    assert(equal(arr, [1, 2, 3, 4, 5]));  //check it works with postblit
}

@safe unittest
{
    assertCTFEable!(
    {
        int[] a = [1, 2];
        a.insertInPlace(2, 3);
        a.insertInPlace(0, -1, 0);
        return a == [-1, 0, 1, 2, 3];
    });
}

unittest // bugzilla 6874
{
    // allocate some space
    byte[] a;
    a.length = 1;

    // fill it
    a.length = a.capacity;

    // write beyond
    byte[] b = a[$ .. $];
    b.insertInPlace(0, a);

    // make sure that reallocation has happened
    assert(GC.addrOf(&b[0]) == GC.addrOf(&b[$-1]));
}


/++
    Returns whether the $(D front)s of $(D lhs) and $(D rhs) both refer to the
    same place in memory, making one of the arrays a slice of the other which
    starts at index $(D 0).
  +/
@safe
pure nothrow bool sameHead(T)(in T[] lhs, in T[] rhs)
{
    return lhs.ptr == rhs.ptr;
}


/++
    Returns whether the $(D back)s of $(D lhs) and $(D rhs) both refer to the
    same place in memory, making one of the arrays a slice of the other which
    end at index $(D $).
  +/
@trusted
pure nothrow bool sameTail(T)(in T[] lhs, in T[] rhs)
{
    return lhs.ptr + lhs.length == rhs.ptr + rhs.length;
}

@safe pure nothrow unittest
{
    foreach(T; TypeTuple!(int[], const(int)[], immutable(int)[], const int[], immutable int[]))
    {
        T a = [1, 2, 3, 4, 5];
        T b = a;
        T c = a[1 .. $];
        T d = a[0 .. 1];
        T e = null;

        assert(sameHead(a, a));
        assert(sameHead(a, b));
        assert(!sameHead(a, c));
        assert(sameHead(a, d));
        assert(!sameHead(a, e));

        assert(sameTail(a, a));
        assert(sameTail(a, b));
        assert(sameTail(a, c));
        assert(!sameTail(a, d));
        assert(!sameTail(a, e));

        //verifies R-value compatibilty
        assert(a.sameHead(a[0 .. 0]));
        assert(a.sameTail(a[$ .. $]));
    }
}

/********************************************
Returns an array that consists of $(D s) (which must be an input
range) repeated $(D n) times. This function allocates, fills, and
returns a new array. For a lazy version, refer to $(XREF range, repeat).
 */
ElementEncodingType!S[] replicate(S)(S s, size_t n) if (isDynamicArray!S)
{
    alias RetType = ElementEncodingType!S[];

    // Optimization for return join(mystd.range.repeat(s, n));
    if (n == 0)
        return RetType.init;
    if (n == 1)
        return cast(RetType) s;
    auto r = new Unqual!(typeof(s[0]))[n * s.length];
    if (s.length == 1)
        r[] = s[0];
    else
    {
        immutable len = s.length, nlen = n * len;
        for (size_t i = 0; i < nlen; i += len)
        {
            r[i .. i + len] = s[];
        }
    }
    return cast(RetType) r;
}

ElementType!S[] replicate(S)(S s, size_t n)
if (isInputRange!S && !isDynamicArray!S)
{
    return join(mystd.range.repeat(s, n));
}

unittest
{
    debug(std_array) printf("array.replicate.unittest\n");

    foreach (S; TypeTuple!(string, wstring, dstring, char[], wchar[], dchar[]))
    {
        S s;
        immutable S t = "abc";

        assert(replicate(to!S("1234"), 0) is null);
        assert(replicate(to!S("1234"), 0) is null);
        assert(replicate(to!S("1234"), 1) == "1234");
        assert(replicate(to!S("1234"), 2) == "12341234");
        assert(replicate(to!S("1"), 4) == "1111");
        assert(replicate(t, 3) == "abcabcabc");
        assert(replicate(cast(S) null, 4) is null);
    }
}

/++
Eagerly split the string $(D s) into an array of words, using whitespace as
delimiter. Runs of whitespace are merged together (no empty words are produced).

$(D @safe), $(D pure) and $(D CTFE)-able.
+/
S[] split(S)(S s) @safe pure
if (isSomeString!S)
{
    size_t istart;
    bool inword = false;
    S[] result;

    foreach (i, dchar c ; s)
    {
        if (mystd.uni.isWhite(c))
        {
            if (inword)
            {
                result ~= s[istart .. i];
                inword = false;
            }
        }
        else
        {
            if (!inword)
            {
                istart = i;
                inword = true;
            }
        }
    }
    if (inword)
        result ~= s[istart .. $];
    return result;
}

unittest
{
    static auto makeEntry(S)(string l, string[] r)
    {return tuple(l.to!S(), r.to!(S[])());}

    foreach (S; TypeTuple!(string, wstring, dstring,))
    {
        auto entries =
        [
            makeEntry!S("", []),
            makeEntry!S(" ", []),
            makeEntry!S("hello", ["hello"]),
            makeEntry!S(" hello ", ["hello"]),
            makeEntry!S("  h  e  l  l  o ", ["h", "e", "l", "l", "o"]),
            makeEntry!S("peter\t\npaul\rjerry", ["peter", "paul", "jerry"]),
            makeEntry!S(" \t\npeter paul\tjerry \n", ["peter", "paul", "jerry"]),
            makeEntry!S("\u2000日\u202F本\u205F語\u3000", ["日", "本", "語"]),
            makeEntry!S("　　哈・郎博尔德｝　　　　___一个", ["哈・郎博尔德｝", "___一个"])
        ];
        foreach (entry; entries)
            assert(entry[0].split() == entry[1], format("got: %s, expected: %s.", entry[0].split(), entry[1]));
    }

    //Just to test that an immutable is split-able
    immutable string s = " \t\npeter paul\tjerry \n";
    assert(split(s) == ["peter", "paul", "jerry"]);
}

unittest //safety, purity, ctfe ...
{
    void dg() @safe pure {
        assert(split("hello world"c) == ["hello"c, "world"c]);
        assert(split("hello world"w) == ["hello"w, "world"w]);
        assert(split("hello world"d) == ["hello"d, "world"d]);
    }
    dg();
    assertCTFEable!dg;
}

/++
Alias for $(XREF algorithm, splitter).
 +/
alias splitter = mystd.algorithm.splitter;

/++
Eagerly splits $(D s) into an array, using $(D delim) as the delimiter.

See also: $(XREF algorithm, splitter) for the lazy version of this operator.
 +/
auto split(R, E)(R r, E delim)
if (isForwardRange!R && is(typeof(ElementType!R.init == E.init)))
{
    auto spl = mystd.algorithm.splitter(r, delim);
    alias S = typeof(spl.front.init); // "Slice_t"
    auto app = appender!(S[])();
    foreach (e; spl)
        app.put(e);
    return app.data;
}
auto split(R1, R2)(R1 r, R2 delim)
if (isForwardRange!R1 && isForwardRange!R2 && is(typeof(ElementType!R1.init == ElementType!R2.init)))
{
    auto spl = mystd.algorithm.splitter(r, delim);
    alias S = typeof(spl.front.init); // "Slice_t"
    auto app = appender!(S[])();
    foreach (e; spl)
        app.put(e);
    return app.data;
}
///ditto
auto split(alias isTerminator, R)(R r)
if (isForwardRange!R && is(typeof(unaryFun!isTerminator(r.front))))
{
    auto spl = mystd.algorithm.splitter!isTerminator(r);
    alias S = typeof(spl.front.init); // "Slice_t"
    auto app = appender!(S[])();
    foreach (e; spl)
        app.put(e);
    return app.data;
}

unittest
{
    debug(std_array) printf("array.split\n");
    foreach (S; TypeTuple!(string, wstring, dstring,
                    immutable(string), immutable(wstring), immutable(dstring),
                    char[], wchar[], dchar[],
                    const(char)[], const(wchar)[], const(dchar)[],
                    const(char[]), immutable(char[])))
    {
        S s = to!S(",peter,paul,jerry,");

        auto words = split(s, ",");
        assert(words.length == 5, text(words.length));
        assert(cmp(words[0], "") == 0);
        assert(cmp(words[1], "peter") == 0);
        assert(cmp(words[2], "paul") == 0);
        assert(cmp(words[3], "jerry") == 0);
        assert(cmp(words[4], "") == 0);

        auto s1 = s[0 .. s.length - 1];   // lop off trailing ','
        words = split(s1, ",");
        assert(words.length == 4);
        assert(cmp(words[3], "jerry") == 0);

        auto s2 = s1[1 .. s1.length];   // lop off leading ','
        words = split(s2, ",");
        assert(words.length == 3);
        assert(cmp(words[0], "peter") == 0);

        auto s3 = to!S(",,peter,,paul,,jerry,,");

        words = split(s3, ",,");
        assert(words.length == 5);
        assert(cmp(words[0], "") == 0);
        assert(cmp(words[1], "peter") == 0);
        assert(cmp(words[2], "paul") == 0);
        assert(cmp(words[3], "jerry") == 0);
        assert(cmp(words[4], "") == 0);

        auto s4 = s3[0 .. s3.length - 2];    // lop off trailing ',,'
        words = split(s4, ",,");
        assert(words.length == 4);
        assert(cmp(words[3], "jerry") == 0);

        auto s5 = s4[2 .. s4.length];    // lop off leading ',,'
        words = split(s5, ",,");
        assert(words.length == 3);
        assert(cmp(words[0], "peter") == 0);
    }
}


/++
   Concatenates all of the ranges in $(D ror) together into one array using
   $(D sep) as the separator if present.
  +/
ElementEncodingType!(ElementType!RoR)[] join(RoR, R)(RoR ror, R sep)
    if(isInputRange!RoR &&
       isInputRange!(Unqual!(ElementType!RoR)) &&
       isInputRange!R &&
       is(Unqual!(ElementType!(ElementType!RoR)) == Unqual!(ElementType!R)))
{
    alias RoRElem = ElementType!RoR;
    alias RetType = typeof(return);

    if (ror.empty)
        return RetType.init;

    // Constraint only requires input range for sep.
    // This converts sep to an array (forward range) if it isn't one,
    // and makes sure it has the same string encoding for string types.
    static if (isSomeString!RetType &&
               !is(Unqual!(ElementEncodingType!RetType) == Unqual!(ElementEncodingType!R)))
        auto sepArr = to!RetType(sep);
    else static if (!isArray!R)
        auto sepArr = array(sep);
    else
        alias sepArr = sep;

    auto result = appender!RetType();
    static if(isForwardRange!RoR &&
              (isNarrowString!RetType || hasLength!RoRElem))
    {
        // Reserve appender length if it can be computed.
        size_t resultLen = 0;
        immutable sepArrLength = sepArr.length;
        for (auto temp = ror.save; !temp.empty; temp.popFront())
            resultLen += temp.front.length + sepArrLength;
        resultLen -= sepArrLength;
        result.reserve(resultLen);
        version(unittest) scope(exit) assert(result.data.length == resultLen);
    }
    put(result, ror.front);
    ror.popFront();
    for (; !ror.empty; ror.popFront())
    {
        put(result, sepArr);
        put(result, ror.front);
    }
    return result.data;
}

/// Ditto
ElementEncodingType!(ElementType!RoR)[] join(RoR)(RoR ror)
    if(isInputRange!RoR &&
       isInputRange!(Unqual!(ElementType!RoR)))
{
    alias RetType = typeof(return);

    if (ror.empty)
        return RetType.init;

    alias R = ElementType!RoR;
    auto result = appender!RetType();
    static if(isForwardRange!RoR && (hasLength!R || isNarrowString!R))
    {
        // Reserve appender length if it can be computed.
        immutable resultLen = reduce!("a + b.length")(cast(size_t) 0, ror.save);
        result.reserve(resultLen);
        version(unittest) scope(exit) assert(result.data.length == resultLen);
    }
    for (; !ror.empty; ror.popFront())
        put(result, ror.front);
    return result.data;
}

///
@safe pure nothrow unittest
{
    assert(join(["hello", "silly", "world"], " ") == "hello silly world");
    assert(join(["hello", "silly", "world"]) == "hellosillyworld");

    assert(join([[1, 2, 3], [4, 5]], [72, 73]) == [1, 2, 3, 72, 73, 4, 5]);
    assert(join([[1, 2, 3], [4, 5]]) == [1, 2, 3, 4, 5]);

    const string[] arr = ["apple", "banana"];
    assert(arr.join(",") == "apple,banana");
    assert(arr.join() == "applebanana");
}

unittest
{
    debug(std_array) printf("array.join.unittest\n");

    foreach(R; TypeTuple!(string, wstring, dstring))
    {
        R word1 = "日本語";
        R word2 = "paul";
        R word3 = "jerry";
        R[] words = [word1, word2, word3];

        auto filteredWord1    = filter!"true"(word1);
        auto filteredLenWord1 = takeExactly(filteredWord1, word1.walkLength());
        auto filteredWord2    = filter!"true"(word2);
        auto filteredLenWord2 = takeExactly(filteredWord2, word2.walkLength());
        auto filteredWord3    = filter!"true"(word3);
        auto filteredLenWord3 = takeExactly(filteredWord3, word3.walkLength());
        auto filteredWordsArr = [filteredWord1, filteredWord2, filteredWord3];
        auto filteredLenWordsArr = [filteredLenWord1, filteredLenWord2, filteredLenWord3];
        auto filteredWords    = filter!"true"(filteredWordsArr);

        foreach(S; TypeTuple!(string, wstring, dstring))
        {
            assert(join(filteredWords, to!S(", ")) == "日本語, paul, jerry");
            assert(join(filteredWordsArr, to!S(", ")) == "日本語, paul, jerry");
            assert(join(filteredLenWordsArr, to!S(", ")) == "日本語, paul, jerry");
            assert(join(filter!"true"(words), to!S(", ")) == "日本語, paul, jerry");
            assert(join(words, to!S(", ")) == "日本語, paul, jerry");

            assert(join(filteredWords, to!S("")) == "日本語pauljerry");
            assert(join(filteredWordsArr, to!S("")) == "日本語pauljerry");
            assert(join(filteredLenWordsArr, to!S("")) == "日本語pauljerry");
            assert(join(filter!"true"(words), to!S("")) == "日本語pauljerry");
            assert(join(words, to!S("")) == "日本語pauljerry");

            assert(join(filter!"true"([word1]), to!S(", ")) == "日本語");
            assert(join([filteredWord1], to!S(", ")) == "日本語");
            assert(join([filteredLenWord1], to!S(", ")) == "日本語");
            assert(join(filter!"true"([filteredWord1]), to!S(", ")) == "日本語");
            assert(join([word1], to!S(", ")) == "日本語");

            assert(join(filteredWords, to!S(word1)) == "日本語日本語paul日本語jerry");
            assert(join(filteredWordsArr, to!S(word1)) == "日本語日本語paul日本語jerry");
            assert(join(filteredLenWordsArr, to!S(word1)) == "日本語日本語paul日本語jerry");
            assert(join(filter!"true"(words), to!S(word1)) == "日本語日本語paul日本語jerry");
            assert(join(words, to!S(word1)) == "日本語日本語paul日本語jerry");

            auto filterComma = filter!"true"(to!S(", "));
            assert(join(filteredWords, filterComma) == "日本語, paul, jerry");
            assert(join(filteredWordsArr, filterComma) == "日本語, paul, jerry");
            assert(join(filteredLenWordsArr, filterComma) == "日本語, paul, jerry");
            assert(join(filter!"true"(words), filterComma) == "日本語, paul, jerry");
            assert(join(words, filterComma) == "日本語, paul, jerry");
        }

        assert(join(filteredWords) == "日本語pauljerry");
        assert(join(filteredWordsArr) == "日本語pauljerry");
        assert(join(filteredLenWordsArr) == "日本語pauljerry");
        assert(join(filter!"true"(words)) == "日本語pauljerry");
        assert(join(words) == "日本語pauljerry");

        assert(join(filteredWords, filter!"true"(", ")) == "日本語, paul, jerry");
        assert(join(filteredWordsArr, filter!"true"(", ")) == "日本語, paul, jerry");
        assert(join(filteredLenWordsArr, filter!"true"(", ")) == "日本語, paul, jerry");
        assert(join(filter!"true"(words), filter!"true"(", ")) == "日本語, paul, jerry");
        assert(join(words, filter!"true"(", ")) == "日本語, paul, jerry");

        assert(join(filter!"true"(cast(typeof(filteredWordsArr))[]), ", ").empty);
        assert(join(cast(typeof(filteredWordsArr))[], ", ").empty);
        assert(join(cast(typeof(filteredLenWordsArr))[], ", ").empty);
        assert(join(filter!"true"(cast(R[])[]), ", ").empty);
        assert(join(cast(R[])[], ", ").empty);

        assert(join(filter!"true"(cast(typeof(filteredWordsArr))[])).empty);
        assert(join(cast(typeof(filteredWordsArr))[]).empty);
        assert(join(cast(typeof(filteredLenWordsArr))[]).empty);

        assert(join(filter!"true"(cast(R[])[])).empty);
        assert(join(cast(R[])[]).empty);
    }

    assert(join([[1, 2], [41, 42]], [5, 6]) == [1, 2, 5, 6, 41, 42]);
    assert(join([[1, 2], [41, 42]], cast(int[])[]) == [1, 2, 41, 42]);
    assert(join([[1, 2]], [5, 6]) == [1, 2]);
    assert(join(cast(int[][])[], [5, 6]).empty);

    assert(join([[1, 2], [41, 42]]) == [1, 2, 41, 42]);
    assert(join(cast(int[][])[]).empty);

    alias f = filter!"true";
    assert(join([[1, 2], [41, 42]],          [5, 6]) == [1, 2, 5, 6, 41, 42]);
    assert(join(f([[1, 2], [41, 42]]),       [5, 6]) == [1, 2, 5, 6, 41, 42]);
    assert(join([f([1, 2]), f([41, 42])],    [5, 6]) == [1, 2, 5, 6, 41, 42]);
    assert(join(f([f([1, 2]), f([41, 42])]), [5, 6]) == [1, 2, 5, 6, 41, 42]);
    assert(join([[1, 2], [41, 42]],          f([5, 6])) == [1, 2, 5, 6, 41, 42]);
    assert(join(f([[1, 2], [41, 42]]),       f([5, 6])) == [1, 2, 5, 6, 41, 42]);
    assert(join([f([1, 2]), f([41, 42])],    f([5, 6])) == [1, 2, 5, 6, 41, 42]);
    assert(join(f([f([1, 2]), f([41, 42])]), f([5, 6])) == [1, 2, 5, 6, 41, 42]);
}


/++
    Replace occurrences of $(D from) with $(D to) in $(D subject). Returns a new
    array without changing the contents of $(D subject), or the original array
    if no match is found.
 +/
E[] replace(E, R1, R2)(E[] subject, R1 from, R2 to)
if (isDynamicArray!(E[]) && isForwardRange!R1 && isForwardRange!R2
        && (hasLength!R2 || isSomeString!R2))
{
    if (from.empty) return subject;

    auto balance = mystd.algorithm.find(subject, from.save);
    if (balance.empty)
        return subject;

    auto app = appender!(E[])();
    app.put(subject[0 .. subject.length - balance.length]);
    app.put(to.save);
    replaceInto(app, balance[from.length .. $], from, to);

    return app.data;
}

/++
    Same as above, but outputs the result via OutputRange $(D sink).
    If no match is found the original array is transfered to $(D sink) as is.
+/
void replaceInto(E, Sink, R1, R2)(Sink sink, E[] subject, R1 from, R2 to)
if (isOutputRange!(Sink, E) && isDynamicArray!(E[])
    && isForwardRange!R1 && isForwardRange!R2
    && (hasLength!R2 || isSomeString!R2))
{
    if (from.empty)
    {
        sink.put(subject);
        return;
    }
    for (;;)
    {
        auto balance = mystd.algorithm.find(subject, from.save);
        if (balance.empty)
        {
            sink.put(subject);
            break;
        }
        sink.put(subject[0 .. subject.length - balance.length]);
        sink.put(to.save);
        subject = balance[from.length .. $];
    }
}

unittest
{
    debug(std_array) printf("array.replace.unittest\n");

    foreach (S; TypeTuple!(string, wstring, dstring, char[], wchar[], dchar[]))
    {
        auto s = to!S("This is a foo foo list");
        auto from = to!S("foo");
        auto into = to!S("silly");
        S r;
        int i;

        r = replace(s, from, into);
        i = cmp(r, "This is a silly silly list");
        assert(i == 0);

        r = replace(s, to!S(""), into);
        i = cmp(r, "This is a foo foo list");
        assert(i == 0);

        assert(replace(r, to!S("won't find this"), to!S("whatever")) is r);
    }

    immutable s = "This is a foo foo list";
    assert(replace(s, "foo", "silly") == "This is a silly silly list");
}

unittest
{
    struct CheckOutput(C)
    {
        C[] desired;
        this(C[] arr){ desired = arr; }
        void put(C[] part){ assert(skipOver(desired, part)); }
    }
    foreach (S; TypeTuple!(string, wstring, dstring, char[], wchar[], dchar[]))
    {
        alias Char = ElementEncodingType!S;
        S s = to!S("yet another dummy text, yet another ...");
        S from = to!S("yet another");
        S into = to!S("some");
        replaceInto(CheckOutput!(Char)(to!S("some dummy text, some ..."))
                    , s, from, into);
    }
}

/+
Commented out until the replace which has been deprecated has been removed.
I'd love to just remove it in favor of replaceInPlace, but then code would then
use this version of replaceInPlace and silently break. So, it's here so that it
can be used once replace has not only been deprecated but removed, but
until then, it's commented out.

/++
    Replaces elements from $(D array) with indices ranging from $(D from)
    (inclusive) to $(D to) (exclusive) with the range $(D stuff). Returns a new
    array without changing the contents of $(D subject).

    Examples:
    --------------------
    auto a = [ 1, 2, 3, 4 ];
    auto b = a.replace(1, 3, [ 9, 9, 9 ]);
    assert(a == [ 1, 2, 3, 4 ]);
    assert(b == [ 1, 9, 9, 9, 4 ]);
    --------------------
 +/
T[] replace(T, Range)(T[] subject, size_t from, size_t to, Range stuff)
    if(isInputRange!Range &&
       (is(ElementType!Range : T) ||
        isSomeString!(T[]) && is(ElementType!Range : dchar)))
{
    static if(hasLength!Range && is(ElementEncodingType!Range : T))
    {
        assert(from <= to);
        immutable sliceLen = to - from;
        auto retval = new Unqual!(T)[](subject.length - sliceLen + stuff.length);
        retval[0 .. from] = subject[0 .. from];

        if(!stuff.empty)
            copy(stuff, retval[from .. from + stuff.length]);

        retval[from + stuff.length .. $] = subject[to .. $];
        return cast(T[])retval;
    }
    else
    {
        auto app = appender!(T[])();
        app.put(subject[0 .. from]);
        app.put(stuff);
        app.put(subject[to .. $]);
        return app.data;
    }
}

//Verify Examples.
unittest
{
    auto a = [ 1, 2, 3, 4 ];
    auto b = a.replace(1, 3, [ 9, 9, 9 ]);
    assert(a == [ 1, 2, 3, 4 ]);
    assert(b == [ 1, 9, 9, 9, 4 ]);
}

unittest
{
    auto a = [ 1, 2, 3, 4 ];
    assert(replace(a, 0, 0, [5, 6, 7]) == [5, 6, 7, 1, 2, 3, 4]);
    assert(replace(a, 0, 2, cast(int[])[]) == [3, 4]);
    assert(replace(a, 0, 4, [5, 6, 7]) == [5, 6, 7]);
    assert(replace(a, 0, 2, [5, 6, 7]) == [5, 6, 7, 3, 4]);
    assert(replace(a, 2, 4, [5, 6, 7]) == [1, 2, 5, 6, 7]);

    assert(replace(a, 0, 0, filter!"true"([5, 6, 7])) == [5, 6, 7, 1, 2, 3, 4]);
    assert(replace(a, 0, 2, filter!"true"(cast(int[])[])) == [3, 4]);
    assert(replace(a, 0, 4, filter!"true"([5, 6, 7])) == [5, 6, 7]);
    assert(replace(a, 0, 2, filter!"true"([5, 6, 7])) == [5, 6, 7, 3, 4]);
    assert(replace(a, 2, 4, filter!"true"([5, 6, 7])) == [1, 2, 5, 6, 7]);
    assert(a == [ 1, 2, 3, 4 ]);

    auto testStr(T, U)(string file = __FILE__, size_t line = __LINE__)
    {

        auto l = to!T("hello");
        auto r = to!U(" world");

        enforce(replace(l, 0, 0, r) == " worldhello",
                new AssertError("testStr failure 1", file, line));
        enforce(replace(l, 0, 3, r) == " worldlo",
                new AssertError("testStr failure 2", file, line));
        enforce(replace(l, 3, l.length, r) == "hel world",
                new AssertError("testStr failure 3", file, line));
        enforce(replace(l, 0, l.length, r) == " world",
                new AssertError("testStr failure 4", file, line));
        enforce(replace(l, l.length, l.length, r) == "hello world",
                new AssertError("testStr failure 5", file, line));
    }

    testStr!(string, string)();
    testStr!(string, wstring)();
    testStr!(string, dstring)();
    testStr!(wstring, string)();
    testStr!(wstring, wstring)();
    testStr!(wstring, dstring)();
    testStr!(dstring, string)();
    testStr!(dstring, wstring)();
    testStr!(dstring, dstring)();
}
+/

/++
    Replaces elements from $(D array) with indices ranging from $(D from)
    (inclusive) to $(D to) (exclusive) with the range $(D stuff). Expands or
    shrinks the array as needed.

    Example:
    ---
    int[] a = [ 1, 2, 3, 4 ];
    a.replaceInPlace(1, 3, [ 9, 9, 9 ]);
    assert(a == [ 1, 9, 9, 9, 4 ]);
    ---
 +/
void replaceInPlace(T, Range)(ref T[] array, size_t from, size_t to, Range stuff)
    if(isDynamicArray!Range &&
       is(ElementEncodingType!Range : T) &&
       !is(T == const T) &&
       !is(T == immutable T))
{
    if (overlap(array, stuff).length)
    {
        // use slower/conservative method
        array = array[0 .. from] ~ stuff ~ array[to .. $];
    }
    else if (stuff.length <= to - from)
    {
        // replacement reduces length
        immutable stuffEnd = from + stuff.length;
        array[from .. stuffEnd] = stuff[];
        array = remove(array, tuple(stuffEnd, to));
    }
    else
    {
        // replacement increases length
        // @@@TODO@@@: optimize this
        immutable replaceLen = to - from;
        array[from .. to] = stuff[0 .. replaceLen];
        insertInPlace(array, to, stuff[replaceLen .. $]);
    }
}

void replaceInPlace(T, Range)(ref T[] array, size_t from, size_t to, Range stuff)
    if(isInputRange!Range &&
       ((!isDynamicArray!Range && is(ElementType!Range : T)) ||
        (isDynamicArray!Range && is(ElementType!Range : T) &&
             (is(T == const T) || is(T == immutable T))) ||
        isSomeString!(T[]) && is(ElementType!Range : dchar)))
{
    auto app = appender!(T[])();
    app.put(array[0 .. from]);
    app.put(stuff);
    app.put(array[to .. $]);
    array = app.data;

    //This simplified version can be used once the old replace has been removed
    //and the new one uncommented out.
    //array = replace(array, from, to stuff);
}

//Verify Examples.
unittest
{
    int[] a = [1, 4, 5];
    replaceInPlace(a, 1u, 2u, [2, 3, 4]);
    assert(a == [1, 2, 3, 4, 5]);
    replaceInPlace(a, 1u, 2u, cast(int[])[]);
    assert(a == [1, 3, 4, 5]);
    replaceInPlace(a, 1u, 3u, a[2 .. 4]);
    assert(a == [1, 4, 5, 5]);
}

unittest
{
    bool test(T, U, V)(T orig, size_t from, size_t to, U toReplace, V result,
               string file = __FILE__, size_t line = __LINE__)
    {
        {
            static if(is(T == typeof(T.init.dup)))
                auto a = orig.dup;
            else
                auto a = orig.idup;

            a.replaceInPlace(from, to, toReplace);
            if(!mystd.algorithm.equal(a, result))
                return false;
        }

        static if(isInputRange!U)
        {
            orig.replaceInPlace(from, to, filter!"true"(toReplace));
            return mystd.algorithm.equal(orig, result);
        }
        else
            return true;
    }

    assert(test([1, 2, 3, 4], 0, 0, [5, 6, 7], [5, 6, 7, 1, 2, 3, 4]));
    assert(test([1, 2, 3, 4], 0, 2, cast(int[])[], [3, 4]));
    assert(test([1, 2, 3, 4], 0, 4, [5, 6, 7], [5, 6, 7]));
    assert(test([1, 2, 3, 4], 0, 2, [5, 6, 7], [5, 6, 7, 3, 4]));
    assert(test([1, 2, 3, 4], 2, 4, [5, 6, 7], [1, 2, 5, 6, 7]));

    assert(test([1, 2, 3, 4], 0, 0, filter!"true"([5, 6, 7]), [5, 6, 7, 1, 2, 3, 4]));
    assert(test([1, 2, 3, 4], 0, 2, filter!"true"(cast(int[])[]), [3, 4]));
    assert(test([1, 2, 3, 4], 0, 4, filter!"true"([5, 6, 7]), [5, 6, 7]));
    assert(test([1, 2, 3, 4], 0, 2, filter!"true"([5, 6, 7]), [5, 6, 7, 3, 4]));
    assert(test([1, 2, 3, 4], 2, 4, filter!"true"([5, 6, 7]), [1, 2, 5, 6, 7]));

    auto testStr(T, U)(string file = __FILE__, size_t line = __LINE__)
    {

        auto l = to!T("hello");
        auto r = to!U(" world");

        enforce(test(l, 0, 0, r, " worldhello"),
                new AssertError("testStr failure 1", file, line));
        enforce(test(l, 0, 3, r, " worldlo"),
                new AssertError("testStr failure 2", file, line));
        enforce(test(l, 3, l.length, r, "hel world"),
                new AssertError("testStr failure 3", file, line));
        enforce(test(l, 0, l.length, r, " world"),
                new AssertError("testStr failure 4", file, line));
        enforce(test(l, l.length, l.length, r, "hello world"),
                new AssertError("testStr failure 5", file, line));
    }

    testStr!(string, string)();
    testStr!(string, wstring)();
    testStr!(string, dstring)();
    testStr!(wstring, string)();
    testStr!(wstring, wstring)();
    testStr!(wstring, dstring)();
    testStr!(dstring, string)();
    testStr!(dstring, wstring)();
    testStr!(dstring, dstring)();
}

/++
    Replaces the first occurrence of $(D from) with $(D to) in $(D a). Returns a
    new array without changing the contents of $(D subject), or the original
    array if no match is found.
 +/
E[] replaceFirst(E, R1, R2)(E[] subject, R1 from, R2 to)
if (isDynamicArray!(E[]) &&
    isForwardRange!R1 && is(typeof(appender!(E[])().put(from[0 .. 1]))) &&
    isForwardRange!R2 && is(typeof(appender!(E[])().put(to[0 .. 1]))))
{
    if (from.empty) return subject;
    auto balance = mystd.algorithm.find(subject, from.save);
    if (balance.empty) return subject;
    auto app = appender!(E[])();
    app.put(subject[0 .. subject.length - balance.length]);
    app.put(to.save);
    app.put(balance[from.length .. $]);

    return app.data;
}

unittest
{
    debug(std_array) printf("array.replaceFirst.unittest\n");

    foreach(S; TypeTuple!(string, wstring, dstring, char[], wchar[], dchar[],
                          const(char[]), immutable(char[])))
    {
        alias T = Unqual!S;

        auto s = to!S("This is a foo foo list");
        auto from = to!T("foo");
        auto into = to!T("silly");

        S r1 = replaceFirst(s, from, into);
        assert(cmp(r1, "This is a silly foo list") == 0);

        S r2 = replaceFirst(r1, from, into);
        assert(cmp(r2, "This is a silly silly list") == 0);

        S r3 = replaceFirst(s, to!T(""), into);
        assert(cmp(r3, "This is a foo foo list") == 0);

        assert(replaceFirst(r3, to!T("won't find"), to!T("whatever")) is r3);
    }
}

//Bug# 8187
unittest
{
    auto res = ["a", "a"];
    assert(replace(res, "a", "b") == ["b", "b"]);
    assert(replaceFirst(res, "a", "b") == ["b", "a"]);
}

/++
    Returns a new array that is $(D s) with $(D slice) replaced by
    $(D replacement[]).
 +/
inout(T)[] replaceSlice(T)(inout(T)[] s, in T[] slice, in T[] replacement)
in
{
    // Verify that slice[] really is a slice of s[]
    assert(overlap(s, slice) is slice);
}
body
{
    auto result = new T[s.length - slice.length + replacement.length];
    immutable so = slice.ptr - s.ptr;
    result[0 .. so] = s[0 .. so];
    result[so .. so + replacement.length] = replacement[];
    result[so + replacement.length .. result.length] =
        s[so + slice.length .. s.length];

    return cast(inout(T)[]) result;
}

unittest
{
    debug(std_array) printf("array.replaceSlice.unittest\n");

    string s = "hello";
    string slice = s[2 .. 4];

    auto r = replaceSlice(s, slice, "bar");
    int i;
    i = cmp(r, "hebaro");
    assert(i == 0);
}

/**
Implements an output range that appends data to an array. This is
recommended over $(D a ~= data) when appending many elements because it is more
efficient.

Example:
----
auto app = appender!string();
string b = "abcdefg";
foreach (char c; b) app.put(c);
assert(app.data == "abcdefg");

int[] a = [ 1, 2 ];
auto app2 = appender(a);
app2.put(3);
app2.put([ 4, 5, 6 ]);
assert(app2.data == [ 1, 2, 3, 4, 5, 6 ]);
----
 */
struct Appender(A : T[], T)
{
    private struct Data
    {
        size_t capacity;
        Unqual!T[] arr;
    }

    private Data* _data;

    /**
     * Construct an appender with a given array.  Note that this does not copy the
     * data.  If the array has a larger capacity as determined by arr.capacity,
     * it will be used by the appender.  After initializing an appender on an array,
     * appending to the original array will reallocate.
     */
    this(Unqual!T[] arr) @safe pure nothrow
    {
        // initialize to a given array.
        _data = new Data;
        _data.arr = arr;

        if (__ctfe)
            return;

        // We want to use up as much of the block the array is in as possible.
        // if we consume all the block that we can, then array appending is
        // safe WRT built-in append, and we can use the entire block.
        auto cap = ()@trusted{ return arr.capacity; }();
        if (cap > arr.length)
            arr = ()@trusted{ return arr.ptr[0 .. cap]; }();
        // we assume no reallocation occurred
        assert(arr.ptr is _data.arr.ptr);
        _data.capacity = arr.length;
    }

    /**
     * Reserve at least newCapacity elements for appending.  Note that more elements
     * may be reserved than requested.  If newCapacity <= capacity, then nothing is
     * done.
     */
    void reserve(size_t newCapacity) @safe pure nothrow
    {
        if (_data)
        {
            if (newCapacity > _data.capacity)
                ensureAddable(newCapacity - _data.arr.length);
        }
        else
        {
            ensureAddable(newCapacity);
        }
    }

    /**
     * Returns the capacity of the array (the maximum number of elements the
     * managed array can accommodate before triggering a reallocation).  If any
     * appending will reallocate, $(D capacity) returns $(D 0).
     */
    @property size_t capacity() const @safe pure nothrow
    {
        return _data ? _data.capacity : 0;
    }

    /**
     * Returns the managed array.
     */
    @property inout(T)[] data() inout @trusted pure nothrow
    {
        /* @trusted operation:
         * casting Unqual!T[] to inout(T)[]
         */
        return cast(typeof(return))(_data ? _data.arr : null);
    }

    // ensure we can add nelems elements, resizing as necessary
    private void ensureAddable(size_t nelems) @safe pure nothrow
    {
        if (!_data)
            _data = new Data;
        immutable len = _data.arr.length;
        immutable reqlen = len + nelems;

        if (_data.capacity >= reqlen)
            return;

        // need to increase capacity
        if (__ctfe)
        {
            static if (__traits(compiles, new Unqual!T[1]))
            {
                _data.arr.length = reqlen;
            }
            else
            {
                // avoid restriction of @disable this()
                ()@trusted{ _data.arr = _data.arr[0 .. _data.capacity]; }();
                foreach (i; _data.capacity .. reqlen)
                    _data.arr ~= Unqual!T.init;
            }
            _data.arr = _data.arr[0 .. len];
            _data.capacity = reqlen;
        }
        else
        {
            // Time to reallocate.
            // We need to almost duplicate what's in druntime, except we
            // have better access to the capacity field.
            auto newlen = appenderNewCapacity!(T.sizeof)(_data.capacity, reqlen);
            // first, try extending the current block
            auto u = ()@trusted{ return
                GC.extend(_data.arr.ptr, nelems * T.sizeof, (newlen - len) * T.sizeof);
            }();
            if (u)
            {
                // extend worked, update the capacity
                _data.capacity = u / T.sizeof;
            }
            else
            {
                // didn't work, must reallocate
                auto bi = ()@trusted{ return
                    GC.qalloc(newlen * T.sizeof, (typeid(T[]).next.flags & 1) ? 0 : GC.BlkAttr.NO_SCAN);
                }();
                _data.capacity = bi.size / T.sizeof;
                if (len)
                    ()@trusted{ memcpy(bi.base, _data.arr.ptr, len * T.sizeof); }();
                _data.arr = ()@trusted{ return (cast(Unqual!T*)bi.base)[0 .. len]; }();
                // leave the old data, for safety reasons
            }
        }
    }

    private template canPutItem(U)
    {
        enum bool canPutItem =
            isImplicitlyConvertible!(U, T) ||
            isSomeChar!T && isSomeChar!U;
    }
    private template canPutConstRange(Range)
    {
        enum bool canPutConstRange =
            isInputRange!(Unqual!Range) &&
            !isInputRange!Range;
    }
    private template canPutRange(Range)
    {
        enum bool canPutRange =
            isInputRange!Range &&
            is(typeof(Appender.init.put(Range.init.front)));
    }

    /**
     * Appends one item to the managed array.
     */
    void put(U)(U item) if (canPutItem!U)
    {
        static if (isSomeChar!T && isSomeChar!U && T.sizeof < U.sizeof)
        {
            /* may throwable operation:
             * - mystd.utf.encode
             */
            // must do some transcoding around here
            Unqual!T[T.sizeof == 1 ? 4 : 2] encoded;
            auto len = mystd.utf.encode(encoded, item);
            put(encoded[0 .. len]);
        }
        else
        {
            ensureAddable(1);
            immutable len = _data.arr.length;

            auto bigDataFun() @trusted nothrow { return _data.arr.ptr[0 .. len + 1];}
            auto bigData = bigDataFun();

            static if (is(Unqual!T == T))
                alias uitem = item;
            else
                auto ref uitem() @trusted nothrow @property { return cast(Unqual!T)item;}

            emplaceRef(bigData[len], uitem);

            //We do this at the end, in case of exceptions
            _data.arr = bigData;
        }
    }

    // Const fixing hack.
    void put(Range)(Range items) if (canPutConstRange!Range)
    {
        alias p = put!(Unqual!Range);
        p(items);
    }

    /**
     * Appends an entire range to the managed array.
     */
    void put(Range)(Range items) if (canPutRange!Range)
    {
        // note, we disable this branch for appending one type of char to
        // another because we can't trust the length portion.
        static if (!(isSomeChar!T && isSomeChar!(ElementType!Range) &&
                     !is(immutable Range == immutable T[])) &&
                    is(typeof(items.length) == size_t))
        {
            // optimization -- if this type is something other than a string,
            // and we are adding exactly one element, call the version for one
            // element.
            static if (!isSomeChar!T)
            {
                if (items.length == 1)
                {
                    put(items.front);
                    return;
                }
            }

            // make sure we have enough space, then add the items
            ensureAddable(items.length);
            immutable len = _data.arr.length;
            immutable newlen = len + items.length;

            auto bigDataFun() @trusted nothrow { return _data.arr.ptr[0 .. newlen];}
            auto bigData = bigDataFun();

            enum mustEmplace =  is(typeof(bigData[0].opAssign(cast(Unqual!T)items.front))) ||
                               !is(typeof(bigData[0] = cast(Unqual!T)items.front));

            static if (is(typeof(_data.arr[] = items[])) && !mustEmplace)
            {
                //pragma(msg, T.stringof); pragma(msg, Range.stringof);
                bigData[len .. newlen] = items[];
            }
            else static if (is(Unqual!T == ElementType!Range))
            {
                foreach (ref it ; bigData[len .. newlen])
                {
                    emplaceRef(it, items.front);
                    items.popFront();
                }
            }
            else
            {
                static auto ref getUItem(U)(U item) @trusted {return cast(Unqual!T)item;}
                foreach (ref it ; bigData[len .. newlen])
                {
                    emplaceRef(it, getUItem(items.front));
                    items.popFront();
                }
            }

            //We do this at the end, in case of exceptions
            _data.arr = bigData;
        }
        else
        {
            //pragma(msg, Range.stringof);
            // Generic input range
            for (; !items.empty; items.popFront())
            {
                put(items.front);
            }
        }
    }

    /**
     * Appends one item to the managed array.
     */
    void opOpAssign(string op : "~", U)(U item) if (canPutItem!U)
    {
        put(item);
    }

    // Const fixing hack.
    void opOpAssign(string op : "~", Range)(Range items) if (canPutConstRange!Range)
    {
        put(items);
    }

    /**
     * Appends an entire range to the managed array.
     */
    void opOpAssign(string op : "~", Range)(Range items) if (canPutRange!Range)
    {
        put(items);
    }

    // only allow overwriting data on non-immutable and non-const data
    static if (isMutable!T)
    {
        /**
         * Clears the managed array.  This allows the elements of the array to be reused
         * for appending.
         *
         * Note that clear is disabled for immutable or const element types, due to the
         * possibility that $(D Appender) might overwrite immutable data.
         */
        void clear() @safe pure nothrow
        {
            if (_data)
            {
                _data.arr = ()@trusted{ return _data.arr.ptr[0 .. 0]; }();
            }
        }

        /**
         * Shrinks the managed array to the given length.
         *
         * Throws: $(D Exception) if newlength is greater than the current array length.
         */
        void shrinkTo(size_t newlength) @safe pure
        {
            if (_data)
            {
                enforce(newlength <= _data.arr.length);
                _data.arr = ()@trusted{ return _data.arr.ptr[0 .. newlength]; }();
            }
            else
                enforce(newlength == 0);
        }
    }
}

//Calculates an efficient growth scheme based on the old capacity
//of data, and the minimum requested capacity.
//arg curLen: The current length
//arg reqLen: The length as requested by the user
//ret sugLen: A suggested growth.
private size_t appenderNewCapacity(size_t TSizeOf)(size_t curLen, size_t reqLen) @safe pure nothrow
{
    if(curLen == 0)
        return max(reqLen,8);
    ulong mult = 100 + (1000UL) / (bsr(curLen * TSizeOf) + 1);
    // limit to doubling the length, we don't want to grow too much
    if(mult > 200)
        mult = 200;
    auto sugLen = cast(size_t)((curLen * mult + 99) / 100);
    return max(reqLen, sugLen);
}

/**
 * An appender that can update an array in-place.  It forwards all calls to an
 * underlying appender implementation.  Any calls made to the appender also update
 * the pointer to the original array passed in.
 */
struct RefAppender(A : T[], T)
{
    private
    {
        Appender!(A, T) impl;
        T[] *arr;
    }

    /**
     * Construct a ref appender with a given array reference.  This does not copy the
     * data.  If the array has a larger capacity as determined by arr.capacity, it
     * will be used by the appender.  $(D RefAppender) assumes that arr is a non-null
     * value.
     *
     * Note, do not use builtin appending (i.e. ~=) on the original array passed in
     * until you are done with the appender, because calls to the appender override
     * those appends.
     */
    this(T[] *arr)
    {
        impl = Appender!(A, T)(*arr);
        this.arr = arr;
    }

    auto opDispatch(string fn, Args...)(Args args) if (is(typeof(mixin("impl." ~ fn ~ "(args)"))))
    {
        // we do it this way because we can't cache a void return
        scope(exit) *this.arr = impl.data;
        mixin("return impl." ~ fn ~ "(args);");
    }

    private alias AppenderType = Appender!(A, T);

    /**
     * Appends one item to the managed array.
     */
    void opOpAssign(string op : "~", U)(U item) if (AppenderType.canPutItem!U)
    {
        scope(exit) *this.arr = impl.data;
        impl.put(item);
    }

    // Const fixing hack.
    void opOpAssign(string op : "~", Range)(Range items) if (AppenderType.canPutConstRange!Range)
    {
        scope(exit) *this.arr = impl.data;
        impl.put(items);
    }

    /**
     * Appends an entire range to the managed array.
     */
    void opOpAssign(string op : "~", Range)(Range items) if (AppenderType.canPutRange!Range)
    {
        scope(exit) *this.arr = impl.data;
        impl.put(items);
    }

    /**
     * Returns the capacity of the array (the maximum number of elements the
     * managed array can accommodate before triggering a reallocation).  If any
     * appending will reallocate, $(D capacity) returns $(D 0).
     */
    @property size_t capacity() const
    {
        return impl.capacity;
    }

    /**
     * Returns the managed array.
     */
    @property inout(T)[] data() inout
    {
        return impl.data;
    }
}

/++
    Convenience function that returns an $(D Appender!A) object initialized
    with $(D array).
 +/
Appender!(E[]) appender(A : E[], E)()
{
    return Appender!(E[])(null);
}
/// ditto
Appender!(E[]) appender(A : E[], E)(A array)
{
    static if (isMutable!E)
    {
        return Appender!(E[])(array);
    }
    else
    {
        /* @system operation:
         * - casting array to Unqual!E[] (remove qualifiers)
         */
        return Appender!(E[])(cast(Unqual!E[])array);
    }
}

@safe pure nothrow unittest
{
    {
        auto app = appender!(char[])();
        string b = "abcdefg";
        foreach (char c; b) app.put(c);
        assert(app.data == "abcdefg");
    }
    {
        auto app = appender!(char[])();
        string b = "abcdefg";
        foreach (char c; b) app ~= c;
        assert(app.data == "abcdefg");
    }
    {
        int[] a = [ 1, 2 ];
        auto app2 = appender(a);
        assert(app2.data == [ 1, 2 ]);
        app2.put(3);
        app2.put([ 4, 5, 6 ][]);
        assert(app2.data == [ 1, 2, 3, 4, 5, 6 ]);
        app2.put([ 7 ]);
        assert(app2.data == [ 1, 2, 3, 4, 5, 6, 7 ]);
    }

    int[] a = [ 1, 2 ];
    auto app2 = appender(a);
    assert(app2.data == [ 1, 2 ]);
    app2 ~= 3;
    app2 ~= [ 4, 5, 6 ][];
    assert(app2.data == [ 1, 2, 3, 4, 5, 6 ]);
    app2 ~= [ 7 ];
    assert(app2.data == [ 1, 2, 3, 4, 5, 6, 7 ]);

    app2.reserve(5);
    assert(app2.capacity >= 5);

    try // shrinkTo may throw
    {
        app2.shrinkTo(3);
    }
    catch (Exception) assert(0);
    assert(app2.data == [ 1, 2, 3 ]);
    assertThrown(app2.shrinkTo(5));

    const app3 = app2;
    assert(app3.capacity >= 3);
    assert(app3.data == [1, 2, 3]);

    auto app4 = appender([]);
    try // shrinkTo may throw
    {
        app4.shrinkTo(0);
    }
    catch (Exception) assert(0);

    // Issue 5663 & 9725 tests
    foreach (S; TypeTuple!(char[], const(char)[], string))
    {
        {
            Appender!S app5663i;
            assertNotThrown(app5663i.put("\xE3"));
            assert(app5663i.data == "\xE3");

            Appender!S app5663c;
            assertNotThrown(app5663c.put(cast(const(char)[])"\xE3"));
            assert(app5663c.data == "\xE3");

            Appender!S app5663m;
            assertNotThrown(app5663m.put("\xE3".dup));
            assert(app5663m.data == "\xE3");
        }
        // ditto for ~=
        {
            Appender!S app5663i;
            assertNotThrown(app5663i ~= "\xE3");
            assert(app5663i.data == "\xE3");

            Appender!S app5663c;
            assertNotThrown(app5663c ~= cast(const(char)[])"\xE3");
            assert(app5663c.data == "\xE3");

            Appender!S app5663m;
            assertNotThrown(app5663m ~= "\xE3".dup);
            assert(app5663m.data == "\xE3");
        }
    }

    static struct S10122
    {
        int val;

        @disable this();
        this(int v) @safe pure nothrow { val = v; }
    }
    assertCTFEable!(
    {
        auto w = appender!(S10122[])();
        w.put(S10122(1));
        assert(w.data.length == 1 && w.data[0].val == 1);
    });
}

@safe pure nothrow unittest
{
    {
        auto w = appender!string();
        w.reserve(4);
        w.capacity;
        w.data;
        try
        {
            wchar wc = 'a';
            dchar dc = 'a';
            w.put(wc);    // decoding may throw
            w.put(dc);    // decoding may throw
        }
        catch (Exception) assert(0);
    }
    {
        auto w = appender!(int[])();
        w.reserve(4);
        w.capacity;
        w.data;
        w.put(10);
        w.put([10]);
        w.clear();
        try
        {
            w.shrinkTo(0);
        }
        catch (Exception) assert(0);

        struct N
        {
            int payload;
            alias payload this;
        }
        w.put(N(1));
        w.put([N(2)]);

        struct S(T)
        {
            @property bool empty() { return true; }
            @property T front() { return T.init; }
            void popFront() {}
        }
        S!int r;
        w.put(r);
    }
}

unittest
{
    //10690
    [tuple(1)].filter!(t => true).array; // No error
    [tuple("A")].filter!(t => true).array; // error
}

unittest
{
    //Coverage for put(Range)
    struct S1
    {
    }
    struct S2
    {
        void opAssign(S2){}
    }
    auto a1 = Appender!(S1[])();
    auto a2 = Appender!(S2[])();
    auto au1 = Appender!(const(S1)[])();
    auto au2 = Appender!(const(S2)[])();
    a1.put(S1().repeat().take(10));
    a2.put(S2().repeat().take(10));
    auto sc1 = const(S1)();
    auto sc2 = const(S2)();
    au1.put(sc1.repeat().take(10));
    au2.put(sc2.repeat().take(10));
}

unittest
{
    struct S
    {
        int* p;
    }

    auto a0 = Appender!(S[])();
    auto a1 = Appender!(const(S)[])();
    auto a2 = Appender!(immutable(S)[])();
    auto s0 = S(null);
    auto s1 = const(S)(null);
    auto s2 = immutable(S)(null);
    a1.put(s0);
    a1.put(s1);
    a1.put(s2);
    a1.put([s0]);
    a1.put([s1]);
    a1.put([s2]);
    a0.put(s0);
    static assert(!is(typeof(a0.put(a1))));
    static assert(!is(typeof(a0.put(a2))));
    a0.put([s0]);
    static assert(!is(typeof(a0.put([a1]))));
    static assert(!is(typeof(a0.put([a2]))));
    static assert(!is(typeof(a2.put(a0))));
    static assert(!is(typeof(a2.put(a1))));
    a2.put(s2);
    static assert(!is(typeof(a2.put([a0]))));
    static assert(!is(typeof(a2.put([a1]))));
    a2.put([s2]);
}

unittest
{ //9528
    const(E)[] fastCopy(E)(E[] src) {
            auto app = appender!(const(E)[])();
            foreach (i, e; src)
                    app.put(e);
            return app.data;
    }

    class C {}
    struct S { const(C) c; }
    S[] s = [ S(new C) ];

    auto t = fastCopy(s); // Does not compile
}

unittest
{ //10753
    struct Foo {
       immutable dchar d;
    }
    struct Bar {
       immutable int x;
    }
   "12".map!Foo.array;
   [1, 2].map!Bar.array;
}

/++
    Convenience function that returns a $(D RefAppender!A) object initialized
    with $(D array).  Don't use null for the $(D array) pointer, use the other
    version of $(D appender) instead.
 +/
RefAppender!(E[]) appender(A : E[]*, E)(A array)
{
    return RefAppender!(E[])(array);
}

unittest
{
    {
        auto arr = new char[0];
        auto app = appender(&arr);
        string b = "abcdefg";
        foreach (char c; b) app.put(c);
        assert(app.data == "abcdefg");
        assert(arr == "abcdefg");
    }
    {
        auto arr = new char[0];
        auto app = appender(&arr);
        string b = "abcdefg";
        foreach (char c; b) app ~= c;
        assert(app.data == "abcdefg");
        assert(arr == "abcdefg");
    }
    {
        int[] a = [ 1, 2 ];
        auto app2 = appender(&a);
        assert(app2.data == [ 1, 2 ]);
        assert(a == [ 1, 2 ]);
        app2.put(3);
        app2.put([ 4, 5, 6 ][]);
        assert(app2.data == [ 1, 2, 3, 4, 5, 6 ]);
        assert(a == [ 1, 2, 3, 4, 5, 6 ]);
    }

    int[] a = [ 1, 2 ];
    auto app2 = appender(&a);
    assert(app2.data == [ 1, 2 ]);
    assert(a == [ 1, 2 ]);
    app2 ~= 3;
    app2 ~= [ 4, 5, 6 ][];
    assert(app2.data == [ 1, 2, 3, 4, 5, 6 ]);
    assert(a == [ 1, 2, 3, 4, 5, 6 ]);

    app2.reserve(5);
    assert(app2.capacity >= 5);

    try // shrinkTo may throw
    {
        app2.shrinkTo(3);
    }
    catch (Exception) assert(0);
    assert(app2.data == [ 1, 2, 3 ]);
    assertThrown(app2.shrinkTo(5));

    const app3 = app2;
    assert(app3.capacity >= 3);
    assert(app3.data == [1, 2, 3]);
}

unittest
{
    Appender!(int[]) app;
    short[] range = [1, 2, 3];
    app.put(range);
    assert(app.data == [1, 2, 3]);
}

/*
A simple slice type only holding pointers to the beginning and the end
of an array. Experimental duplication of the built-in slice - do not
use yet.
 */
struct SimpleSlice(T)
{
    private T * _b, _e;

    this(U...)(U values)
    {
        _b = cast(T*) core.memory.GC.malloc(U.length * T.sizeof);
        _e = _b + U.length;
        foreach (i, Unused; U) _b[i] = values[i];
    }

    void opAssign(R)(R anotherSlice)
    {
        static if (is(typeof(*_b = anotherSlice)))
        {
            // assign all elements to a value
            foreach (p; _b .. _e)
            {
                *p = anotherSlice;
            }
        }
        else
        {
            // assign another slice to this
            enforce(anotherSlice.length == length);
            auto p = _b;
            foreach (p; _b .. _e)
            {
                *p = anotherSlice.front;
                anotherSlice.popFront();
            }
        }
    }

/**
   Range primitives.
 */
    bool empty() const
    {
        assert(_b <= _e);
        return _b == _e;
    }

/// Ditto
    ref T front()
    {
        assert(!empty);
        return *_b;
    }

/// Ditto
    void popFront()
    {
        assert(!empty);
        ++_b;
    }

/// Ditto
    ref T back()
    {
        assert(!empty);
        return _e[-1];
    }

/// Ditto
    void popBack()
    {
        assert(!empty);
        --_e;
    }

/// Ditto
    T opIndex(size_t n)
    {
        assert(n < length);
        return _b[n];
    }

/// Ditto
    const(T) opIndex(size_t n) const
    {
        assert(n < length);
        return _b[n];
    }

/// Ditto
    void opIndexAssign(T value, size_t n)
    {
        assert(n < length);
        _b[n] = value;
    }

/// Ditto
    SimpleSliceLvalue!T opSlice()
    {
        typeof(return) result = void;
        result._b = _b;
        result._e = _e;
        return result;
    }

/// Ditto
    SimpleSliceLvalue!T opSlice(size_t x, size_t y)
    {
        enforce(x <= y && y <= length);
        typeof(return) result = { _b + x, _b + y };
        return result;
    }

    @property
    {
        /// Returns the length of the slice.
        size_t length() const
        {
            return _e - _b;
        }

        /**
        Sets the length of the slice. Newly added elements will be filled with
        $(D T.init).
         */
        void length(size_t newLength)
        {
            immutable oldLength = length;
            _b = cast(T*) core.memory.GC.realloc(_b, newLength * T.sizeof);
            _e = _b + newLength;
            this[oldLength .. $] = T.init;
        }
    }

/// Concatenation.
    SimpleSlice opCat(R)(R another)
    {
        immutable newLen = length + another.length;
        typeof(return) result = void;
        result._b = cast(T*)
            core.memory.GC.malloc(newLen * T.sizeof);
        result._e = result._b + newLen;
        result[0 .. this.length] = this;
        result[this.length .. result.length] = another;
        return result;
    }

/// Concatenation with rebinding.
    void opCatAssign(R)(R another)
    {
        auto newThis = this ~ another;
        move(newThis, this);
    }
}

// Support for mass assignment
struct SimpleSliceLvalue(T)
{
    private SimpleSlice!T _s;
    alias _s this;

    void opAssign(R)(R anotherSlice)
    {
        static if (is(typeof(*_b = anotherSlice)))
        {
            // assign all elements to a value
            foreach (p; _b .. _e)
            {
                *p = anotherSlice;
            }
        }
        else
        {
            // assign another slice to this
            enforce(anotherSlice.length == length);
            auto p = _b;
            foreach (p; _b .. _e)
            {
                *p = anotherSlice.front;
                anotherSlice.popFront();
            }
        }
    }
}

unittest
{
    // SimpleSlice!(int) s;

    // s = SimpleSlice!(int)(4, 5, 6);
    // assert(equal(s, [4, 5, 6][]));
    // assert(s.length == 3);
    // assert(s[0] == 4);
    // assert(s[1] == 5);
    // assert(s[2] == 6);

    // assert(s[] == s);
    // assert(s[0 .. s.length] == s);
    // assert(equal(s[0 .. s.length - 1], [4, 5][]));

    // auto s1 = s ~ s[0 .. 1];
    // assert(equal(s1, [4, 5, 6, 4][]));

    // assert(s1[3] == 4);
    // s1[3] = 42;
    // assert(s1[3] == 42);

    // const s2 = s;
    // assert(s2.length == 3);
    // assert(!s2.empty);
    // assert(s2[0] == s[0]);

    // s[0 .. 2] = 10;
    // assert(equal(s, [10, 10, 6][]));

    // s ~= [ 5, 9 ][];
    // assert(equal(s, [10, 10, 6, 5, 9][]));

    // s.length = 7;
    // assert(equal(s, [10, 10, 6, 5, 9, 0, 0][]));
}
