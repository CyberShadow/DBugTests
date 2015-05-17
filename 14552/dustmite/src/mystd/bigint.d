/** Arbitrary-precision ('bignum') arithmetic.
 *
 * Performance is optimized for numbers below ~1000 decimal digits.
 * For X86 machines, highly optimised assembly routines are used.
 *
 * The following algorithms are currently implemented:
 * $(UL
 * $(LI Karatsuba multiplication)
 * $(LI Squaring is optimized independently of multiplication)
 * $(LI Divide-and-conquer division)
 * $(LI Binary exponentiation)
 * )
 *
 * For very large numbers, consider using the $(WEB gmplib.org, GMP library) instead.
 *
 * License:   $(WEB www.boost.org/LICENSE_1_0.txt, Boost License 1.0).
 * Authors:   Don Clugston
 * Source: $(PHOBOSSRC std/_bigint.d)
 */
/*          Copyright Don Clugston 2008 - 2010.
 * Distributed under the Boost Software License, Version 1.0.
 *    (See accompanying file LICENSE_1_0.txt or copy at
 *          http://www.boost.org/LICENSE_1_0.txt)
 */

module mystd.bigint;

private import mystd.internal.math.biguintcore;
private import mystd.format : FormatSpec, FormatException;
private import mystd.traits;

/** A struct representing an arbitrary precision integer.
 *
 * All arithmetic operations are supported, except unsigned shift right (>>>).
 * Bitwise operations (|, &, ^, ~) are supported, and behave as if BigInt was
 * an infinite length 2's complement number.
 *
 * BigInt implements value semantics using copy-on-write. This means that
 * assignment is cheap, but operations such as x++ will cause heap
 * allocation. (But note that for most bigint operations, heap allocation is
 * inevitable anyway.)
 */
struct BigInt
{
private:
    BigUint data;     // BigInt adds signed arithmetic to BigUint.
    bool sign = false;
public:
    /// Construct a BigInt from a decimal or hexadecimal string.
    /// The number must be in the form of a D decimal or hex literal:
    /// It may have a leading + or - sign; followed by "0x" if hexadecimal.
    /// Underscores are permitted.
    /// BUG: Should throw a IllegalArgumentException/ConvError if invalid character found
    this(T : const(char)[] )(T s) pure
    {
        bool neg = false;
        if (s[0] == '-') {
            neg = true;
            s = s[1..$];
        } else if (s[0] == '+') {
            s = s[1..$];
        }
        data = 0UL;
        auto q = 0X3;
        bool ok;
        assert(isZero());
        if (s.length > 2 && (s[0..2] == "0x" || s[0..2] == "0X"))
        {
            ok = data.fromHexString(s[2..$]);
        } else {
            ok = data.fromDecimalString(s);
        }
        assert(ok);

        if (isZero())
            neg = false;
        sign = neg;
    }

    /// Construct a BigInt from a built-in integral type.
    this(T)(T x) pure nothrow if (isIntegral!T)
    {
        data = data.init; // @@@: Workaround for compiler bug
        opAssign(x);
    }

    ///
    unittest
    {
        ulong data = 1_000_000_000_000;
        auto bigData = BigInt(data);
        assert(data == BigInt("1_000_000_000_000"));
    }

    /// Construct a BigInt from another BigInt.
    this(T)(T x) pure nothrow if (is(Unqual!T == BigInt))
    {
        opAssign(x);
    }

    ///
    unittest
    {
        const(BigInt) b1 = BigInt("1_234_567_890");
        BigInt b2 = BigInt(b1);
        assert(b2 == BigInt("1_234_567_890"));
    }

    /// Assignment from built-in integer types.
    BigInt opAssign(T)(T x) pure nothrow if (isIntegral!T)
    {
        data = cast(ulong)absUnsign(x);
        sign = (x < 0);
        return this;
    }

    ///
    unittest
    {
        auto b = BigInt("123");
        b = 456;
        assert(b == BigInt("456"));
    }

    /// Assignment from another BigInt.
    BigInt opAssign(T:BigInt)(T x) pure @nogc
    {
        data = x.data;
        sign = x.sign;
        return this;
    }

    ///
    unittest
    {
        auto b1 = BigInt("123");
        auto b2 = BigInt("456");
        b2 = b1;
        assert(b2 == BigInt("123"));
    }

    /**
     * Implements assignment operators from built-in integers of the form
     * $(D BigInt op= integer).
     */
    BigInt opOpAssign(string op, T)(T y) pure nothrow
        if ((op=="+" || op=="-" || op=="*" || op=="/" || op=="%"
          || op==">>" || op=="<<" || op=="^^" || op=="|" || op=="&" || op=="^") && isIntegral!T)
    {
        ulong u = absUnsign(y);

        static if (op=="+")
        {
            data = BigUint.addOrSubInt(data, u, sign != (y<0), sign);
        }
        else static if (op=="-")
        {
            data = BigUint.addOrSubInt(data, u, sign == (y<0), sign);
        }
        else static if (op=="*")
        {
            if (y == 0) {
                sign = false;
                data = 0UL;
            } else {
                sign = ( sign != (y<0) );
                data = BigUint.mulInt(data, u);
            }
        }
        else static if (op=="/")
        {
            assert(y!=0, "Division by zero");
            static if (T.sizeof <= uint.sizeof)
            {
                data = BigUint.divInt(data, cast(uint)u);
            }
            else
            {
                data = BigUint.divInt(data, u);
            }
            sign = data.isZero() ? false : sign ^ (y < 0);
        }
        else static if (op=="%")
        {
            assert(y!=0, "Division by zero");
            static if (is(immutable(T) == immutable(long)) || is( immutable(T) == immutable(ulong) ))
            {
                this %= BigInt(y);
            }
            else
            {
                data = cast(ulong)BigUint.modInt(data, cast(uint)u);
                if (data.isZero())
                    sign = false;
            }
            // x%y always has the same sign as x.
            // This is not the same as mathematical mod.
        }
        else static if (op==">>" || op=="<<")
        {
            // Do a left shift if y>0 and <<, or
            // if y<0 and >>; else do a right shift.
            if (y == 0)
                return this;
            else if ((y > 0) == (op=="<<"))
            {
                // Sign never changes during left shift
                data = data.opShl(u);
            } else
            {
                data = data.opShr(u);
                if (data.isZero())
                    sign = false;
            }
        }
        else static if (op=="^^")
        {
            sign = (y & 1) ? sign : false;
            data = BigUint.pow(data, u);
        }
        else static if (op=="|" || op=="&" || op=="^")
        {
            BigInt b = y;
            opOpAssign!op(b);
        }
        else static assert(0, "BigInt " ~ op[0..$-1] ~ "= " ~ T.stringof ~ " is not supported");
        return this;
    }

    ///
    unittest
    {
        auto b = BigInt("1_000_000_000");

        b += 12345;
        assert(b == BigInt("1_000_012_345"));

        b /= 5;
        assert(b == BigInt("200_002_469"));
    }

    /**
     * Implements assignment operators of the form $(D BigInt op= BigInt).
     */
    BigInt opOpAssign(string op, T)(T y) pure nothrow
        if ((op=="+" || op== "-" || op=="*" || op=="|" || op=="&" || op=="^" || op=="/" || op=="%")
            && is (T: BigInt))
    {
        static if (op == "+")
        {
            data = BigUint.addOrSub(data, y.data, sign != y.sign, &sign);
        }
        else static if (op == "-")
        {
            data = BigUint.addOrSub(data, y.data, sign == y.sign, &sign);
        }
        else static if (op == "*")
        {
            data = BigUint.mul(data, y.data);
            sign = isZero() ? false : sign ^ y.sign;
        }
        else static if (op == "/")
        {
            y.checkDivByZero();
            if (!isZero())
            {
                data = BigUint.div(data, y.data);
                sign = isZero() ? false : sign ^ y.sign;
            }
        }
        else static if (op == "%")
        {
            y.checkDivByZero();
            if (!isZero())
            {
                data = BigUint.mod(data, y.data);
                // x%y always has the same sign as x.
                if (isZero())
                    sign = false;
            }
        }
        else static if (op == "|" || op == "&" || op == "^")
        {
            data = BigUint.bitwiseOp!op(data, y.data, sign, y.sign, sign);
        }
        else static assert(0, "BigInt " ~ op[0..$-1] ~ "= " ~
            T.stringof ~ " is not supported");
        return this;
    }

    ///
    unittest
    {
        auto x = BigInt("123");
        auto y = BigInt("321");
        x += y;
        assert(x == BigInt("444"));
    }

    /**
     * Implements binary operators between BigInts.
     */
    BigInt opBinary(string op, T)(T y) pure nothrow const
        if ((op=="+" || op == "*" || op=="-" || op=="|" || op=="&" || op=="^" ||
            op=="/" || op=="%")
            && is (T: BigInt))
    {
        BigInt r = this;
        return r.opOpAssign!(op)(y);
    }

    ///
    unittest
    {
        auto x = BigInt("123");
        auto y = BigInt("456");
        BigInt z = x * y;
        assert(z == BigInt("56088"));
    }

    /**
     * Implements binary operators between BigInt's and built-in integers.
     */
    BigInt opBinary(string op, T)(T y) pure nothrow const
        if ((op=="+" || op == "*" || op=="-" || op=="/" || op=="|" || op=="&" ||
            op=="^"|| op==">>" || op=="<<" || op=="^^")
            && isIntegral!T)
    {
        BigInt r = this;
        return r.opOpAssign!(op)(y);
    }

    ///
    unittest
    {
        auto x = BigInt("123");
        x *= 300;
        assert(x == BigInt("36900"));
    }

    /**
        Implements a narrowing remainder operation with built-in integer types.

        This binary operator returns a narrower, built-in integer type
        where applicable, according to the following table.

        $(TABLE ,
        $(TR $(TD `BigInt`) $(TD $(CODE_PERCENT)) $(TD `long`) $(TD $(RARR)) $(TD `long`))
        $(TR $(TD `BigInt`) $(TD $(CODE_PERCENT)) $(TD `ulong`) $(TD $(RARR)) $(TD `BigInt`))
        $(TR $(TD `BigInt`) $(TD $(CODE_PERCENT)) $(TD other type) $(TD $(RARR)) $(TD `int`))
        )
     */
    auto opBinary(string op, T)(T y) pure nothrow const
        if (op == "%" && isIntegral!T)
    {
        assert(y!=0);

        // BigInt % long => long
        // BigInt % ulong => BigInt
        // BigInt % other_type => int
        static if (is(Unqual!T == long) || is(Unqual!T == ulong))
        {
            auto r = this % BigInt(y);

            static if (is(Unqual!T == long))
            {
                return r.toLong();
            }
            else
            {
                // return as-is to avoid overflow
                return r;
            }
        }
        else
        {
            uint u = absUnsign(y);
            int rem = BigUint.modInt(data, u);
            // x%y always has the same sign as x.
            // This is not the same as mathematical mod.
            return sign ? -rem : rem;
        }
    }

    ///
    unittest
    {
        auto  x  = BigInt("1_000_000_500");
        long  l  = 1_000_000L;
        ulong ul = 2_000_000UL;
        int   i  = 500_000;
        short s  = 30_000;

        assert(is(typeof(x % l)  == long)   && x % l  == 500L);
        assert(is(typeof(x % ul) == BigInt) && x % ul == BigInt(500));
        assert(is(typeof(x % i)  == int)    && x % i  == 500);
        assert(is(typeof(x % s)  == int)    && x % s  == 10500);
    }

    /**
        Implements operators with built-in integers on the left-hand side and
        BigInt on the right-hand side.
     */
    BigInt opBinaryRight(string op, T)(T y) pure nothrow const
        if ((op=="+" || op=="*" || op=="|" || op=="&" || op=="^") && isIntegral!T)
    {
        return opBinary!(op)(y);
    }

    ///
    unittest
    {
        auto x = BigInt("100");
        BigInt y = 123 + x;
        assert(y == BigInt("223"));

        BigInt z = 123 - x;
        assert(z == BigInt("23"));

        // Dividing a built-in integer type by BigInt always results in
        // something that fits in a built-in type, so the built-in type is
        // returned, not BigInt.
        assert(is(typeof(1000 / x) == int));
        assert(1000 / x == 10);
    }

    //  BigInt = integer op BigInt
    /// ditto
    BigInt opBinaryRight(string op, T)(T y) pure nothrow const
        if (op == "-" && isIntegral!T)
    {
        ulong u = absUnsign(y);
        BigInt r;
        static if (op == "-")
        {
            r.sign = sign;
            r.data = BigUint.addOrSubInt(data, u, sign == (y<0), r.sign);
            r.negate();
        }
        return r;
    }

    //  integer = integer op BigInt
    /// ditto
    T opBinaryRight(string op, T)(T x) pure nothrow const
        if ((op=="%" || op=="/") && isIntegral!T)
    {
        checkDivByZero();

        static if (op == "%")
        {
            // x%y always has the same sign as x.
            if (data.ulongLength > 1)
                return x;
            ulong u = absUnsign(x);
            ulong rem = u % data.peekUlong(0);
            // x%y always has the same sign as x.
            return cast(T)((x<0) ? -rem : rem);
        }
        else static if (op == "/")
        {
            if (data.ulongLength > 1)
                return 0;
            return cast(T)(x / data.peekUlong(0));
        }
    }

    // const unary operations
    /**
        Implements BigInt unary operators.
     */
    BigInt opUnary(string op)() pure nothrow const if (op=="+" || op=="-" || op=="~")
    {
       static if (op=="-")
       {
            BigInt r = this;
            r.negate();
            return r;
        }
        else static if (op=="~")
        {
            return -(this+1);
        }
        else static if (op=="+")
           return this;
    }

    // non-const unary operations
    /// ditto
    BigInt opUnary(string op)() pure nothrow if (op=="++" || op=="--")
    {
        static if (op=="++")
        {
            data = BigUint.addOrSubInt(data, 1UL, sign, sign);
            return this;
        }
        else static if (op=="--")
        {
            data = BigUint.addOrSubInt(data, 1UL, !sign, sign);
            return this;
        }
    }

    ///
    unittest
    {
        auto x = BigInt("1234");
        assert(-x == BigInt("-1234"));

        ++x;
        assert(x == BigInt("1235"));
    }

    /**
        Implements BigInt equality test with other BigInt's and built-in
        integer types.
     */
    bool opEquals()(auto ref const BigInt y) const pure @nogc
    {
       return sign == y.sign && y.data == data;
    }

    /// ditto
    bool opEquals(T)(T y) const pure nothrow @nogc if (isIntegral!T)
    {
        if (sign != (y<0))
            return 0;
        return data.opEquals(cast(ulong)absUnsign(y));
    }

    ///
    unittest
    {
        auto x = BigInt("12345");
        auto y = BigInt("12340");
        int z = 12345;
        int w = 54321;

        assert(x == x);
        assert(x != y);
        assert(x == y + 5);
        assert(x == z);
        assert(x != w);
    }

    /**
        Implements casting to bool.
     */
    T opCast(T:bool)() pure nothrow @nogc const
    {
        return !isZero();
    }

    ///
    unittest
    {
        // Non-zero values are regarded as true
        auto x = BigInt("1");
        auto y = BigInt("10");
        assert(x);
        assert(y);

        // Zero value is regarded as false
        auto z = BigInt("0");
        assert(!z);
    }

    /**
        Implements casting to/from qualified BigInt's.

        Warning: Casting to/from $(D const) or $(D immutable) may break type
        system guarantees. Use with care.
     */
    T opCast(T)() pure nothrow @nogc const if (is(Unqual!T == BigInt)) {
        return this;
    }

    ///
    unittest
    {
        const(BigInt) x = BigInt("123");
        BigInt y = cast() x;    // cast away const
        assert(y == x);
    }

    // Hack to make BigInt's typeinfo.compare work properly.
    // Note that this must appear before the other opCmp overloads, otherwise
    // DMD won't find it.
    /**
        Implements 3-way comparisons of BigInt with BigInt or BigInt with
        built-in integers.
     */
    int opCmp(ref const BigInt y) pure nothrow @nogc const
    {
        // Simply redirect to the "real" opCmp implementation.
        return this.opCmp!BigInt(y);
    }

    /// ditto
    int opCmp(T)(T y) pure nothrow @nogc const if (isIntegral!T)
    {
        if (sign != (y<0) )
            return sign ? -1 : 1;
        int cmp = data.opCmp(cast(ulong)absUnsign(y));
        return sign? -cmp: cmp;
    }
    /// ditto
    int opCmp(T:BigInt)(const T y) pure nothrow @nogc const
    {
        if (sign!=y.sign)
            return sign ? -1 : 1;
        int cmp = data.opCmp(y.data);
        return sign? -cmp: cmp;
    }

    ///
    unittest
    {
        auto x = BigInt("100");
        auto y = BigInt("10");
        int z = 50;
        const int w = 200;

        assert(y < x);
        assert(x > z);
        assert(z > y);
        assert(x < w);
    }

    /**
        Returns: The value of this BigInt as a long, or +/- long.max if outside
        the representable range.
     */
    long toLong() @safe pure nothrow const @nogc
    {
        return (sign ? -1 : 1) *
          (data.ulongLength == 1  && (data.peekUlong(0) <= sign+cast(ulong)(long.max)) // 1+long.max = |long.min|
          ? cast(long)(data.peekUlong(0))
          : long.max);
    }

    ///
    unittest
    {
        auto b = BigInt("12345");
        long l = b.toLong();
        assert(l == 12345);
    }

    /**
        Returns: The value of this BigInt as an int, or +/- int.max if outside
        the representable range.
     */
    int toInt() @safe pure nothrow @nogc const
    {
        return (sign ? -1 : 1) *
          (data.uintLength == 1  && (data.peekUint(0) <= sign+cast(uint)(int.max)) // 1+int.max = |int.min|
          ? cast(int)(data.peekUint(0))
          : int.max);
    }

    ///
    unittest
    {
        auto big = BigInt("5_000_000");
        auto i = big.toInt();
        assert(i == 5_000_000);

        // Numbers that are too big to fit into an int will be clamped to int.max.
        auto tooBig = BigInt("5_000_000_000");
        i = tooBig.toInt();
        assert(i == int.max);
    }

    /// Number of significant uints which are used in storing this number.
    /// The absolute value of this BigInt is always &lt; 2$(SUPERSCRIPT 32*uintLength)
    @property size_t uintLength() @safe pure nothrow @nogc const
    {
        return data.uintLength;
    }

    /// Number of significant ulongs which are used in storing this number.
    /// The absolute value of this BigInt is always &lt; 2$(SUPERSCRIPT 64*ulongLength)
    @property size_t ulongLength() @safe pure nothrow @nogc const
    {
        return data.ulongLength;
    }

    /** Convert the BigInt to string, passing it to the given sink.
     *
     * Params:
     *  sink = A delegate for accepting possibly piecewise segments of the
     *      formatted string.
     *  formatString = A format string specifying the output format.
     *
     * $(TABLE  Available output formats:,
     * $(TR $(TD "d") $(TD  Decimal))
     * $(TR $(TD "x") $(TD  Hexadecimal, lower case))
     * $(TR $(TD "X") $(TD  Hexadecimal, upper case))
     * $(TR $(TD "s") $(TD  Default formatting (same as "d") ))
     * $(TR $(TD null) $(TD Default formatting (same as "d") ))
     * )
     */
    void toString(scope void delegate(const (char)[]) sink, string formatString) const
    {
        auto f = FormatSpec!char(formatString);
        f.writeUpToNextSpec(sink);
        toString(sink, f);
    }

    /// ditto
    void toString(scope void delegate(const(char)[]) sink, ref FormatSpec!char f) const
    {
        auto hex = (f.spec == 'x' || f.spec == 'X');
        if (!(f.spec == 's' || f.spec == 'd' || hex))
            throw new FormatException("Format specifier not understood: %" ~ f.spec);

        char[] buff =
            hex ? data.toHexString(0, '_', 0, f.flZero ? '0' : ' ')
                : data.toDecimalString(0);
        assert(buff.length > 0);

        char signChar = isNegative() ? '-' : 0;
        auto minw = buff.length + (signChar ? 1 : 0);

        if (!hex && !signChar && (f.width == 0 || minw < f.width))
        {
            if (f.flPlus)
            {
                signChar = '+';
                ++minw;
            }
            else if (f.flSpace)
            {
                signChar = ' ';
                ++minw;
            }
        }

        auto maxw = minw < f.width ? f.width : minw;
        auto difw = maxw - minw;

        if (!f.flDash && !f.flZero)
            foreach (i; 0 .. difw)
                sink(" ");

        if (signChar)
            sink((&signChar)[0..1]);

        if (!f.flDash && f.flZero)
            foreach (i; 0 .. difw)
                sink("0");

        sink(buff);

        if (f.flDash)
            foreach (i; 0 .. difw)
                sink(" ");
    }

    /**
        $(D toString) is rarely directly invoked; the usual way of using it is via
        $(LINK2 std_format.html#format, mystd.format.format):
     */
    unittest
    {
        import mystd.format : format;

        auto x = BigInt("1_000_000");
        x *= 12345;

        assert(format("%d", x) == "12345000000");
        assert(format("%X", x) == "2_DFD1C040");
    }

    // Implement toHash so that BigInt works properly as an AA key.
    /**
        Returns: A unique hash of the BigInt's value suitable for use in a hash
        table.
     */
    size_t toHash() const @safe nothrow
    {
        return data.toHash() + sign;
    }

    /**
        $(D toHash) is rarely directly invoked; it is implicitly used when
        BigInt is used as the key of an associative array.
     */
    unittest
    {
        string[BigInt] aa;
        aa[BigInt(123)] = "abc";
        aa[BigInt(456)] = "def";

        assert(aa[BigInt(123)] == "abc");
        assert(aa[BigInt(456)] == "def");
    }

private:
    void negate() @safe pure nothrow @nogc
    {
        if (!data.isZero())
            sign = !sign;
    }
    bool isZero() pure const nothrow @nogc @safe
    {
        return data.isZero();
    }
    bool isNegative() pure const nothrow @nogc @safe
    {
        return sign;
    }

    // Generate a runtime error if division by zero occurs
    void checkDivByZero() pure const nothrow @safe
    {
        if (isZero())
            throw new Error("BigInt division by zero");
    }
}

///
unittest
{
    BigInt a = "9588669891916142";
    BigInt b = "7452469135154800";
    auto c = a * b;
    assert(c == BigInt("71459266416693160362545788781600"));
    auto d = b * a;
    assert(d == BigInt("71459266416693160362545788781600"));
    assert(d == c);
    d = c * BigInt("794628672112");
    assert(d == BigInt("56783581982794522489042432639320434378739200"));
    auto e = c + d;
    assert(e == BigInt("56783581982865981755459125799682980167520800"));
    auto f = d + c;
    assert(f == e);
    auto g = f - c;
    assert(g == d);
    g = f - d;
    assert(g == c);
    e = 12345678;
    g = c + e;
    auto h = g / b;
    auto i = g % b;
    assert(h == a);
    assert(i == e);
    BigInt j = "-0x9A56_57f4_7B83_AB78";
    j ^^= 11;
}

/**
Params:
    x = The $(D BigInt) to convert to a decimal $(D string).

Returns:
    A $(D string) that represents the $(D BigInt) as a decimal number.

*/
string toDecimalString(const(BigInt) x)
{
    string outbuff="";
    void sink(const(char)[] s) { outbuff ~= s; }
    x.toString(&sink, "%d");
    return outbuff;
}

///
unittest
{
    auto x = BigInt("123");
    x *= 1000;
    x += 456;

    auto xstr = x.toDecimalString();
    assert(xstr == "123456");
}

/**
Params:
    x = The $(D BigInt) to convert to a hexadecimal $(D string).

Returns:
    A $(D string) that represents the $(D BigInt) as a hexadecimal (base 16)
    number.

*/
string toHex(const(BigInt) x)
{
    string outbuff="";
    void sink(const(char)[] s) { outbuff ~= s; }
    x.toString(&sink, "%x");
    return outbuff;
}

///
unittest
{
    auto x = BigInt("123");
    x *= 1000;
    x += 456;

    auto xstr = x.toHex();
    assert(xstr == "1E240");
}

/** Returns the absolute value of x converted to the corresponding unsigned
type.

Params:
    x = The integral value to return the absolute value of.

Returns:
    The absolute value of x.

*/
Unsigned!T absUnsign(T)(T x) if (isIntegral!T)
{
    static if (isSigned!T)
    {
        import mystd.conv;
        /* This returns the correct result even when x = T.min
         * on two's complement machines because unsigned(T.min) = |T.min|
         * even though -T.min = T.min.
         */
        return unsigned((x < 0) ? -x : x);
    }
    else
    {
        return x;
    }
}

nothrow pure
unittest {
    BigInt a, b;
    a = 1;
    b = 2;
    auto c = a + b;
}

nothrow pure
unittest {
    long a;
    BigInt b;
    auto c = a + b;
    auto d = b + a;
}

nothrow pure
unittest {
    BigInt x = 1, y = 2;
    assert(x <  y);
    assert(x <= y);
    assert(y >= x);
    assert(y >  x);
    assert(x != y);

    long r1 = x.toLong;
    assert(r1 == 1);

    BigInt r2 = 10 % x;
    assert(r2 == 0);

    BigInt r3 = 10 / y;
    assert(r3 == 5);

    BigInt[] arr = [BigInt(1)];
    auto incr = arr[0]++;
    assert(arr == [BigInt(2)]);
    assert(incr == BigInt(1));
}

unittest {
    // Radix conversion
    assert( toDecimalString(BigInt("-1_234_567_890_123_456_789"))
        == "-1234567890123456789");
    assert( toHex(BigInt("0x1234567890123456789")) == "123_45678901_23456789");
    assert( toHex(BigInt("0x00000000000000000000000000000000000A234567890123456789"))
        == "A23_45678901_23456789");
    assert( toHex(BigInt("0x000_00_000000_000_000_000000000000_000000_")) == "0");

    assert(BigInt(-0x12345678).toInt() == -0x12345678);
    assert(BigInt(-0x12345678).toLong() == -0x12345678);
    assert(BigInt(0x1234_5678_9ABC_5A5AL).ulongLength == 1);
    assert(BigInt(0x1234_5678_9ABC_5A5AL).toLong() == 0x1234_5678_9ABC_5A5AL);
    assert(BigInt(-0x1234_5678_9ABC_5A5AL).toLong() == -0x1234_5678_9ABC_5A5AL);
    assert(BigInt(0xF234_5678_9ABC_5A5AL).toLong() == long.max);
    assert(BigInt(-0x123456789ABCL).toInt() == -int.max);
    char[] s1 = "123".dup; // bug 8164
    assert(BigInt(s1) == 123);
    char[] s2 = "0xABC".dup;
    assert(BigInt(s2) == 2748);

    assert((BigInt(-2) + BigInt(1)) == BigInt(-1));
    BigInt a = ulong.max - 5;
    auto b = -long.max % a;
    assert( b == -long.max % (ulong.max - 5));
    b = long.max / a;
    assert( b == long.max /(ulong.max - 5));
    assert(BigInt(1) - 1 == 0);
    assert((-4) % BigInt(5) == -4); // bug 5928
    assert(BigInt(-4) % BigInt(5) == -4);
    assert(BigInt(2)/BigInt(-3) == BigInt(0)); // bug 8022
    assert(BigInt("-1") > long.min); // bug 9548
}

unittest // Minimum signed value bug tests.
{
    assert(BigInt("-0x8000000000000000") == BigInt(long.min));
    assert(BigInt("-0x8000000000000000")+1 > BigInt(long.min));
    assert(BigInt("-0x80000000") == BigInt(int.min));
    assert(BigInt("-0x80000000")+1 > BigInt(int.min));
    assert(BigInt(long.min).toLong() == long.min); // lossy toLong bug for long.min
    assert(BigInt(int.min).toInt() == int.min); // lossy toInt bug for int.min
    assert(BigInt(long.min).ulongLength == 1);
    assert(BigInt(int.min).uintLength == 1); // cast/sign extend bug in opAssign
    BigInt a;
    a += int.min;
    assert(a == BigInt(int.min));
    a = int.min - BigInt(int.min);
    assert(a == 0);
    a = int.min;
    assert(a == BigInt(int.min));
    assert(int.min % (BigInt(int.min)-1) == int.min);
    assert((BigInt(int.min)-1)%int.min == -1);
}

unittest // Recursive division, bug 5568
{
    enum Z = 4843;
    BigInt m = (BigInt(1) << (Z*8) ) - 1;
    m -= (BigInt(1) << (Z*6)) - 1;
    BigInt oldm = m;

    BigInt a = (BigInt(1) << (Z*4) )-1;
    BigInt b = m % a;
    m /= a;
    m *= a;
    assert( m + b == oldm);

    m = (BigInt(1) << (4846 + 4843) ) - 1;
    a = (BigInt(1) << 4846 ) - 1;
    b = (BigInt(1) << (4846*2 + 4843)) - 1;
    BigInt c = (BigInt(1) << (4846*2 + 4843*2)) - 1;
    BigInt w =  c - b + a;
    assert(w % m == 0);

    // Bug 6819. ^^
    BigInt z1 = BigInt(10)^^64;
    BigInt w1 = BigInt(10)^^128;
    assert(z1^^2 == w1);
    BigInt z2 = BigInt(1)<<64;
    BigInt w2 = BigInt(1)<<128;
    assert(z2^^2 == w2);
    // Bug 7993
    BigInt n7793 = 10;
    assert( n7793 / 1 == 10);
    // Bug 7973
    auto a7973 = 10_000_000_000_000_000;
    const c7973 = 10_000_000_000_000_000;
    immutable i7973 = 10_000_000_000_000_000;
    BigInt v7973 = 2551700137;
    v7973 %= a7973;
    assert(v7973 == 2551700137);
    v7973 %= c7973;
    assert(v7973 == 2551700137);
    v7973 %= i7973;
    assert(v7973 == 2551700137);
    // 8165
    BigInt[2] a8165;
    a8165[0] = a8165[1] = 1;
}

unittest
{
    import mystd.array;
    import mystd.format;

    immutable string[][] table = [
    /*  fmt,        +10     -10 */
        ["%d",      "10",   "-10"],
        ["%+d",     "+10",  "-10"],
        ["%-d",     "10",   "-10"],
        ["%+-d",    "+10",  "-10"],

        ["%4d",     "  10", " -10"],
        ["%+4d",    " +10", " -10"],
        ["%-4d",    "10  ", "-10 "],
        ["%+-4d",   "+10 ", "-10 "],

        ["%04d",    "0010", "-010"],
        ["%+04d",   "+010", "-010"],
        ["%-04d",   "10  ", "-10 "],
        ["%+-04d",  "+10 ", "-10 "],

        ["% 04d",   " 010", "-010"],
        ["%+ 04d",  "+010", "-010"],
        ["%- 04d",  " 10 ", "-10 "],
        ["%+- 04d", "+10 ", "-10 "],
    ];

    auto w1 = appender!(char[])();
    auto w2 = appender!(char[])();

    foreach (entry; table)
    {
        immutable fmt = entry[0];

        formattedWrite(w1, fmt, BigInt(10));
        formattedWrite(w2, fmt, 10);
        assert(w1.data == w2.data);
        assert(w1.data == entry[1]);
        w1.clear();
        w2.clear();

        formattedWrite(w1, fmt, BigInt(-10));
        formattedWrite(w2, fmt, -10);
        assert(w1.data == w2.data);
        assert(w1.data == entry[2]);
        w1.clear();
        w2.clear();
    }
}

unittest
{
    import mystd.array;
    import mystd.format;

    immutable string[][] table = [
    /*  fmt,        +10     -10 */
        ["%X",      "A",    "-A"],
        ["%+X",     "A",    "-A"],
        ["%-X",     "A",    "-A"],
        ["%+-X",    "A",    "-A"],

        ["%4X",     "   A", "  -A"],
        ["%+4X",    "   A", "  -A"],
        ["%-4X",    "A   ", "-A  "],
        ["%+-4X",   "A   ", "-A  "],

        ["%04X",    "000A", "-00A"],
        ["%+04X",   "000A", "-00A"],
        ["%-04X",   "A   ", "-A  "],
        ["%+-04X",  "A   ", "-A  "],

        ["% 04X",   "000A", "-00A"],
        ["%+ 04X",  "000A", "-00A"],
        ["%- 04X",  "A   ", "-A  "],
        ["%+- 04X", "A   ", "-A  "],
    ];

    auto w1 = appender!(char[])();
    auto w2 = appender!(char[])();

    foreach (entry; table)
    {
        immutable fmt = entry[0];

        formattedWrite(w1, fmt, BigInt(10));
        formattedWrite(w2, fmt, 10);
        assert(w1.data == w2.data);     // Equal only positive BigInt
        assert(w1.data == entry[1]);
        w1.clear();
        w2.clear();

        formattedWrite(w1, fmt, BigInt(-10));
        //formattedWrite(w2, fmt, -10);
        //assert(w1.data == w2.data);
        assert(w1.data == entry[2]);
        w1.clear();
        //w2.clear();
    }
}

// 6448
unittest
{
    import mystd.array;
    import mystd.format;

    auto w1 = appender!string();
    auto w2 = appender!string();

    int x = 100;
    formattedWrite(w1, "%010d", x);
    BigInt bx = x;
    formattedWrite(w2, "%010d", bx);
    assert(w1.data == w2.data);
    //8011
    BigInt y = -3;
    ++y;
    assert(y.toLong() == -2);
    y = 1;
    --y;
    assert(y.toLong() == 0);
    --y;
    assert(y.toLong() == -1);
    --y;
    assert(y.toLong() == -2);
}

unittest
{
    import mystd.math:abs;
    auto r = abs(BigInt(-1000)); // 6486
    assert(r == 1000);

    auto r2 = abs(const(BigInt)(-500)); // 11188
    assert(r2 == 500);
    auto r3 = abs(immutable(BigInt)(-733)); // 11188
    assert(r3 == 733);

    // opCast!bool
    BigInt one = 1, zero;
    assert(one && !zero);
}

unittest // 6850
{
    pure long pureTest() {
        BigInt a = 1;
        BigInt b = 1336;
        a += b;
        return a.toLong();
    }

    assert(pureTest() == 1337);
}

unittest // 8435 & 10118
{
    auto i = BigInt(100);
    auto j = BigInt(100);

    // Two separate BigInt instances representing same value should have same
    // hash.
    assert(typeid(i).getHash(&i) == typeid(j).getHash(&j));
    assert(typeid(i).compare(&i, &j) == 0);

    // BigInt AA keys should behave consistently.
    int[BigInt] aa;
    aa[BigInt(123)] = 123;
    assert(BigInt(123) in aa);

    aa[BigInt(123)] = 321;
    assert(aa[BigInt(123)] == 321);

    auto keys = aa.byKey;
    assert(keys.front == BigInt(123));
    keys.popFront();
    assert(keys.empty);
}

unittest // 11148
{
    void foo(BigInt) {}
    const BigInt cbi = 3;
    immutable BigInt ibi = 3;

    assert(__traits(compiles, foo(cbi)));
    assert(__traits(compiles, foo(ibi)));

    import mystd.typetuple : TypeTuple;
    import mystd.conv : to;

    foreach (T1; TypeTuple!(BigInt, const(BigInt), immutable(BigInt)))
    {
        foreach (T2; TypeTuple!(BigInt, const(BigInt), immutable(BigInt)))
        {
            T1 t1 = 2;
            T2 t2 = t1;

            T2 t2_1 = to!T2(t1);
            T2 t2_2 = cast(T2)t1;

            assert(t2 == t1);
            assert(t2 == 2);

            assert(t2_1 == t1);
            assert(t2_1 == 2);

            assert(t2_2 == t1);
            assert(t2_2 == 2);
        }
    }

    BigInt n = 2;
    n *= 2;
}

unittest // 8167
{
    BigInt a = BigInt(3);
    BigInt b = BigInt(a);
}

unittest // 9061
{
    long l1 = 0x12345678_90ABCDEF;
    long l2 = 0xFEDCBA09_87654321;
    long l3 = l1 | l2;
    long l4 = l1 & l2;
    long l5 = l1 ^ l2;

    BigInt b1 = l1;
    BigInt b2 = l2;
    BigInt b3 = b1 | b2;
    BigInt b4 = b1 & b2;
    BigInt b5 = b1 ^ b2;

    assert(l3 == b3);
    assert(l4 == b4);
    assert(l5 == b5);
}

unittest // 11600
{
    import mystd.conv;
    import mystd.exception : assertThrown;

    // Original bug report
    assertThrown!ConvException(to!BigInt("avadakedavra"));

    // Digit string lookalikes that are actually invalid
    assertThrown!ConvException(to!BigInt("0123hellothere"));
    assertThrown!ConvException(to!BigInt("-hihomarylowe"));
    assertThrown!ConvException(to!BigInt("__reallynow__"));
    assertThrown!ConvException(to!BigInt("-123four"));
}

unittest // 11583
{
    BigInt x = 0;
    assert((x > 0) == false);
}

unittest // 13391
{
    BigInt x1 = "123456789";
    BigInt x2 = "123456789123456789";
    BigInt x3 = "123456789123456789123456789";

    import mystd.typetuple : TypeTuple;
    foreach (T; TypeTuple!(byte, ubyte, short, ushort, int, uint, long, ulong))
    {
        assert((x1 * T.max) / T.max == x1);
        assert((x2 * T.max) / T.max == x2);
        assert((x3 * T.max) / T.max == x3);
    }

    assert(x1 / -123456789 == -1);
    assert(x1 / 123456789U == 1);
    assert(x1 / -123456789L == -1);
    assert(x1 / 123456789UL == 1);
    assert(x2 / -123456789123456789L == -1);
    assert(x2 / 123456789123456789UL == 1);

    assert(x1 / uint.max == 0);
    assert(x1 / ulong.max == 0);
    assert(x2 / ulong.max == 0);

    x1 /= 123456789UL;
    assert(x1 == 1);
    x2 /= 123456789123456789UL;
    assert(x2 == 1);
}

unittest // 13963
{
    BigInt x = 1;
    import mystd.typetuple : TypeTuple;
    foreach(Int; TypeTuple!(byte, ubyte, short, ushort, int, uint))
    {
        assert(is(typeof(x % Int(1)) == int));
    }
    assert(is(typeof(x % 1L) == long));
    assert(is(typeof(x % 1UL) == BigInt));

    auto x1 = BigInt(8);
    auto x2 = -BigInt(long.min) + 1;

    // long
    assert(x1 % 2L == 0L);
    assert(-x1 % 2L == 0L);

    assert(x1 % 3L == 2L);
    assert(x1 % -3L == 2L);
    assert(-x1 % 3L == -2L);
    assert(-x1 % -3L == -2L);

    assert(x1 % 11L == 8L);
    assert(x1 % -11L == 8L);
    assert(-x1 % 11L == -8L);
    assert(-x1 % -11L == -8L);

    // ulong
    assert(x1 % 2UL == BigInt(0));
    assert(-x1 % 2UL == BigInt(0));

    assert(x1 % 3UL == BigInt(2));
    assert(-x1 % 3UL == -BigInt(2));

    assert(x1 % 11UL == BigInt(8));
    assert(-x1 % 11UL == -BigInt(8));

    assert(x2 % ulong.max == x2);
    assert(-x2 % ulong.max == -x2);
}

unittest // 14124
{
    auto x = BigInt(-3);
    x %= 3;
    assert(!x.isNegative());
    assert(x.isZero());

    x = BigInt(-3);
    x %= cast(ushort)3;
    assert(!x.isNegative());
    assert(x.isZero());

    x = BigInt(-3);
    x %= 3L;
    assert(!x.isNegative());
    assert(x.isZero());

    x = BigInt(3);
    x %= -3;
    assert(!x.isNegative());
    assert(x.isZero());
}
