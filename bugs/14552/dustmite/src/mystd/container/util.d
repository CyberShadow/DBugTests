/**
This module contains some common utilities used by containers.

This module is a submodule of $(LINK2 std_container.html, mystd.container).

Source: $(PHOBOSSRC std/container/_util.d)
Macros:
WIKI = Phobos/StdContainer
TEXTWITHCOMMAS = $0

Copyright: Red-black tree code copyright (C) 2008- by Steven Schveighoffer. Other code
copyright 2010- Andrei Alexandrescu. All rights reserved by the respective holders.

License: Distributed under the Boost Software License, Version 1.0.
(See accompanying file LICENSE_1_0.txt or copy at $(WEB
boost.org/LICENSE_1_0.txt)).

Authors: Steven Schveighoffer, $(WEB erdani.com, Andrei Alexandrescu)
*/
module mystd.container.util;

/**
Returns an initialized object. This function is mainly for eliminating
construction differences between structs and classes. It allows code to not
worry about whether the type it's constructing is a struct or a class.
 */
template make(T)
if (is(T == struct) || is(T == class))
{
    T make(Args...)(Args arguments)
    if (is(T == struct) && __traits(compiles, T(arguments)))
    {
        // constructing an mystd.container.Array without arguments,
        // does not initialize its payload and is equivalent
        // to a null reference. We therefore construct an empty container
        // by passing an empty array to its constructor.
        // Issue #13872.
        static if(arguments.length == 0)
        {
            import mystd.range;
            alias ET = ElementType!(T.Range);
            return T(ET[].init);
        }
        else
            return T(arguments);
    }

    T make(Args...)(Args arguments)
    if (is(T == class) && __traits(compiles, new T(arguments)))
    {
        return new T(arguments);
    }
}


///
unittest
{
    import mystd.container;
    import mystd.algorithm : equal;
    import mystd.algorithm : equal;

    auto arr = make!(Array!int)([4, 2, 3, 1]);
    assert(equal(arr[], [4, 2, 3, 1]));

    auto rbt = make!(RedBlackTree!(int, "a > b"))([4, 2, 3, 1]);
    assert(equal(rbt[], [4, 3, 2, 1]));

    alias makeList = make!(SList!int);
    auto slist = makeList(1, 2, 3);
    assert(equal(slist[], [1, 2, 3]));
}

unittest
{
    import mystd.container;
    import mystd.algorithm : equal;

    auto arr1 = make!(Array!dchar)();
    assert(arr1.empty);
    auto arr2 = make!(Array!dchar)("hello"d);
    assert(equal(arr2[], "hello"d));

    auto rtb1 = make!(RedBlackTree!dchar)();
    assert(rtb1.empty);
    auto rtb2 = make!(RedBlackTree!dchar)('h', 'e', 'l', 'l', 'o');
    assert(equal(rtb2[], "ehlo"d));
}

// Issue 8895
unittest
{
    import mystd.container;
    import mystd.algorithm : equal;

    auto a = make!(DList!int)(1,2,3,4);
    auto b = make!(DList!int)(1,2,3,4);
    auto c = make!(DList!int)(1,2,3,5);
    auto d = make!(DList!int)(1,2,3,4,5);
    assert(a == b); // this better terminate!
    assert(a != c);
    assert(a != d);
}

/**
 * Convenience function for constructing a generic container.
 */
template make(alias Container, Args...)
    if(!is(Container))
{
    import mystd.range : isInputRange;
    import mystd.traits : isDynamicArray;

    auto make(Range)(Range range)
        if(!isDynamicArray!Range && isInputRange!Range)
    {
        import mystd.range : ElementType;
        return .make!(Container!(ElementType!Range, Args))(range);
    }

    auto make(T)(T[] items...)
    {
        return .make!(Container!(T, Args))(items);
    }
}

///
unittest
{
    import mystd.container.array, mystd.container.rbtree, mystd.container.slist;
    import mystd.range : iota;
    import mystd.algorithm : equal;

    auto arr = make!Array(iota(5));
    assert(equal(arr[], [0, 1, 2, 3, 4]));

    auto rbtmax = make!(RedBlackTree, "a > b")(iota(5));
    assert(equal(rbtmax[], [4, 3, 2, 1, 0]));

    auto rbtmin = make!RedBlackTree(4, 1, 3, 2);
    assert(equal(rbtmin[], [1, 2, 3, 4]));

    alias makeList = make!SList;
    auto list = makeList(1, 7, 42);
    assert(equal(list[], [1, 7, 42]));
}

unittest
{
    import mystd.container.rbtree;
    import mystd.algorithm : equal;

    auto rbtmin = make!(RedBlackTree, "a < b", false)(3, 2, 2, 1);
    assert(equal(rbtmin[], [1, 2, 3]));
}

// Issue 13872
unittest
{
    import mystd.container;

    auto tree1 = make!(RedBlackTree!int)();
    auto refToTree1 = tree1;
    refToTree1.insert(1);
    assert(1 in tree1);

    auto array1 = make!(Array!int)();
    auto refToArray1 = array1;
    refToArray1.insertBack(1);
    assert(!array1.empty);

    auto slist = make!(SList!int)();
    auto refToSlist = slist;
    refToSlist.insert(1);
    assert(!slist.empty);

    auto dlist = make!(DList!int)();
    auto refToDList = dlist;
    refToDList.insert(1);
    assert(!dlist.empty);
}
