// Written in the D programming language.

/**
Functions that manipulate other functions.

Macros:

WIKI = Phobos/StdFunctional

Copyright: Copyright Andrei Alexandrescu 2008 - 2009.
License:   $(WEB boost.org/LICENSE_1_0.txt, Boost License 1.0).
Authors:   $(WEB erdani.org, Andrei Alexandrescu)
Source:    $(PHOBOSSRC std/_functional.d)
*/
/*
         Copyright Andrei Alexandrescu 2008 - 2009.
Distributed under the Boost Software License, Version 1.0.
   (See accompanying file LICENSE_1_0.txt or copy at
         http://www.boost.org/LICENSE_1_0.txt)
*/
module mystd.functional;

import mystd.traits, mystd.typetuple;

/**
Transforms a string representing an expression into a unary
function. The string must use symbol name $(D a) as the parameter.

Example:

----
alias unaryFun!("(a & 1) == 0") isEven;
assert(isEven(2) && !isEven(1));
----
*/

template unaryFun(alias fun, string parmName = "a")
{
    static if (is(typeof(fun) : string))
    {
        import mystd.traits, mystd.typecons, mystd.typetuple;
        import mystd.algorithm, mystd.conv, mystd.exception, mystd.math, mystd.range, mystd.string;
        auto unaryFun(ElementType)(auto ref ElementType __a)
        {
            mixin("alias " ~ parmName ~ " = __a ;");
            return mixin(fun);
        }
    }
    else
    {
        alias unaryFun = fun;
    }
}

/+ Undocumented, will be removed December 2014+/
deprecated("Parameter byRef is obsolete. Please call unaryFun!(fun, parmName) directly.")
template unaryFun(alias fun, bool byRef, string parmName = "a")
{
    alias unaryFun = unaryFun!(fun, parmName);
}

unittest
{
    static int f1(int a) { return a + 1; }
    static assert(is(typeof(unaryFun!(f1)(1)) == int));
    assert(unaryFun!(f1)(41) == 42);
    int f2(int a) { return a + 1; }
    static assert(is(typeof(unaryFun!(f2)(1)) == int));
    assert(unaryFun!(f2)(41) == 42);
    assert(unaryFun!("a + 1")(41) == 42);
    //assert(unaryFun!("return a + 1;")(41) == 42);

    int num = 41;
    assert(unaryFun!("a + 1", true)(num) == 42);
}

/**
Transforms a string representing an expression into a Boolean binary
predicate. The string must use symbol names $(D a) and $(D b) as the
compared elements.

   Example:

----
alias less = binaryFun!("a < b");
assert(less(1, 2) && !less(2, 1));
alias greater = binaryFun!("a > b");
assert(!greater("1", "2") && greater("2", "1"));
----
*/

template binaryFun(alias fun, string parm1Name = "a",
        string parm2Name = "b")
{
    static if (is(typeof(fun) : string))
    {
        import mystd.traits, mystd.typecons, mystd.typetuple;
        import mystd.algorithm, mystd.conv, mystd.exception, mystd.math, mystd.range, mystd.string;
        auto binaryFun(ElementType1, ElementType2)
            (auto ref ElementType1 __a, auto ref ElementType2 __b)
        {
            mixin("alias "~parm1Name~" = __a ;");
            mixin("alias "~parm2Name~" = __b ;");
            return mixin(fun);
        }
    }
    else
    {
        alias binaryFun = fun;
    }
}

unittest
{
    alias less = binaryFun!(q{a < b});
    assert(less(1, 2) && !less(2, 1));
    assert(less("1", "2") && !less("2", "1"));

    static int f1(int a, string b) { return a + 1; }
    static assert(is(typeof(binaryFun!(f1)(1, "2")) == int));
    assert(binaryFun!(f1)(41, "a") == 42);
    string f2(int a, string b) { return b ~ "2"; }
    static assert(is(typeof(binaryFun!(f2)(1, "1")) == string));
    assert(binaryFun!(f2)(1, "4") == "42");
    assert(binaryFun!("a + b")(41, 1) == 42);
    //@@BUG
    //assert(binaryFun!("return a + b;")(41, 1) == 42);
}

/*
   Predicate that returns $(D_PARAM a < b).
*/
//bool less(T)(T a, T b) { return a < b; }
//alias less = binaryFun!(q{a < b});

/*
   Predicate that returns $(D_PARAM a > b).
*/
//alias greater = binaryFun!(q{a > b});

/*
   Predicate that returns $(D_PARAM a == b).
*/
//alias equalTo = binaryFun!(q{a == b});

/**
   Binary predicate that reverses the order of arguments, e.g., given
   $(D pred(a, b)), returns $(D pred(b, a)).
*/
template binaryReverseArgs(alias pred)
{
    auto binaryReverseArgs(ElementType1, ElementType2)
            (ElementType1 a, ElementType2 b)
    {
        return pred(b, a);
    }
}

unittest
{
    alias gt = binaryReverseArgs!(binaryFun!("a < b"));
    assert(gt(2, 1) && !gt(1, 1));
    int x = 42;
    bool xyz(int a, int b) { return a * x < b / x; }
    auto foo = &xyz;
    foo(4, 5);
    alias zyx = binaryReverseArgs!(foo);
    assert(zyx(5, 4) == foo(4, 5));
}

/**
Negates predicate $(D pred).

Example:
----
string a = "   Hello, world!";
assert(find!(not!isWhite)(a) == "Hello, world!");
----
 */
template not(alias pred)
{
    auto not(T...)(T args)
    if (is(typeof(!unaryFun!pred(args))) || is(typeof(!binaryFun!pred(args))))
    {
        static if (T.length == 1)
            return !unaryFun!pred(args);
        else static if (T.length == 2)
            return !binaryFun!pred(args);
        else
            static assert(false, "not unimplemented for multiple arguments");
    }
}

/**
Curries $(D fun) by tying its first argument to a particular value.

Example:

----
int fun(int a, int b) { return a + b; }
alias curry!(fun, 5) fun5;
assert(fun5(6) == 11);
----

Note that in most cases you'd use an alias instead of a value
assignment. Using an alias allows you to curry template functions
without committing to a particular type of the function.
 */
template curry(alias fun, alias arg)
{
    static if (is(typeof(fun) == delegate) || is(typeof(fun) == function))
    {
        ReturnType!fun curry(ParameterTypeTuple!fun[1..$] args2)
        {
            return fun(arg, args2);
        }
    }
    else
    {
        auto curry(Ts...)(Ts args2)
        {
            static if (is(typeof(fun(arg, args2))))
            {
                return fun(arg, args2);
            }
            else
            {
                static string errormsg()
                {
                    string msg = "Cannot call '" ~ fun.stringof ~ "' with arguments " ~
                        "(" ~ arg.stringof;
                    foreach(T; Ts)
                        msg ~= ", " ~ T.stringof;
                    msg ~= ").";
                    return msg;
                }
                static assert(0, errormsg());
            }
        }
    }
}

// tests for currying callables
unittest
{
    static int f1(int a, int b) { return a + b; }
    assert(curry!(f1, 5)(6) == 11);

    int f2(int a, int b) { return a + b; }
    int x = 5;
    assert(curry!(f2, x)(6) == 11);
    x = 7;
    assert(curry!(f2, x)(6) == 13);
    static assert(curry!(f2, 5)(6) == 11);

    auto dg = &f2;
    auto f3 = &curry!(dg, x);
    assert(f3(6) == 13);

    static int funOneArg(int a) { return a; }
    assert(curry!(funOneArg, 1)() == 1);

    static int funThreeArgs(int a, int b, int c) { return a + b + c; }
    alias funThreeArgs1 = curry!(funThreeArgs, 1);
    assert(funThreeArgs1(2, 3) == 6);
    static assert(!is(typeof(funThreeArgs1(2))));

    enum xe = 5;
    alias fe = curry!(f2, xe);
    static assert(fe(6) == 11);
}

// tests for currying templated/overloaded callables
unittest
{
    static auto add(A, B)(A x, B y)
    {
        return x + y;
    }

    alias add5 = curry!(add, 5);
    assert(add5(6) == 11);
    static assert(!is(typeof(add5())));
    static assert(!is(typeof(add5(6, 7))));

    // taking address of templated curry needs explicit type
    auto dg = &add5!(int);
    assert(dg(6) == 11);

    int x = 5;
    alias addX = curry!(add, x);
    assert(addX(6) == 11);

    static struct Callable
    {
        static string opCall(string a, string b) { return a ~ b; }
        int opCall(int a, int b) { return a * b; }
        double opCall(double a, double b) { return a + b; }
    }
    Callable callable;
    assert(curry!(Callable, "5")("6") == "56");
    assert(curry!(callable, 5)(6) == 30);
    assert(curry!(callable, 7.0)(3.0) == 7.0 + 3.0);

    static struct TCallable
    {
        auto opCall(A, B)(A a, B b)
        {
            return a + b;
        }
    }
    TCallable tcallable;
    assert(curry!(tcallable, 5)(6) == 11);
    static assert(!is(typeof(curry!(tcallable, "5")(6))));

    static A funOneArg(A)(A a) { return a; }
    alias funOneArg1 = curry!(funOneArg, 1);
    assert(funOneArg1() == 1);

    static auto funThreeArgs(A, B, C)(A a, B b, C c) { return a + b + c; }
    alias funThreeArgs1 = curry!(funThreeArgs, 1);
    assert(funThreeArgs1(2, 3) == 6);
    static assert(!is(typeof(funThreeArgs1(1))));

    // @@ dmd BUG 6600 @@
    // breaks completely unrelated unittest for toDelegate
    // static assert(is(typeof(dg_pure_nothrow) == int delegate() pure nothrow));
    version (none)
    {
        auto dg2 = &funOneArg1!();
        assert(dg2() == 1);
    }
}

/**
Takes multiple functions and adjoins them together. The result is a
$(XREF typecons, Tuple) with one element per passed-in function. Upon
invocation, the returned tuple is the adjoined results of all
functions.

Example:

----
static bool f1(int a) { return a != 0; }
static int f2(int a) { return a / 2; }
auto x = adjoin!(f1, f2)(5);
assert(is(typeof(x) == Tuple!(bool, int)));
assert(x[0] == true && x[1] == 2);
----
*/
template adjoin(F...) if (F.length)
{
    auto adjoin(V...)(V a)
    {
        static if (F.length == 1)
        {
            return F[0](a);
        }
        else static if (F.length == 2)
        {
            import mystd.typecons : Tuple, tuple;
            return tuple(F[0](a), F[1](a));
        }
        else
        {
            import mystd.typecons : Tuple, tuple;
            import mystd.conv : emplaceRef;
            alias Head = typeof(F[0](a));
            Tuple!(Head, typeof(.adjoin!(F[1..$])(a)).Types) result = void;
            foreach (i, Unused; result.Types)
            {
                emplaceRef(result[i], F[i](a));
            }
            return result;
        }
    }
}

unittest
{
    import mystd.typecons;
    static bool F1(int a) { return a != 0; }
    auto x1 = adjoin!(F1)(5);
    static int F2(int a) { return a / 2; }
    auto x2 = adjoin!(F1, F2)(5);
    assert(is(typeof(x2) == Tuple!(bool, int)));
    assert(x2[0] && x2[1] == 2);
    auto x3 = adjoin!(F1, F2, F2)(5);
    assert(is(typeof(x3) == Tuple!(bool, int, int)));
    assert(x3[0] && x3[1] == 2 && x3[2] == 2);

    bool F4(int a) { return a != x1; }
    alias eff4 = adjoin!(F4);
    static struct S
    {
        bool delegate(int) store;
        int fun() { return 42 + store(5); }
    }
    S s;
    s.store = (int a) { return eff4(a); };
    auto x4 = s.fun();
    assert(x4 == 43);
}

// /*private*/ template NaryFun(string fun, string letter, V...)
// {
//     static if (V.length == 0)
//     {
//         enum args = "";
//     }
//     else
//     {
//         enum args = V[0].stringof~" "~letter~"; "
//             ~NaryFun!(fun, [letter[0] + 1], V[1..$]).args;
//         enum code = args ~ "return "~fun~";";
//     }
//     alias Result = void;
// }

// unittest
// {
//     writeln(NaryFun!("a * b * 2", "a", int, double).code);
// }

// /**
// naryFun
//  */
// template naryFun(string fun)
// {
//     //NaryFun!(fun, "a", V).Result
//     int naryFun(V...)(V values)
//     {
//         enum string code = NaryFun!(fun, "a", V).code;
//         mixin(code);
//     }
// }

// unittest
// {
//     alias test = naryFun!("a + b");
//     test(1, 2);
// }

/**
   Composes passed-in functions $(D fun[0], fun[1], ...) returning a
   function $(D f(x)) that in turn returns $(D
   fun[0](fun[1](...(x)))...). Each function can be a regular
   functions, a delegate, or a string.

   Example:

----
// First split a string in whitespace-separated tokens and then
// convert each token into an integer
assert(compose!(map!(to!(int)), split)("1 2 3") == [1, 2, 3]);
----
*/

template compose(fun...)
{
    static if (fun.length == 1)
    {
        alias compose = unaryFun!(fun[0]);
    }
    else static if (fun.length == 2)
    {
        // starch
        alias fun0 = unaryFun!(fun[0]);
        alias fun1 = unaryFun!(fun[1]);

        // protein: the core composition operation
        typeof({ E a; return fun0(fun1(a)); }()) compose(E)(E a)
        {
            return fun0(fun1(a));
        }
    }
    else
    {
        // protein: assembling operations
        alias compose = compose!(fun[0], compose!(fun[1 .. $]));
    }
}

/**
   Pipes functions in sequence. Offers the same functionality as $(D
   compose), but with functions specified in reverse order. This may
   lead to more readable code in some situation because the order of
   execution is the same as lexical order.

   Example:

----
// Read an entire text file, split the resulting string in
// whitespace-separated tokens, and then convert each token into an
// integer
int[] a = pipe!(readText, split, map!(to!(int)))("file.txt");
----
 */
alias pipe(fun...) = compose!(Reverse!(fun));

unittest
{
    import mystd.conv : to;
    string foo(int a) { return to!(string)(a); }
    int bar(string a) { return to!(int)(a) + 1; }
    double baz(int a) { return a + 0.5; }
    assert(compose!(baz, bar, foo)(1) == 2.5);
    assert(pipe!(foo, bar, baz)(1) == 2.5);

    assert(compose!(baz, `to!(int)(a) + 1`, foo)(1) == 2.5);
    assert(compose!(baz, bar)("1"[]) == 2.5);

    assert(compose!(baz, bar)("1") == 2.5);

    // @@@BUG@@@
    //assert(compose!(`a + 0.5`, `to!(int)(a) + 1`, foo)(1) == 2.5);
}

/**
 * $(LUCKY Memoizes) a function so as to avoid repeated
 * computation. The memoization structure is a hash table keyed by a
 * tuple of the function's arguments. There is a speed gain if the
 * function is repeatedly called with the same arguments and is more
 * expensive than a hash table lookup. For more information on memoization, refer to $(WEB docs.google.com/viewer?url=http%3A%2F%2Fhop.perl.plover.com%2Fbook%2Fpdf%2F03CachingAndMemoization.pdf, this book chapter).

Example:
----
double transmogrify(int a, string b)
{
   ... expensive computation ...
}
alias fastTransmogrify = memoize!transmogrify;
unittest
{
    auto slow = transmogrify(2, "hello");
    auto fast = fastTransmogrify(2, "hello");
    assert(slow == fast);
}
----

Technically the memoized function should be pure because $(D memoize) assumes it will
always return the same result for a given tuple of arguments. However, $(D memoize) does not
enforce that because sometimes it
is useful to memoize an impure function, too.

To _memoize a recursive function, simply insert the memoized call in lieu of the plain recursive call.
For example, to transform the exponential-time Fibonacci implementation into a linear-time computation:

Example:
----
ulong fib(ulong n)
{
    alias mfib = memoize!fib;
    return n < 2 ? 1 : mfib(n - 2) + mfib(n - 1);
}
...
assert(fib(10) == 89);
----

To improve the speed of the factorial function,

Example:
----
ulong fact(ulong n)
{
    alias mfact = memoize!fact;
    return n < 2 ? 1 : n * mfact(n - 1);
}
...
assert(fact(10) == 3628800);
----

This memoizes all values of $(D fact) up to the largest argument. To only cache the final
result, move $(D memoize) outside the function as shown below.

Example:
----
ulong factImpl(ulong n)
{
    return n < 2 ? 1 : n * factImpl(n - 1);
}
alias fact = memoize!factImpl;
...
assert(fact(10) == 3628800);
----

The $(D maxSize) parameter is a cutoff for the cache size. If upon a miss the length of the hash
table is found to be $(D maxSize), the table is simply cleared.

Example:
----
// Memoize no more than 128 values of transmogrify
alias fastTransmogrify = memoize!(transmogrify, 128);
----
*/
template memoize(alias fun, uint maxSize = uint.max)
{
    ReturnType!fun memoize(ParameterTypeTuple!fun args)
    {
        import mystd.typecons : Tuple, tuple;
        static ReturnType!fun[Tuple!(typeof(args))] memo;
        auto t = tuple(args);
        auto p = t in memo;
        if (p) return *p;
        static if (maxSize != uint.max)
        {
            if (memo.length >= maxSize) memo = null;
        }
        auto r = fun(args);
        //writeln("Inserting result ", typeof(r).stringof, "(", r, ") for parameters ", t);
        memo[t] = r;
        return r;
    }
}

unittest
{
    import core.math;
    alias msqrt = memoize!(function double(double x) { return sqrt(x); });
    auto y = msqrt(2.0);
    assert(y == msqrt(2.0));
    y = msqrt(4.0);
    assert(y == sqrt(4.0));

    // alias mrgb2cmyk = memoize!rgb2cmyk;
    // auto z = mrgb2cmyk([43, 56, 76]);
    // assert(z == mrgb2cmyk([43, 56, 76]));

    //alias mfib = memoize!fib;

    static ulong fib(ulong n)
    {
        alias mfib = memoize!fib;
        return n < 2 ? 1 : mfib(n - 2) + mfib(n - 1);
    }

    auto z = fib(10);
    assert(z == 89);

    static ulong fact(ulong n)
    {
        alias mfact = memoize!fact;
        return n < 2 ? 1 : n * mfact(n - 1);
    }
    assert(fact(10) == 3628800);
}

private struct DelegateFaker(F)
{
    import mystd.typecons;
    
    // for @safe
    static F castToF(THIS)(THIS x) @trusted
    {
        return cast(F) x;
    }

    /*
     * What all the stuff below does is this:
     *--------------------
     * struct DelegateFaker(F) {
     *     extern(linkage)
     *     [ref] ReturnType!F doIt(ParameterTypeTuple!F args) [@attributes]
     *     {
     *         auto fp = cast(F) &this;
     *         return fp(args);
     *     }
     * }
     *--------------------
     */

    // We will use MemberFunctionGenerator in mystd.typecons.  This is a policy
    // configuration for generating the doIt().
    template GeneratingPolicy()
    {
        // Inform the genereator that we only have type information.
        enum WITHOUT_SYMBOL = true;

        // Generate the function body of doIt().
        template generateFunctionBody(unused...)
        {
            enum generateFunctionBody =
            // [ref] ReturnType doIt(ParameterTypeTuple args) @attributes
            q{
                // When this function gets called, the this pointer isn't
                // really a this pointer (no instance even really exists), but
                // a function pointer that points to the function to be called.
                // Cast it to the correct type and call it.

                auto fp = castToF(&this);
                return fp(args);
            };
        }
    }
    // Type information used by the generated code.
    alias FuncInfo_doIt = FuncInfo!(F);

    // Generate the member function doIt().
    mixin( mystd.typecons.MemberFunctionGenerator!(GeneratingPolicy!())
            .generateFunction!("FuncInfo_doIt", "doIt", F) );
}

/**
 * Convert a callable to a delegate with the same parameter list and
 * return type, avoiding heap allocations and use of auxiliary storage.
 *
 * Examples:
 * ----
 * void doStuff() {
 *     writeln("Hello, world.");
 * }
 *
 * void runDelegate(void delegate() myDelegate) {
 *     myDelegate();
 * }
 *
 * auto delegateToPass = toDelegate(&doStuff);
 * runDelegate(delegateToPass);  // Calls doStuff, prints "Hello, world."
 * ----
 *
 * BUGS:
 * $(UL
 *   $(LI Does not work with $(D @safe) functions.)
 *   $(LI Ignores C-style / D-style variadic arguments.)
 * )
 */
auto toDelegate(F)(auto ref F fp) if (isCallable!(F))
{
    static if (is(F == delegate))
    {
        return fp;
    }
    else static if (is(typeof(&F.opCall) == delegate)
                || (is(typeof(&F.opCall) V : V*) && is(V == function)))
    {
        return toDelegate(&fp.opCall);
    }
    else
    {
        alias DelType = typeof(&(new DelegateFaker!(F)).doIt);

        static struct DelegateFields {
            union {
                DelType del;
                //pragma(msg, typeof(del));

                struct {
                    void* contextPtr;
                    void* funcPtr;
                }
            }
        }

        // fp is stored in the returned delegate's context pointer.
        // The returned delegate's function pointer points to
        // DelegateFaker.doIt.
        DelegateFields df;

        df.contextPtr = cast(void*) fp;

        DelegateFaker!(F) dummy;
        auto dummyDel = &dummy.doIt;
        df.funcPtr = dummyDel.funcptr;

        return df.del;
    }
}

unittest {
    static int inc(ref uint num) {
        num++;
        return 8675309;
    }

    uint myNum = 0;
    auto incMyNumDel = toDelegate(&inc);
    static assert(is(typeof(incMyNumDel) == int delegate(ref uint)));
    auto returnVal = incMyNumDel(myNum);
    assert(myNum == 1);

    interface I { int opCall(); }
    class C: I { int opCall() { inc(myNum); return myNum;} }
    auto c = new C;
    auto i = cast(I) c;

    auto getvalc = toDelegate(c);
    assert(getvalc() == 2);

    auto getvali = toDelegate(i);
    assert(getvali() == 3);

    struct S1 { int opCall() { inc(myNum); return myNum; } }
    static assert(!is(typeof(&s1.opCall) == delegate));
    S1 s1;
    auto getvals1 = toDelegate(s1);
    assert(getvals1() == 4);

    struct S2 { static int opCall() { return 123456; } }
    static assert(!is(typeof(&S2.opCall) == delegate));
    S2 s2;
    auto getvals2 =&S2.opCall;
    assert(getvals2() == 123456);

    /* test for attributes */
    {
        static int refvar = 0xDeadFace;

        static ref int func_ref() { return refvar; }
        static int func_pure() pure { return 1; }
        static int func_nothrow() nothrow { return 2; }
        static int func_property() @property { return 3; }
        static int func_safe() @safe { return 4; }
        static int func_trusted() @trusted { return 5; }
        static int func_system() @system { return 6; }
        static int func_pure_nothrow() pure nothrow { return 7; }
        static int func_pure_nothrow_safe() pure @safe { return 8; }

        auto dg_ref = toDelegate(&func_ref);
        auto dg_pure = toDelegate(&func_pure);
        auto dg_nothrow = toDelegate(&func_nothrow);
        auto dg_property = toDelegate(&func_property);
        auto dg_safe = toDelegate(&func_safe);
        auto dg_trusted = toDelegate(&func_trusted);
        auto dg_system = toDelegate(&func_system);
        auto dg_pure_nothrow = toDelegate(&func_pure_nothrow);
        auto dg_pure_nothrow_safe = toDelegate(&func_pure_nothrow_safe);

        //static assert(is(typeof(dg_ref) == ref int delegate())); // [BUG@DMD]
        static assert(is(typeof(dg_pure) == int delegate() pure));
        static assert(is(typeof(dg_nothrow) == int delegate() nothrow));
        static assert(is(typeof(dg_property) == int delegate() @property));
        //static assert(is(typeof(dg_safe) == int delegate() @safe));
        static assert(is(typeof(dg_trusted) == int delegate() @trusted));
        static assert(is(typeof(dg_system) == int delegate() @system));
        static assert(is(typeof(dg_pure_nothrow) == int delegate() pure nothrow));
        //static assert(is(typeof(dg_pure_nothrow_safe) == int delegate() pure nothrow @safe));

        assert(dg_ref() == refvar);
        assert(dg_pure() == 1);
        assert(dg_nothrow() == 2);
        assert(dg_property() == 3);
        //assert(dg_safe() == 4);
        assert(dg_trusted() == 5);
        assert(dg_system() == 6);
        assert(dg_pure_nothrow() == 7);
        //assert(dg_pure_nothrow_safe() == 8);
    }
    /* test for linkage */
    {
        struct S
        {
            extern(C) static void xtrnC() {}
            extern(D) static void xtrnD() {}
        }
        auto dg_xtrnC = toDelegate(&S.xtrnC);
        auto dg_xtrnD = toDelegate(&S.xtrnD);
        static assert(! is(typeof(dg_xtrnC) == typeof(dg_xtrnD)));
    }
}

