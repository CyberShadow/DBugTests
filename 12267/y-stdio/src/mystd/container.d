// Written in the D programming language.

/**
Defines generic containers.

Source: $(PHOBOSSRC std/_container.d)
Macros:
WIKI = Phobos/StdContainer
TEXTWITHCOMMAS = $0

Copyright: Red-black tree code copyright (C) 2008- by Steven Schveighoffer. Other code
copyright 2010- Andrei Alexandrescu. All rights reserved by the respective holders.

License: Distributed under the Boost Software License, Version 1.0.
(See accompanying file LICENSE_1_0.txt or copy at $(WEB
boost.org/LICENSE_1_0.txt)).

Authors: Steven Schveighoffer, $(WEB erdani.com, Andrei Alexandrescu)

$(BOOKTABLE $(TEXTWITHCOMMAS Container primitives. A _container need not
implement all primitives, but if a primitive is implemented, it must
support the syntax described in the $(B syntax) column with the semantics
described in the $(B description) column, and it must not have worse worst-case
complexity than denoted in big-O notation in the $(BIGOH &middot;) column.
Below, $(D C) means a _container type, $(D c) is a value of _container
type, $(D n$(SUBx)) represents the effective length of value $(D x),
which could be a single element (in which case $(D n$(SUB x)) is $(D 1)),
a _container, or a range.),

$(TR $(TH Syntax) $(TH $(BIGOH &middot;)) $(TH Description))

$(TR $(TDNW $(D C(x))) $(TDNW $(D n$(SUB x))) $(TD Creates a
_container of type $(D C) from either another _container or a range.))

$(TR $(TDNW $(D c.dup)) $(TDNW $(D n$(SUB c))) $(TD Returns a
duplicate of the _container.))

$(TR $(TDNW $(D c ~ x)) $(TDNW $(D n$(SUB c) + n$(SUB x))) $(TD
Returns the concatenation of $(D c) and $(D r). $(D x) may be a single
element or an input range.))

$(TR $(TDNW $(D x ~ c)) $(TDNW $(D n$(SUB c) + n$(SUB x))) $(TD
Returns the concatenation of $(D x) and $(D c).  $(D x) may be a
single element or an input range type.))

$(LEADINGROW Iteration)

$(TR  $(TD $(D c.Range)) $(TD) $(TD The primary range
type associated with the _container.))

$(TR $(TD $(D c[])) $(TDNW $(D log n$(SUB c))) $(TD Returns a range
iterating over the entire _container, in a _container-defined order.))

$(TR $(TDNW $(D c[a .. b])) $(TDNW $(D log n$(SUB c))) $(TD Fetches a
portion of the _container from key $(D a) to key $(D b).))

$(LEADINGROW Capacity)

$(TR $(TD $(D c.empty)) $(TD $(D 1)) $(TD Returns $(D true) if the
_container has no elements, $(D false) otherwise.))

$(TR  $(TD $(D c.length)) $(TDNW $(D log n$(SUB c))) $(TD Returns the
number of elements in the _container.))

$(TR $(TDNW $(D c.length = n)) $(TDNW $(D n$(SUB c) + n)) $(TD Forces
the number of elements in the _container to $(D n). If the _container
ends up growing, the added elements are initialized in a
_container-dependent manner (usually with $(D T.init)).))

$(TR $(TD $(D c.capacity)) $(TDNW $(D log n$(SUB c))) $(TD Returns the
maximum number of elements that can be stored in the _container
without triggering a reallocation.))

$(TR $(TD $(D c.reserve(x))) $(TD $(D n$(SUB c))) $(TD Forces $(D
capacity) to at least $(D x) without reducing it.))

$(LEADINGROW Access)

$(TR $(TDNW $(D c.front)) $(TDNW $(D log n$(SUB c))) $(TD Returns the
first element of the _container, in a _container-defined order.))

$(TR $(TDNW $(D c.moveFront)) $(TDNW $(D log n$(SUB c))) $(TD
Destructively reads and returns the first element of the
_container. The slot is not removed from the _container; it is left
initalized with $(D T.init). This routine need not be defined if $(D
front) returns a $(D ref).))

$(TR $(TDNW $(D c.front = v)) $(TDNW $(D log n$(SUB c))) $(TD Assigns
$(D v) to the first element of the _container.))

$(TR $(TDNW $(D c.back)) $(TDNW $(D log n$(SUB c))) $(TD Returns the
last element of the _container, in a _container-defined order.))

$(TR $(TDNW $(D c.moveBack)) $(TDNW $(D log n$(SUB c))) $(TD
Destructively reads and returns the last element of the
container. The slot is not removed from the _container; it is left
initalized with $(D T.init). This routine need not be defined if $(D
front) returns a $(D ref).))

$(TR $(TDNW $(D c.back = v)) $(TDNW $(D log n$(SUB c))) $(TD Assigns
$(D v) to the last element of the _container.))

$(TR $(TDNW $(D c[x])) $(TDNW $(D log n$(SUB c))) $(TD Provides
indexed access into the _container. The index type is
_container-defined. A container may define several index types (and
consequently overloaded indexing).))

$(TR  $(TDNW $(D c.moveAt(x))) $(TDNW $(D log n$(SUB c))) $(TD
Destructively reads and returns the value at position $(D x). The slot
is not removed from the _container; it is left initialized with $(D
T.init).))

$(TR  $(TDNW $(D c[x] = v)) $(TDNW $(D log n$(SUB c))) $(TD Sets
element at specified index into the _container.))

$(TR  $(TDNW $(D c[x] $(I op)= v)) $(TDNW $(D log n$(SUB c)))
$(TD Performs read-modify-write operation at specified index into the
_container.))

$(LEADINGROW Operations)

$(TR $(TDNW $(D e in c)) $(TDNW $(D log n$(SUB c))) $(TD
Returns nonzero if e is found in $(D c).))

$(TR  $(TDNW $(D c.lowerBound(v))) $(TDNW $(D log n$(SUB c))) $(TD
Returns a range of all elements strictly less than $(D v).))

$(TR  $(TDNW $(D c.upperBound(v))) $(TDNW $(D log n$(SUB c))) $(TD
Returns a range of all elements strictly greater than $(D v).))

$(TR  $(TDNW $(D c.equalRange(v))) $(TDNW $(D log n$(SUB c))) $(TD
Returns a range of all elements in $(D c) that are equal to $(D v).))

$(LEADINGROW Modifiers)

$(TR $(TDNW $(D c ~= x)) $(TDNW $(D n$(SUB c) + n$(SUB x)))
$(TD Appends $(D x) to $(D c). $(D x) may be a single element or an
input range type.))

$(TR  $(TDNW $(D c.clear())) $(TDNW $(D n$(SUB c))) $(TD Removes all
elements in $(D c).))

$(TR  $(TDNW $(D c.insert(x))) $(TDNW $(D n$(SUB x) * log n$(SUB c)))
$(TD Inserts $(D x) in $(D c) at a position (or positions) chosen by $(D c).))

$(TR  $(TDNW $(D c.stableInsert(x)))
$(TDNW $(D n$(SUB x) * log n$(SUB c))) $(TD Same as $(D c.insert(x)),
but is guaranteed to not invalidate any ranges.))

$(TR  $(TDNW $(D c.linearInsert(v))) $(TDNW $(D n$(SUB c))) $(TD Same
as $(D c.insert(v)) but relaxes complexity to linear.))

$(TR  $(TDNW $(D c.stableLinearInsert(v))) $(TDNW $(D n$(SUB c)))
$(TD Same as $(D c.stableInsert(v)) but relaxes complexity to linear.))

$(TR  $(TDNW $(D c.removeAny())) $(TDNW $(D log n$(SUB c)))
$(TD Removes some element from $(D c) and returns it.))

$(TR  $(TDNW $(D c.stableRemoveAny())) $(TDNW $(D log n$(SUB c)))
$(TD Same as $(D c.removeAny()), but is guaranteed to not invalidate any
iterators.))

$(TR  $(TDNW $(D c.insertFront(v))) $(TDNW $(D log n$(SUB c)))
$(TD Inserts $(D v) at the front of $(D c).))

$(TR  $(TDNW $(D c.stableInsertFront(v))) $(TDNW $(D log n$(SUB c)))
$(TD Same as $(D c.insertFront(v)), but guarantees no ranges will be
invalidated.))

$(TR  $(TDNW $(D c.insertBack(v))) $(TDNW $(D log n$(SUB c)))
$(TD Inserts $(D v) at the back of $(D c).))

$(TR  $(TDNW $(D c.stableInsertBack(v))) $(TDNW $(D log n$(SUB c)))
$(TD Same as $(D c.insertBack(v)), but guarantees no ranges will be
invalidated.))

$(TR  $(TDNW $(D c.removeFront())) $(TDNW $(D log n$(SUB c)))
$(TD Removes the element at the front of $(D c).))

$(TR  $(TDNW $(D c.stableRemoveFront())) $(TDNW $(D log n$(SUB c)))
$(TD Same as $(D c.removeFront()), but guarantees no ranges will be
invalidated.))

$(TR  $(TDNW $(D c.removeBack())) $(TDNW $(D log n$(SUB c)))
$(TD Removes the value at the back of $(D c).))

$(TR  $(TDNW $(D c.stableRemoveBack())) $(TDNW $(D log n$(SUB c)))
$(TD Same as $(D c.removeBack()), but guarantees no ranges will be
invalidated.))

$(TR  $(TDNW $(D c.remove(r))) $(TDNW $(D n$(SUB r) * log n$(SUB c)))
$(TD Removes range $(D r) from $(D c).))

$(TR  $(TDNW $(D c.stableRemove(r)))
$(TDNW $(D n$(SUB r) * log n$(SUB c)))
$(TD Same as $(D c.remove(r)), but guarantees iterators are not
invalidated.))

$(TR  $(TDNW $(D c.linearRemove(r))) $(TDNW $(D n$(SUB c)))
$(TD Removes range $(D r) from $(D c).))

$(TR  $(TDNW $(D c.stableLinearRemove(r))) $(TDNW $(D n$(SUB c)))
$(TD Same as $(D c.linearRemove(r)), but guarantees iterators are not
invalidated.))

$(TR  $(TDNW $(D c.removeKey(k))) $(TDNW $(D log n$(SUB c)))
$(TD Removes an element from $(D c) by using its key $(D k).
The key's type is defined by the _container.))

$(TR  $(TDNW $(D )) $(TDNW $(D )) $(TD ))

)
 */
module mystd.container;

import core.exception, core.memory, core.stdc.stdlib, core.stdc.string,
    mystd.algorithm, mystd.conv, mystd.exception, mystd.functional, mystd.range,
    mystd.traits, mystd.typecons, mystd.typetuple;
version(unittest) import mystd.stdio;

version(unittest) version = RBDoChecks;

//version = RBDoChecks;

version(RBDoChecks)
{
    import mystd.stdio;
}



/* The following documentation and type $(D TotalContainer) are
intended for developers only.

$(D TotalContainer) is an unimplemented container that illustrates a
host of primitives that a container may define. It is to some extent
the bottom of the conceptual container hierarchy. A given container
most often will choose to only implement a subset of these primitives,
and define its own additional ones. Adhering to the standard primitive
names below allows generic code to work independently of containers.

Things to remember: any container must be a reference type, whether
implemented as a $(D class) or $(D struct). No primitive below
requires the container to escape addresses of elements, which means
that compliant containers can be defined to use reference counting or
other deterministic memory management techniques.

A container may choose to define additional specific operations. The
only requirement is that those operations bear different names than
the ones below, lest user code gets confused.

Complexity of operations should be interpreted as "at least as good
as". If an operation is required to have $(BIGOH n) complexity, it
could have anything lower than that, e.g. $(BIGOH log(n)). Unless
specified otherwise, $(D n) inside a $(BIGOH) expression stands for
the number of elements in the container.
 */
struct TotalContainer(T)
{
/**
If the container has a notion of key-value mapping, $(D KeyType)
defines the type of the key of the container.
 */
    alias KeyType = T;

/**
If the container has a notion of multikey-value mapping, $(D
KeyTypes[k]), where $(D k) is a zero-based unsigned number, defines
the type of the $(D k)th key of the container.

A container may define both $(D KeyType) and $(D KeyTypes), e.g. in
the case it has the notion of primary/preferred key.
 */
    alias KeyTypes = TypeTuple!T;

/**
If the container has a notion of key-value mapping, $(D ValueType)
defines the type of the value of the container. Typically, a map-style
container mapping values of type $(D K) to values of type $(D V)
defines $(D KeyType) to be $(D K) and $(D ValueType) to be $(D V).
 */
    alias ValueType = T;

/**
Defines the container's primary range, which embodies one of the
ranges defined in $(XREFMODULE range).

Generally a container may define several types of ranges.
 */
    struct Range
    {
        /++
        Range primitives.
        +/
        @property bool empty()
        {
            assert(0);
        }
        /// Ditto
        @property ref T front() //ref return optional
        {
            assert(0);
        }
        /// Ditto
        @property void front(T value) //Only when front does not return by ref
        {
            assert(0);
        }
        /// Ditto
        T moveFront()
        {
            assert(0);
        }
        /// Ditto
        void popFront()
        {
            assert(0);
        }
        /// Ditto
        @property ref T back() //ref return optional
        {
            assert(0);
        }
        /// Ditto
        @property void back(T value) //Only when front does not return by ref
        {
            assert(0);
        }
        /// Ditto
        T moveBack()
        {
            assert(0);
        }
        /// Ditto
        void popBack()
        {
            assert(0);
        }
        /// Ditto
        T opIndex(size_t i) //ref return optional
        {
            assert(0);
        }
        /// Ditto
        void opIndexAssign(size_t i, T value) //Only when front does not return by ref
        {
            assert(0);
        }
        /// Ditto
        T opIndexUnary(string op)(size_t i) //Only when front does not return by ref
        {
            assert(0);
        }
        /// Ditto
        void opIndexOpAssign(string op)(size_t i, T value) //Only when front does not return by ref
        {
            assert(0);
        }
        /// Ditto
        T moveAt(size_t i)
        {
            assert(0);
        }
        /// Ditto
        @property size_t length()
        {
            assert(0);
        }
    }

/**
Property returning $(D true) if and only if the container has no
elements.

Complexity: $(BIGOH 1)
 */
    @property bool empty()
    {
        assert(0);
    }

/**
Returns a duplicate of the container. The elements themselves are not
transitively duplicated.

Complexity: $(BIGOH n).
 */
    @property TotalContainer dup()
    {
        assert(0);
    }

/**
Returns the number of elements in the container.

Complexity: $(BIGOH log(n)).
*/
    @property size_t length()
    {
        assert(0);
    }

/**
Returns the maximum number of elements the container can store without
(a) allocating memory, (b) invalidating iterators upon insertion.

Complexity: $(BIGOH log(n)).
 */
    @property size_t capacity()
    {
        assert(0);
    }

/**
Ensures sufficient capacity to accommodate $(D n) elements.

Postcondition: $(D capacity >= n)

Complexity: $(BIGOH log(e - capacity)) if $(D e > capacity), otherwise
$(BIGOH 1).
 */
    void reserve(size_t e)
    {
        assert(0);
    }

/**
Returns a range that iterates over all elements of the container, in a
container-defined order. The container should choose the most
convenient and fast method of iteration for $(D opSlice()).

Complexity: $(BIGOH log(n))
 */
    Range opSlice()
    {
        assert(0);
    }

    /**
       Returns a range that iterates the container between two
       specified positions.

       Complexity: $(BIGOH log(n))
     */
    Range opSlice(size_t a, size_t b)
    {
        assert(0);
    }

/**
Forward to $(D opSlice().front) and $(D opSlice().back), respectively.

Complexity: $(BIGOH log(n))
 */
    @property ref T front() //ref return optional
    {
        assert(0);
    }
    /// Ditto
    @property void front(T value) //Only when front does not return by ref
    {
        assert(0);
    }
    /// Ditto
    T moveFront()
    {
        assert(0);
    }
    /// Ditto
    @property ref T back() //ref return optional
    {
        assert(0);
    }
    /// Ditto
    @property void back(T value) //Only when front does not return by ref
    {
        assert(0);
    }
    /// Ditto
    T moveBack()
    {
        assert(0);
    }

/**
Indexing operators yield or modify the value at a specified index.
 */
    ref T opIndex(KeyType) //ref return optional
    {
        assert(0);
    }
    /// ditto
    void opIndexAssign(KeyType i, T value) //Only when front does not return by ref
    {
        assert(0);
    }
    /// ditto
    T opIndexUnary(string op)(KeyType i) //Only when front does not return by ref
    {
        assert(0);
    }
    /// ditto
    void opIndexOpAssign(string op)(KeyType i, T value) //Only when front does not return by ref
    {
        assert(0);
    }
    /// ditto
    T moveAt(KeyType i)
    {
        assert(0);
    }

/**
$(D k in container) returns true if the given key is in the container.
 */
    bool opBinaryRight(string op)(KeyType k) if (op == "in")
    {
        assert(0);
    }

/**
Returns a range of all elements containing $(D k) (could be empty or a
singleton range).
 */
    Range equalRange(KeyType k)
    {
        assert(0);
    }

/**
Returns a range of all elements with keys less than $(D k) (could be
empty or a singleton range). Only defined by containers that store
data sorted at all times.
 */
    Range lowerBound(KeyType k)
    {
        assert(0);
    }

/**
Returns a range of all elements with keys larger than $(D k) (could be
empty or a singleton range).  Only defined by containers that store
data sorted at all times.
 */
    Range upperBound(KeyType k)
    {
        assert(0);
    }

/**
Returns a new container that's the concatenation of $(D this) and its
argument. $(D opBinaryRight) is only defined if $(D Stuff) does not
define $(D opBinary).

Complexity: $(BIGOH n + m), where m is the number of elements in $(D
stuff)
 */
    TotalContainer opBinary(string op)(Stuff rhs) if (op == "~")
    {
        assert(0);
    }

    /// ditto
    TotalContainer opBinaryRight(string op)(Stuff lhs) if (op == "~")
    {
        assert(0);
    }

/**
Forwards to $(D insertAfter(this[], stuff)).
 */
    void opOpAssign(string op)(Stuff stuff) if (op == "~")
    {
        assert(0);
    }

/**
Removes all contents from the container. The container decides how $(D
capacity) is affected.

Postcondition: $(D empty)

Complexity: $(BIGOH n)
 */
    void clear()
    {
        assert(0);
    }

/**
Sets the number of elements in the container to $(D newSize). If $(D
newSize) is greater than $(D length), the added elements are added to
unspecified positions in the container and initialized with $(D
.init).

Complexity: $(BIGOH abs(n - newLength))

Postcondition: $(D _length == newLength)
 */
    @property void length(size_t newLength)
    {
        assert(0);
    }

/**
Inserts $(D stuff) in an unspecified position in the
container. Implementations should choose whichever insertion means is
the most advantageous for the container, but document the exact
behavior. $(D stuff) can be a value convertible to the element type of
the container, or a range of values convertible to it.

The $(D stable) version guarantees that ranges iterating over the
container are never invalidated. Client code that counts on
non-invalidating insertion should use $(D stableInsert). Such code would
not compile against containers that don't support it.

Returns: The number of elements added.

Complexity: $(BIGOH m * log(n)), where $(D m) is the number of
elements in $(D stuff)
 */
    size_t insert(Stuff)(Stuff stuff)
    {
        assert(0);
    }
    ///ditto
    size_t stableInsert(Stuff)(Stuff stuff)
    {
        assert(0);
    }

/**
Same as $(D insert(stuff)) and $(D stableInsert(stuff)) respectively,
but relax the complexity constraint to linear.
 */
    size_t linearInsert(Stuff)(Stuff stuff)
    {
        assert(0);
    }
    ///ditto
    size_t stableLinearInsert(Stuff)(Stuff stuff)
    {
        assert(0);
    }

/**
Picks one value in an unspecified position in the container, removes
it from the container, and returns it. Implementations should pick the
value that's the most advantageous for the container, but document the
exact behavior. The stable version behaves the same, but guarantees that
ranges iterating over the container are never invalidated.

Precondition: $(D !empty)

Returns: The element removed.

Complexity: $(BIGOH log(n)).
 */
    T removeAny()
    {
        assert(0);
    }
    /// ditto
    T stableRemoveAny()
    {
        assert(0);
    }

/**
Inserts $(D value) to the front or back of the container. $(D stuff)
can be a value convertible to the container's element type or a range
of values convertible to it. The stable version behaves the same, but
guarantees that ranges iterating over the container are never
invalidated.

Returns: The number of elements inserted

Complexity: $(BIGOH log(n)).
 */
    size_t insertFront(Stuff)(Stuff stuff)
    {
        assert(0);
    }
    /// ditto
    size_t stableInsertFront(Stuff)(Stuff stuff)
    {
        assert(0);
    }
    /// ditto
    size_t insertBack(Stuff)(Stuff stuff)
    {
        assert(0);
    }
    /// ditto
    size_t stableInsertBack(T value)
    {
        assert(0);
    }

/**
Removes the value at the front or back of the container. The stable
version behaves the same, but guarantees that ranges iterating over
the container are never invalidated. The optional parameter $(D
howMany) instructs removal of that many elements. If $(D howMany > n),
all elements are removed and no exception is thrown.

Precondition: $(D !empty)

Complexity: $(BIGOH log(n)).
 */
    void removeFront()
    {
        assert(0);
    }
    /// ditto
    void stableRemoveFront()
    {
        assert(0);
    }
    /// ditto
    void removeBack()
    {
        assert(0);
    }
    /// ditto
    void stableRemoveBack()
    {
        assert(0);
    }

/**
Removes $(D howMany) values at the front or back of the
container. Unlike the unparameterized versions above, these functions
do not throw if they could not remove $(D howMany) elements. Instead,
if $(D howMany > n), all elements are removed. The returned value is
the effective number of elements removed. The stable version behaves
the same, but guarantees that ranges iterating over the container are
never invalidated.

Returns: The number of elements removed

Complexity: $(BIGOH howMany * log(n)).
 */
    size_t removeFront(size_t howMany)
    {
        assert(0);
    }
    /// ditto
    size_t stableRemoveFront(size_t howMany)
    {
        assert(0);
    }
    /// ditto
    size_t removeBack(size_t howMany)
    {
        assert(0);
    }
    /// ditto
    size_t stableRemoveBack(size_t howMany)
    {
        assert(0);
    }

/**
Removes all values corresponding to key $(D k).

Complexity: $(BIGOH m * log(n)), where $(D m) is the number of
elements with the same key.

Returns: The number of elements removed.
 */
    size_t removeKey(KeyType k)
    {
        assert(0);
    }

/**
Inserts $(D stuff) before, after, or instead range $(D r), which must
be a valid range previously extracted from this container. $(D stuff)
can be a value convertible to the container's element type or a range
of objects convertible to it. The stable version behaves the same, but
guarantees that ranges iterating over the container are never
invalidated.

Returns: The number of values inserted.

Complexity: $(BIGOH n + m), where $(D m) is the length of $(D stuff)
 */
    size_t insertBefore(Stuff)(Range r, Stuff stuff)
    {
        assert(0);
    }
    /// ditto
    size_t stableInsertBefore(Stuff)(Range r, Stuff stuff)
    {
        assert(0);
    }
    /// ditto
    size_t insertAfter(Stuff)(Range r, Stuff stuff)
    {
        assert(0);
    }
    /// ditto
    size_t stableInsertAfter(Stuff)(Range r, Stuff stuff)
    {
        assert(0);
    }
    /// ditto
    size_t replace(Stuff)(Range r, Stuff stuff)
    {
        assert(0);
    }
    /// ditto
    size_t stableReplace(Stuff)(Range r, Stuff stuff)
    {
        assert(0);
    }

/**
Removes all elements belonging to $(D r), which must be a range
obtained originally from this container. The stable version behaves the
same, but guarantees that ranges iterating over the container are
never invalidated.

Returns: A range spanning the remaining elements in the container that
initially were right after $(D r).

Complexity: $(BIGOH m * log(n)), where $(D m) is the number of
elements in $(D r)
 */
    Range remove(Range r)
    {
        assert(0);
    }
    /// ditto
    Range stableRemove(Range r)
    {
        assert(0);
    }

/**
Same as $(D remove) above, but has complexity relaxed to linear.

Returns: A range spanning the remaining elements in the container that
initially were right after $(D r).

Complexity: $(BIGOH n)
 */
    Range linearRemove(Range r)
    {
        assert(0);
    }
    /// ditto
    Range stableLinearRemove(Range r)
    {
        assert(0);
    }
}

unittest {
    TotalContainer!int test;
}

/**
Returns an initialized object. This function is mainly for eliminating
construction differences between structs and classes. It allows code to not
worry about whether the type it's constructing is a struct or a class.

Examples:
--------------------
auto arr = make!(Array!int)([4, 2, 3, 1]);
assert(equal(arr[], [4, 2, 3, 1]));

auto rbt = make!(RedBlackTree!(int, "a > b"))([4, 2, 3, 1]);
assert(equal(rbt[], [4, 3, 2, 1]));

alias makeList = make!(DList!int);
auto list = makeList([1, 7, 42]);
assert(equal(list[], [1, 7, 42]));
--------------------
 */
template make(T)
if (is(T == struct) || is(T == class))
{
    T make(Args...)(Args arguments)
    if (is(T == struct) && __traits(compiles, T(arguments)))
    {
        return T(arguments);
    }

    T make(Args...)(Args arguments)
    if (is(T == class) && __traits(compiles, new T(arguments)))
    {
        return new T(arguments);
    }
}

//Verify Examples.
unittest
{
    auto arr = make!(Array!int)([4, 2, 3, 1]);
    assert(equal(arr[], [4, 2, 3, 1]));

    auto rbt = make!(RedBlackTree!(int, "a > b"))([4, 2, 3, 1]);
    assert(equal(rbt[], [4, 3, 2, 1]));

    alias makeList = make!(DList!int);
    auto list = makeList([1, 7, 42]);
    assert(equal(list[], [1, 7, 42]));
}

unittest
{
    auto arr1 = make!(Array!dchar)();
    assert(arr1.empty);
    auto arr2 = make!(Array!dchar)("hello"d);
    assert(equal(arr2[], "hello"d));

    auto rtb1 = make!(RedBlackTree!dchar)();
    assert(rtb1.empty);
    auto rtb2 = make!(RedBlackTree!dchar)('h', 'e', 'l', 'l', 'o');
    assert(equal(rtb2[], "ehlo"d));
}

/**
   Implements a simple and fast singly-linked list.
 */
struct SList(T)
{
    private struct Node
    {
        T _payload;
        Node * _next;
        this(T a, Node* b) { _payload = a; _next = b; }
    }
    private Node * _root;

    private static Node * findLastNode(Node * n)
    {
        assert(n);
        auto ahead = n._next;
        while (ahead)
        {
            n = ahead;
            ahead = n._next;
        }
        return n;
    }

    private static Node * findLastNode(Node * n, size_t limit)
    {
        assert(n && limit);
        auto ahead = n._next;
        while (ahead)
        {
            if (!--limit) break;
            n = ahead;
            ahead = n._next;
        }
        return n;
    }

    private static Node * findNode(Node * n, Node * findMe)
    {
        assert(n);
        auto ahead = n._next;
        while (ahead != findMe)
        {
            n = ahead;
            enforce(n);
            ahead = n._next;
        }
        return n;
    }

/**
Constructor taking a number of nodes
     */
    this(U)(U[] values...) if (isImplicitlyConvertible!(U, T))
    {
        insertFront(values);
    }

/**
Constructor taking an input range
     */
    this(Stuff)(Stuff stuff)
    if (isInputRange!Stuff
            && isImplicitlyConvertible!(ElementType!Stuff, T)
            && !is(Stuff == T[]))
    {
        insertFront(stuff);
    }

/**
Comparison for equality.

Complexity: $(BIGOH min(n, n1)) where $(D n1) is the number of
elements in $(D rhs).
     */
    bool opEquals(const SList rhs) const
    {
        return opEquals(rhs);
    }

    /// ditto
    bool opEquals(ref const SList rhs) const
    {
        const(Node) * n1 = _root, n2 = rhs._root;

        for (;; n1 = n1._next, n2 = n2._next)
        {
            if (!n1) return !n2;
            if (!n2 || n1._payload != n2._payload) return false;
        }
    }

/**
Defines the container's primary range, which embodies a forward range.
     */
    struct Range
    {
        private Node * _head;
        private this(Node * p) { _head = p; }

        /// Input range primitives.
        @property bool empty() const { return !_head; }

        /// ditto
        @property ref T front()
        {
            assert(!empty, "SList.Range.front: Range is empty");
            return _head._payload;
        }

        /// ditto
        void popFront()
        {
            assert(!empty, "SList.Range.popFront: Range is empty");
            _head = _head._next;
        }

        /// Forward range primitive.
        @property Range save() { return this; }

        T moveFront()
        {
            assert(!empty, "SList.Range.moveFront: Range is empty");
            return move(_head._payload);
        }

        bool sameHead(Range rhs)
        {
            return _head && _head == rhs._head;
        }
    }

    unittest
    {
        static assert(isForwardRange!Range);
    }

/**
Property returning $(D true) if and only if the container has no
elements.

Complexity: $(BIGOH 1)
     */
    @property bool empty() const
    {
        return _root is null;
    }

/**
Duplicates the container. The elements themselves are not transitively
duplicated.

Complexity: $(BIGOH n).
     */
    @property SList dup()
    {
        return SList(this[]);
    }

/**
Returns a range that iterates over all elements of the container, in
forward order.

Complexity: $(BIGOH 1)
     */
    Range opSlice()
    {
        return Range(_root);
    }

/**
Forward to $(D opSlice().front).

Complexity: $(BIGOH 1)
     */
    @property ref T front()
    {
        assert(!empty, "SList.front: List is empty");
        return _root._payload;
    }

    unittest
    {
        auto s = SList!int(1, 2, 3);
        s.front = 42;
        assert(s == SList!int(42, 2, 3));
    }

/**
Returns a new $(D SList) that's the concatenation of $(D this) and its
argument. $(D opBinaryRight) is only defined if $(D Stuff) does not
define $(D opBinary).
     */
    SList opBinary(string op, Stuff)(Stuff rhs)
    if (op == "~" && is(typeof(SList(rhs))))
    {
        auto toAdd = SList(rhs);
        static if (is(Stuff == SList))
        {
            toAdd = toAdd.dup;
        }
        if (empty) return toAdd;
        // TODO: optimize
        auto result = dup;
        auto n = findLastNode(result._root);
        n._next = toAdd._root;
        return result;
    }

/**
Removes all contents from the $(D SList).

Postcondition: $(D empty)

Complexity: $(BIGOH 1)
     */
    void clear()
    {
        _root = null;
    }

/**
Inserts $(D stuff) to the front of the container. $(D stuff) can be a
value convertible to $(D T) or a range of objects convertible to $(D
T). The stable version behaves the same, but guarantees that ranges
iterating over the container are never invalidated.

Returns: The number of elements inserted

Complexity: $(BIGOH m), where $(D m) is the length of $(D stuff)
     */
    size_t insertFront(Stuff)(Stuff stuff)
    if (isInputRange!Stuff && isImplicitlyConvertible!(ElementType!Stuff, T))
    {
        size_t result;
        Node * n, newRoot;
        foreach (item; stuff)
        {
            auto newNode = new Node(item, null);
            (newRoot ? n._next : newRoot) = newNode;
            n = newNode;
            ++result;
        }
        if (!n) return 0;
        // Last node points to the old root
        n._next = _root;
        _root = newRoot;
        return result;
    }

    /// ditto
    size_t insertFront(Stuff)(Stuff stuff)
    if (isImplicitlyConvertible!(Stuff, T))
    {
        auto newRoot = new Node(stuff, _root);
        _root = newRoot;
        return 1;
    }

/// ditto
    alias insert = insertFront;

/// ditto
    alias stableInsert = insert;

    /// ditto
    alias stableInsertFront = insertFront;

/**
Picks one value from the front of the container, removes it from the
container, and returns it.

Precondition: $(D !empty)

Returns: The element removed.

Complexity: $(BIGOH 1).
     */
    T removeAny()
    {
        assert(!empty, "SList.removeAny: List is empty");
        auto result = move(_root._payload);
        _root = _root._next;
        return result;
    }
    /// ditto
    alias stableRemoveAny = removeAny;

/**
Removes the value at the front of the container. The stable version
behaves the same, but guarantees that ranges iterating over the
container are never invalidated.

Precondition: $(D !empty)

Complexity: $(BIGOH 1).
     */
    void removeFront()
    {
        assert(!empty, "SList.removeFront: List is empty");
        _root = _root._next;
    }

    /// ditto
    alias stableRemoveFront = removeFront;

/**
Removes $(D howMany) values at the front or back of the
container. Unlike the unparameterized versions above, these functions
do not throw if they could not remove $(D howMany) elements. Instead,
if $(D howMany > n), all elements are removed. The returned value is
the effective number of elements removed. The stable version behaves
the same, but guarantees that ranges iterating over the container are
never invalidated.

Returns: The number of elements removed

Complexity: $(BIGOH howMany * log(n)).
     */
    size_t removeFront(size_t howMany)
    {
        size_t result;
        while (_root && result < howMany)
        {
            _root = _root._next;
            ++result;
        }
        return result;
    }

    /// ditto
    alias stableRemoveFront = removeFront;

/**
Inserts $(D stuff) after range $(D r), which must be a range
previously extracted from this container. Given that all ranges for a
list end at the end of the list, this function essentially appends to
the list and uses $(D r) as a potentially fast way to reach the last
node in the list. Ideally $(D r) is positioned near or at the last
element of the list.

$(D stuff) can be a value convertible to $(D T) or a range of objects
convertible to $(D T). The stable version behaves the same, but
guarantees that ranges iterating over the container are never
invalidated.

Returns: The number of values inserted.

Complexity: $(BIGOH k + m), where $(D k) is the number of elements in
$(D r) and $(D m) is the length of $(D stuff).

Examples:
--------------------
auto sl = SList!string(["a", "b", "d"]);
sl.insertAfter(sl[], "e"); // insert at the end (slowest)
assert(mystd.algorithm.equal(sl[], ["a", "b", "d", "e"]));
sl.insertAfter(mystd.range.take(sl[], 2), "c"); // insert after "b"
assert(mystd.algorithm.equal(sl[], ["a", "b", "c", "d", "e"]));
--------------------
     */

    size_t insertAfter(Stuff)(Range r, Stuff stuff)
    {
        if (!_root)
        {
            enforce(!r._head);
            return insertFront(stuff);
        }
        enforce(r._head);
        auto n = findLastNode(r._head);
        SList tmp;
        auto result = tmp.insertFront(stuff);
        n._next = tmp._root;
        return result;
    }

/**
Similar to $(D insertAfter) above, but accepts a range bounded in
count. This is important for ensuring fast insertions in the middle of
the list.  For fast insertions after a specified position $(D r), use
$(D insertAfter(take(r, 1), stuff)). The complexity of that operation
only depends on the number of elements in $(D stuff).

Precondition: $(D r.original.empty || r.maxLength > 0)

Returns: The number of values inserted.

Complexity: $(BIGOH k + m), where $(D k) is the number of elements in
$(D r) and $(D m) is the length of $(D stuff).
     */
    size_t insertAfter(Stuff)(Take!Range r, Stuff stuff)
    {
        auto orig = r.source;
        if (!orig._head)
        {
            // Inserting after a null range counts as insertion to the
            // front
            return insertFront(stuff);
        }
        enforce(!r.empty);
        // Find the last valid element in the range
        foreach (i; 1 .. r.maxLength)
        {
            if (!orig._head._next) break;
            orig.popFront();
        }
        // insert here
        SList tmp;
        tmp._root = orig._head._next;
        auto result = tmp.insertFront(stuff);
        orig._head._next = tmp._root;
        return result;
    }

/// ditto
    alias stableInsertAfter = insertAfter;

/**
Removes a range from the list in linear time.

Returns: An empty range.

Complexity: $(BIGOH n)
     */
    Range linearRemove(Range r)
    {
        if (!_root)
        {
            enforce(!r._head);
            return this[];
        }
        auto n = findNode(_root, r._head);
        n._next = null;
        return Range(null);
    }

/**
Removes a $(D Take!Range) from the list in linear time.

Returns: A range comprehending the elements after the removed range.

Complexity: $(BIGOH n)
     */
    Range linearRemove(Take!Range r)
    {
        auto orig = r.source;
        // We have something to remove here
        if (orig._head == _root)
        {
            // remove straight from the head of the list
            for (; !r.empty; r.popFront())
            {
                removeFront();
            }
            return this[];
        }
        if (!r.maxLength)
        {
            // Nothing to remove, return the range itself
            return orig;
        }
        // Remove from somewhere in the middle of the list
        enforce(_root);
        auto n1 = findNode(_root, orig._head);
        auto n2 = findLastNode(orig._head, r.maxLength);
        n1._next = n2._next;
        return Range(n1._next);
    }

/// ditto
    alias stableLinearRemove = linearRemove;
}

unittest
{
    auto s = make!(SList!int)(1, 2, 3);
    auto n = s.findLastNode(s._root);
    assert(n && n._payload == 3);
}

unittest
{
    auto s = SList!int(1, 2, 5, 10);
    assert(walkLength(s[]) == 4);
}

unittest
{
    auto src = take([0, 1, 2, 3], 3);
    auto s = SList!int(src);
    assert(s == SList!int(0, 1, 2));
}

unittest
{
    auto a = SList!int(1, 2, 3);
    auto b = SList!int(4, 5, 6);
    // @@@BUG@@@ in compiler
    //auto c = a ~ b;
    auto d = [ 4, 5, 6 ];
    auto e = a ~ d;
    assert(e == SList!int(1, 2, 3, 4, 5, 6));
}

unittest
{
    auto a = SList!int(1, 2, 3);
    auto c = a ~ 4;
    assert(c == SList!int(1, 2, 3, 4));
}

unittest
{
    auto s = SList!int(1, 2, 3, 4);
    s.insertFront([ 42, 43 ]);
    assert(s == SList!int(42, 43, 1, 2, 3, 4));
}

unittest
{
    auto s = SList!int(1, 2, 3);
    assert(s.removeAny() == 1);
    assert(s == SList!int(2, 3));
    assert(s.stableRemoveAny() == 2);
    assert(s == SList!int(3));
}

unittest
{
    auto s = SList!int(1, 2, 3);
    s.removeFront();
    assert(equal(s[], [2, 3]));
    s.stableRemoveFront();
    assert(equal(s[], [3]));
}

unittest
{
    auto s = SList!int(1, 2, 3, 4, 5, 6, 7);
    assert(s.removeFront(3) == 3);
    assert(s == SList!int(4, 5, 6, 7));
}

unittest
{
    auto a = SList!int(1, 2, 3);
    auto b = SList!int(1, 2, 3);
    assert(a.insertAfter(a[], b[]) == 3);
}

unittest
{
    auto s = SList!int(1, 2, 3, 4);
    auto r = take(s[], 2);
    assert(s.insertAfter(r, 5) == 1);
    assert(s == SList!int(1, 2, 5, 3, 4));
}

unittest
{
    // insertAfter documentation example
    auto sl = SList!string(["a", "b", "d"]);
    sl.insertAfter(sl[], "e"); // insert at the end (slowest)
    assert(mystd.algorithm.equal(sl[], ["a", "b", "d", "e"]));
    sl.insertAfter(mystd.range.take(sl[], 2), "c"); // insert after "b"
    assert(mystd.algorithm.equal(sl[], ["a", "b", "c", "d", "e"]));
}

unittest
{
    auto s = SList!int(1, 2, 3, 4, 5);
    auto r = s[];
    popFrontN(r, 3);
    auto r1 = s.linearRemove(r);
    assert(s == SList!int(1, 2, 3));
    assert(r1.empty);
}

unittest
{
    auto s = SList!int(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
    auto r = s[];
    popFrontN(r, 3);
    auto r1 = take(r, 4);
    assert(equal(r1, [4, 5, 6, 7]));
    auto r2 = s.linearRemove(r1);
    assert(s == SList!int(1, 2, 3, 8, 9, 10));
    assert(equal(r2, [8, 9, 10]));
}

unittest
{
    auto lst = SList!int(1, 5, 42, 9);
    assert(!lst.empty);
    assert(lst.front == 1);
    assert(walkLength(lst[]) == 4);

    auto lst2 = lst ~ [ 1, 2, 3 ];
    assert(walkLength(lst2[]) == 7);

    auto lst3 = lst ~ [ 7 ];
    assert(walkLength(lst3[]) == 5);
}

unittest
{
    auto s = make!(SList!int)(1, 2, 3);
}

unittest
{
    // 5193
    static struct Data
    {
        const int val;
    }
    SList!Data list;
}

unittest
{
    auto s = SList!int([1, 2, 3]);
    s.front = 5; //test frontAssign
    assert(s.front == 5);
    auto r = s[];
    r.front = 1; //test frontAssign
    assert(r.front == 1);
}

/**
Implements a doubly-linked list.

$(D DList) uses neither reference nor value semantics. They can be seen as
several different handles into an external chain of nodes. Several different
$(D DList)s can all reference different points in a same chain.

$(D DList.Range) is, for all intents and purposes, a DList with range
semantics. The $(D DList.Range) has a view directly into the chain itself.
It is not tied to its parent $(D DList), and may be used to operate on
other lists (that point to the same chain).

The ONLY operation that can invalidate a $(D DList) or $(D DList.Range), but
which will invalidate BOTH, is the $(D remove) operation, if the cut Range
overlaps with the boundaries of another DList or DList.Range.

Example:
----
auto a = DList!int([3, 4]); //Create a new chain
auto b = a; //Point to the same chain
// (3 - 4)
assert(a[].equal([3, 4]));
assert(b[].equal([3, 4]));

b.stableInsertFront(1); //insert before of b
b.stableInsertBack(5); //insert after of b
// (2 - (3 - 4) - 5)
assert(a[].equal([3, 4])); //a is not changed
assert(b[].equal([1, 3, 4, 5])); // but b is changed

a.stableInsertFront(2); //insert in front of a, this will insert "inside" the chain
// (1 - (2 - 3 - 4) - 5)
assert(a[].equal([2, 3, 4])); //a is modified
assert(b[].equal([1, 2, 3, 4, 5])); //and so is b;

a.remove(a[]); //remove all the elements of a: This will cut them from the chain;
// (1 - 5)
assert(a[].empty); //a is empty
assert(b[].equal([1, 5])); //b has lost some of its elements;

a.insert(2); //insert in a. This will create a new chain
// (2)
// (1 - 5)
assert(a[].equal([2])); //a is a new chain
assert(b[].equal([1, 5])); //b is unchanged;
----
 */
struct DList(T)
{
    private struct Node
    {
        T _payload;
        Node * _prev;
        Node * _next;
        this(T a, Node* p, Node* n)
        {
            _payload = a;
            _prev = p; _next = n;
            if (p) p._next = &this;
            if (n) n._prev = &this;
        }
    }
    private Node * _first;
    private Node * _last;

/**
Constructor taking a number of nodes
     */
    this(U)(U[] values...) if (isImplicitlyConvertible!(U, T))
    {
        insertBack(values);
    }

/**
Constructor taking an input range
     */
    this(Stuff)(Stuff stuff)
    if (isInputRange!Stuff && isImplicitlyConvertible!(ElementType!Stuff, T))
    {
        insertBack(stuff);
    }

/**
Comparison for equality.

Complexity: $(BIGOH min(n, n1)) where $(D n1) is the number of
elements in $(D rhs).
     */
    bool opEquals()(ref const DList rhs) const
    if (is(typeof(front == front)))
    {
        if(_first == rhs._first) return _last == rhs._last;
        if(_last == rhs._last) return false;

        const(Node)* nthis = _first, nrhs = rhs._first;
        while(true)
        {
            if (!nthis) return !nrhs;
            if (!nrhs || nthis._payload != nrhs._payload) return false;
            nthis = nthis._next;
            nrhs = nrhs._next;
        }
    }

    /**
    Defines the container's primary range, which embodies a bidirectional range.
     */
    struct Range
    {
        private Node * _first;
        private Node * _last;
        private this(Node* first, Node* last)
        {
            assert(!!_first == !!_last, "Dlist.Rangethis: Invalid arguments");
            _first = first; _last = last;
        }
        private this(Node* n) { _first = _last = n; }

        /// Input range primitives.
        @property const nothrow
        bool empty()
        {
            assert(!!_first == !!_last, "DList.Range: Invalidated state");
            return !_first;
        }

        /// ditto
        @property ref T front()
        {
            assert(!empty, "DList.Range.front: Range is empty");
            return _first._payload;
        }

        /// ditto
        void popFront()
        {
            assert(!empty, "DList.Range.popFront: Range is empty");
            if (_first is _last)
            {
                _first = _last = null;
            }
            else
            {
                assert(_first is _first._next._prev, "DList.Range: Invalidated state");
                _first = _first._next;
            }
        }

        /// Forward range primitive.
        @property Range save() { return this; }

        /// Bidirectional range primitives.
        @property ref T back()
        {
            assert(!empty, "DList.Range.back: Range is empty");
            return _last._payload;
        }

        /// ditto
        void popBack()
        {
            assert(!empty, "DList.Range.popBack: Range is empty");
            if (_first is _last)
            {
                _first = _last = null;
            }
            else
            {
                assert(_last is _last._prev._next, "DList.Range: Invalidated state");
                _last = _last._prev;
            }
        }
    }

    unittest
    {
        static assert(isBidirectionalRange!Range);
    }

/**
Property returning $(D true) if and only if the container has no
elements.

Complexity: $(BIGOH 1)
     */
    @property const nothrow
    bool empty()
    {
        assert(!!_first == !!_last, "DList: Internal error, inconsistant list");
        return _first is null;
    }

/**
Removes all contents from the $(D DList).

Postcondition: $(D empty)

Complexity: $(BIGOH 1)
     */
    void clear()
    {
        //remove actual elements.
        remove(this[]);
    }

/**
Duplicates the container. The elements themselves are not transitively
duplicated.

Complexity: $(BIGOH n).
     */
    @property DList dup()
    {
        return DList(this[]);
    }

/**
Returns a range that iterates over all elements of the container, in
forward order.

Complexity: $(BIGOH 1)
     */
    Range opSlice()
    {
        return Range(_first, _last);
    }

/**
Forward to $(D opSlice().front).

Complexity: $(BIGOH 1)
     */
    @property ref inout(T) front() inout
    {
        assert(!empty, "DList.front: List is empty");
        return _first._payload;
    }

/**
Forward to $(D opSlice().back).

Complexity: $(BIGOH 1)
     */
    @property ref inout(T) back() inout
    {
        assert(!empty, "DList.back: List is empty");
        return _last._payload;
    }

/+ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ +/
/+                        BEGIN CONCAT FUNCTIONS HERE                         +/
/+ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ +/

/**
Returns a new $(D DList) that's the concatenation of $(D this) and its
argument $(D rhs).
     */
    DList opBinary(string op, Stuff)(Stuff rhs)
    if (op == "~" && is(typeof(insertBack(rhs))))
    {
        auto ret = this.dup;
        ret.insertBack(rhs);
        return ret;
    }
    /// ditto
    DList opBinary(string op)(DList rhs)
    if (op == "~")
    {
        return ret ~ rhs[];
    }

/**
Returns a new $(D DList) that's the concatenation of the argument $(D lhs)
and $(D this).
     */
    DList opBinaryRight(string op, Stuff)(Stuff lhs)
    if (op == "~" && is(typeof(insertFront(lhs))))
    {
        auto ret = this.dup;
        ret.insertFront(lhs);
        return ret;
    }

/**
Appends the contents of the argument $(D rhs) into $(D this).
     */
    DList opOpAssign(string op, Stuff)(Stuff rhs)
    if (op == "~" && is(typeof(insertBack(rhs))))
    {
        insertBack(rhs);
        return this;
    }

/// ditto
    DList opOpAssign(string op)(DList rhs)
    if (op == "~")
    {
        return this ~= rhs[];
    }

/+ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ +/
/+                        BEGIN INSERT FUNCTIONS HERE                         +/
/+ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ +/

/**
Inserts $(D stuff) to the front/back of the container. $(D stuff) can be a
value convertible to $(D T) or a range of objects convertible to $(D
T). The stable version behaves the same, but guarantees that ranges
iterating over the container are never invalidated.

Returns: The number of elements inserted

Complexity: $(BIGOH log(n))
     */
    size_t insertFront(Stuff)(Stuff stuff)
    {
        return insertBeforeNode(_first, stuff);
    }

    /// ditto
    size_t insertBack(Stuff)(Stuff stuff)
    {
        return insertBeforeNode(null, stuff);
    }

    /// ditto
    alias insert = insertBack;

    /// ditto
    alias stableInsert = insert;

    /// ditto
    alias stableInsertFront = insertFront;

    /// ditto
    alias stableInsertBack = insertBack;

/**
Inserts $(D stuff) after range $(D r), which must be a non-empty range
previously extracted from this container.

$(D stuff) can be a value convertible to $(D T) or a range of objects
convertible to $(D T). The stable version behaves the same, but
guarantees that ranges iterating over the container are never
invalidated.

Elements are not actually removed from the chain, but the $(D DList)'s,
first/last pointer is advanced.

Returns: The number of values inserted.

Complexity: $(BIGOH k + m), where $(D k) is the number of elements in
$(D r) and $(D m) is the length of $(D stuff).
     */
    size_t insertBefore(Stuff)(Range r, Stuff stuff)
    {
        Node* n = (r._first) ? r._first : _first;
        return insertBeforeNode(n, stuff);
    }

    /// ditto
    alias stableInsertBefore = insertBefore;

    /// ditto
    size_t insertAfter(Stuff)(Range r, Stuff stuff)
    {
        Node* n = (r._last) ? r._last._next : null;
        return insertBeforeNode(n, stuff);
    }

    /// ditto
    alias stableInsertAfter = insertAfter;

/+ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ +/
/+                        BEGIN REMOVE FUNCTIONS HERE                         +/
/+ ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ +/

/**
Picks one value from the front of the container, removes it from the
container, and returns it.

Elements are not actually removed from the chain, but the $(D DList)'s,
first/last pointer is advanced.

Precondition: $(D !empty)

Returns: The element removed.

Complexity: $(BIGOH 1).
     */
    T removeAny()
    {
        assert(!empty, "DList.removeAny: List is empty");
        auto result = move(back);
        _last = _last._prev;
        if (_last is null)
        {
            _first = null;
        }
        return result;
    }
    /// ditto
    alias stableRemoveAny = removeAny;

/**
Removes the value at the front/back of the container. The stable version
behaves the same, but guarantees that ranges iterating over the
container are never invalidated.

Elements are not actually removed from the chain, but the $(D DList)'s,
first/last pointer is advanced.

Precondition: $(D !empty)

Complexity: $(BIGOH 1).
     */
    void removeFront()
    {
        assert(!empty, "DList.removeFront: List is empty");
        _first = _first._next;
        if (_first is null)
        {
            _last = null;
        }
    }

    /// ditto
    alias stableRemoveFront = removeFront;

    /// ditto
    void removeBack()
    {
        assert(!empty, "DList.removeBack: List is empty");
        _last = _last._prev;
        if (_last is null)
        {
            _first = null;
        }
    }

    /// ditto
    alias stableRemoveBack = removeBack;

/**
Removes $(D howMany) values at the front or back of the
container. Unlike the unparameterized versions above, these functions
do not throw if they could not remove $(D howMany) elements. Instead,
if $(D howMany > n), all elements are removed. The returned value is
the effective number of elements removed. The stable version behaves
the same, but guarantees that ranges iterating over the container are
never invalidated.

Elements are not actually removed from the chain, but the $(D DList)'s,
first/last pointer is advanced.

Returns: The number of elements removed

Complexity: $(BIGOH howMany * log(n)).
     */
    size_t removeFront(size_t howMany)
    {
        size_t result;
        while (_first && result < howMany)
        {
            _first = _first._next;
            ++result;
        }
        if (_first is null)
        {
            _last = null;
        }
        return result;
    }

    /// ditto
    alias stableRemoveFront = removeFront;

    /// ditto
    size_t removeBack(size_t howMany)
    {
        size_t result;
        while (_last && result < howMany)
        {
            _last = _last._prev;
            ++result;
        }
        if (_last is null)
        {
            _first = null;
        }
        return result;
    }

    /// ditto
    alias stableRemoveBack = removeBack;

/**
Removes all elements belonging to $(D r), which must be a range
obtained originally from this container.

This function actually removes the elements from the chain. This is the
only function that may invalidate a range, as it cuts the chain of elements:
*Ranges (and other DList) that contain $(D r) or that are inside $(D r),
as well a $(D r) itself, are never invalidated.
*Ranges (and other DList) which partially overlap with $(D r) will be cut,
and invalidated.

Returns: A range spanning the remaining elements in the container that
initially were right after $(D r).

Complexity: $(BIGOH 1)
     */
    Range remove(Range r)
    {
        if (r.empty)
        {
            return r;
        }
        assert(!empty, "DList.remove: Range is empty");

        //Note about the unusual complexity here:
        //The first and last nodes are not necessarilly the actual last nodes
        //of the "chain".
        //If we merelly excise the range from the chain, we can run into odd behavior,
        //in particlar, when the range's front and/or back coincide with the List's...

        Node* before = r._first._prev;
        Node* after = r._last._next;

        Node* oldFirst = _first;
        Node* oldLast = _last;

        if (before)
        {
            if (after)
            {
                before._next = after;
                after._prev = before;
            }
            if (_first == r._first)
                _first = (oldLast != r._last) ? after : null ;
        }
        else
        {
            assert(oldFirst == r._first, "Dlist.remove: Range is not part of the list");
            _first = (oldLast != r._last) ? after : null ;
        }

        if (after)
        {
            if (before)
            {
                after._prev = before;
                before._next = after;
            }
            if (_last == r._last)
                _last = (oldFirst != r._first) ? before : null ;
        }
        else
        {
            assert(oldLast == r._last, "Dlist.remove: Range is not part of the list");
            _last = (oldFirst != r._first) ? before : null ;
        }

        return Range(after, _last);
    }

    /// ditto
    Range linearRemove(Range r)
    {
         return remove(r);
    }

/**
$(D linearRemove) functions as $(D remove), but also accepts ranges that are
result the of a $(D take) operation. This is a convenient way to remove a
fixed amount of elements from the range.

Complexity: $(BIGOH r.walkLength)
     */
    Range linearRemove(Take!Range r)
    {
        if (r.empty)
            return Range(null,null);
        assert(r.source._first);

        Node* first = r.source._first;
        Node* last = void;
        do
        {
            last = r.source._first;
            r.popFront();
        } while ( !r.empty );

        return remove(Range(first, last));
    }

    /// ditto
    alias stableRemove = remove;
    /// ditto
    alias stableLinearRemove = linearRemove;

private:
    // Helper: insert $(D stuff) before Node $(D n). If $(D n) is $(D null) then insert at end.
    size_t insertBeforeNode(Stuff)(Node* n, Stuff stuff)
    if (isInputRange!Stuff && isImplicitlyConvertible!(ElementType!Stuff, T))
    {
        size_t result;
        if(stuff.empty) return result;

        Node* first;
        Node* last;
        //scope block
        {
            auto item = stuff.front;
            stuff.popFront();
            last = first = new Node(item, null, null);
            ++result;
        }
        foreach (item; stuff)
        {
            last = new Node(item, last, null);
            ++result;
        }

        //We have created a first-last chain. Now we insert it.
        if(!_first)
        {
            _first = first;
            _last = last;
        }
        else
        {
            assert(_last);
            if(n)
            {
                if(n._prev)
                {
                    n._prev._next = first;
                    first._prev = n._prev;
                }
                n._prev = last;
                last._next = n;
                if(n is _first)
                  _first = first;
            }
            else
            {
                if(_last._next)
                {
                    _last._next._prev = last;
                    last._next = _last._next;
                }
                _last._next = first;
                first._prev = _last;
                _last = last;
            }
        }
        assert(_first);
        assert(_last);
        return result;
    }

    // Helper: insert $(D stuff) before Node $(D n). If $(D n) is $(D null) then insert at end.
    size_t insertBeforeNode(Stuff)(Node* n, Stuff stuff)
    if (isImplicitlyConvertible!(Stuff, T))
    {
        Stuff[] stuffs = (&stuff)[0 .. 1];
        return insertBeforeNode(n, stuffs);
    }
}

unittest
{
    auto a = DList!int([3, 4]); //Create a new chain
    auto b = a; //Point to the same chain
    // (3 - 4)
    assert(a[].equal([3, 4]));
    assert(b[].equal([3, 4]));

    b.stableInsertFront(1); //insert before of b
    b.stableInsertBack(5); //insert after of b
    // (2 - (3 - 4) - 5)
    assert(a[].equal([3, 4])); //a is not changed
    assert(b[].equal([1, 3, 4, 5])); // but b is changed

    a.stableInsertFront(2); //insert in front of a, this will insert "inside" the chain
    // (1 - (2 - 3 - 4) - 5)
    assert(a[].equal([2, 3, 4])); //a is modified
    assert(b[].equal([1, 2, 3, 4, 5])); //and so is b;

    a.remove(a[]); //remove all the elements of a: This will cut them from the chain;
    // (1 - 5)
    assert(a[].empty); //a is empty
    assert(b[].equal([1, 5])); //b has lost some of its elements;

    a.insert(2); //insert in a. This will create a new chain
    // (2)
    // (1 - 5)
    assert(a[].equal([2])); //a is a new chain
    assert(b[].equal([1, 5])); //b is unchanged;
}

unittest
{
    //Tests construction signatures
    alias IntList = DList!int;
    auto a0 = IntList();
    auto a1 = IntList(0);
    auto a2 = IntList(0, 1);
    auto a3 = IntList([0]);
    auto a4 = IntList([0, 1]);

    assert(a0[].empty);
    assert(equal(a1[], [0]));
    assert(equal(a2[], [0, 1]));
    assert(equal(a3[], [0]));
    assert(equal(a4[], [0, 1]));
}

unittest
{
    alias IntList = DList!int;
    IntList list = IntList([0,1,2,3]);
    assert(equal(list[],[0,1,2,3]));
    list.insertBack([4,5,6,7]);
    assert(equal(list[],[0,1,2,3,4,5,6,7]));

    list = IntList();
    list.insertFront([0,1,2,3]);
    assert(equal(list[],[0,1,2,3]));
    list.insertFront([4,5,6,7]);
    assert(equal(list[],[4,5,6,7,0,1,2,3]));
}

unittest
{
    alias IntList = DList!int;
    IntList list = IntList([0,1,2,3]);
    auto range = list[];
    for( ; !range.empty; range.popFront())
    {
        int item = range.front;
        if (item == 2)
        {
            list.stableLinearRemove(take(range,1));
            break;
        }
    }
    assert(equal(list[],[0,1,3]));

    list = IntList([0,1,2,3]);
    range = list[];
    for( ; !range.empty; range.popFront())
    {
        int item = range.front;
        if (item == 2)
        {
            list.stableLinearRemove(take(range,2));
            break;
        }
    }
    assert(equal(list[],[0,1]));

    list = IntList([0,1,2,3]);
    range = list[];
    for( ; !range.empty; range.popFront())
    {
        int item = range.front;
        if (item == 0)
        {
            list.stableLinearRemove(take(range,2));
            break;
        }
    }
    assert(equal(list[],[2,3]));

    list = IntList([0,1,2,3]);
    range = list[];
    for( ; !range.empty; range.popFront())
    {
        int item = range.front;
        if (item == 1)
        {
            list.stableLinearRemove(take(range,2));
            break;
        }
    }
    assert(equal(list[],[0,3]));
}

unittest
{
    auto dl = DList!string(["a", "b", "d"]);
    dl.insertAfter(dl[], "e"); // insert at the end
    assert(equal(dl[], ["a", "b", "d", "e"]));
    auto dlr = dl[];
    dlr.popBack(); dlr.popBack();
    dl.insertAfter(dlr, "c"); // insert after "b"
    assert(equal(dl[], ["a", "b", "c", "d", "e"]));
}

unittest
{
    auto dl = DList!string(["a", "b", "d"]);
    dl.insertBefore(dl[], "e"); // insert at the front
    assert(equal(dl[], ["e", "a", "b", "d"]));
    auto dlr = dl[];
    dlr.popFront(); dlr.popFront();
    dl.insertBefore(dlr, "c"); // insert before "b"
    assert(equal(dl[], ["e", "a", "c", "b", "d"]));
}

unittest
{
    auto d = DList!int([1, 2, 3]);
    d.front = 5; //test frontAssign
    assert(d.front == 5);
    auto r = d[];
    r.back = 1;
    assert(r.back == 1);
}

// Issue 8895
unittest
{
    auto a = make!(DList!int)(1,2,3,4);
    auto b = make!(DList!int)(1,2,3,4);
    auto c = make!(DList!int)(1,2,3,5);
    auto d = make!(DList!int)(1,2,3,4,5);
    assert(a == b); // this better terminate!
    assert(!(a == c));
    assert(!(a == d));
}

unittest
{
    auto d = DList!int([1, 2, 3]);
    d.front = 5; //test frontAssign
    assert(d.front == 5);
    auto r = d[];
    r.back = 1;
    assert(r.back == 1);
}

unittest
{
    auto a = DList!int();
    assert(a.removeFront(10) == 0);
    a.insert([1, 2, 3]);
    assert(a.removeFront(10) == 3);
    assert(a[].empty);
}

unittest
{
    //Verify all flavors of ~
    auto a = DList!int();
    auto b = DList!int();
    auto c = DList!int([1, 2, 3]);
    auto d = DList!int([4, 5, 6]);

    assert((a ~ b[])[].empty);

    assert((c ~ d[])[].equal([1, 2, 3, 4, 5, 6]));
    assert(c[].equal([1, 2, 3]));
    assert(d[].equal([4, 5, 6]));

    assert((c[] ~ d)[].equal([1, 2, 3, 4, 5, 6]));
    assert(c[].equal([1, 2, 3]));
    assert(d[].equal([4, 5, 6]));

    a~=c[];
    assert(a[].equal([1, 2, 3]));
    assert(c[].equal([1, 2, 3]));

    a~=d[];
    assert(a[].equal([1, 2, 3, 4, 5, 6]));
    assert(d[].equal([4, 5, 6]));

    a~=[7, 8, 9];
    assert(a[].equal([1, 2, 3, 4, 5, 6, 7, 8, 9]));

    //trick test:
    auto r = c[];
    c.removeFront();
    c.removeBack();
    c~=d[];
    assert(c[].equal([2, 4, 5, 6]));
    assert(r.equal([1, 2, 4, 5, 6, 3]));
}

unittest
{
    //8905
    auto a = DList!int([1, 2, 3, 4]);
    auto r = a[];
    a.stableRemoveBack();
    a.stableInsertBack(7);
    assert(a[].equal([1, 2, 3, 7]));
    assert(r.equal([1, 2, 3, 7, 4]));
}

/**
Array type with deterministic control of memory. The memory allocated
for the array is reclaimed as soon as possible; there is no reliance
on the garbage collector. $(D Array) uses $(D malloc) and $(D free)
for managing its own memory.
 */
struct Array(T)
if (!is(Unqual!T == bool))
{
    // This structure is not copyable.
    private struct Payload
    {
        size_t _capacity;
        T[] _payload;

        // Convenience constructor
        this(T[] p) { _capacity = p.length; _payload = p; }

        // Destructor releases array memory
        ~this()
        {
            foreach (ref e; _payload) .destroy(e);
            static if (hasIndirections!T)
                GC.removeRange(_payload.ptr);
            free(_payload.ptr);
        }

        this(this)
        {
            assert(0);
        }

        void opAssign(Payload rhs)
        {
            assert(false);
        }

        // Duplicate data
        // @property Payload dup()
        // {
        //     Payload result;
        //     result._payload = _payload.dup;
        //     // Conservatively assume initial capacity == length
        //     result._capacity = result._payload.length;
        //     return result;
        // }

        // length
        @property size_t length() const
        {
            return _payload.length;
        }

        // length
        @property void length(size_t newLength)
        {
            if (length >= newLength)
            {
                // shorten
                static if (is(T == struct) && hasElaborateDestructor!T)
                {
                    foreach (ref e; _payload.ptr[newLength .. _payload.length])
                    {
                        .destroy(e);
                    }
                }
                _payload = _payload.ptr[0 .. newLength];
                return;
            }
            // enlarge
            auto startEmplace = length;
            _payload = (cast(T*) realloc(_payload.ptr,
                            T.sizeof * newLength))[0 .. newLength];
            initializeAll(_payload.ptr[startEmplace .. length]);
        }

        // capacity
        @property size_t capacity() const
        {
            return _capacity;
        }

        // reserve
        void reserve(size_t elements)
        {
            if (elements <= capacity) return;
            immutable sz = elements * T.sizeof;
            static if (hasIndirections!T)       // should use hasPointers instead
            {
                /* Because of the transactional nature of this
                 * relative to the garbage collector, ensure no
                 * threading bugs by using malloc/copy/free rather
                 * than realloc.
                 */
                immutable oldLength = length;
                auto newPayload =
                    enforce(cast(T*) malloc(sz))[0 .. oldLength];
                // copy old data over to new array
                memcpy(newPayload.ptr, _payload.ptr, T.sizeof * oldLength);
                // Zero out unused capacity to prevent gc from seeing
                // false pointers
                memset(newPayload.ptr + oldLength,
                        0,
                        (elements - oldLength) * T.sizeof);
                GC.addRange(newPayload.ptr, sz);
                GC.removeRange(_payload.ptr);
                free(_payload.ptr);
                _payload = newPayload;
            }
            else
            {
                /* These can't have pointers, so no need to zero
                 * unused region
                 */
                auto newPayload =
                    enforce(cast(T*) realloc(_payload.ptr, sz))[0 .. length];
                _payload = newPayload;
            }
            _capacity = elements;
        }

        // Insert one item
        size_t insertBack(Stuff)(Stuff stuff)
        if (isImplicitlyConvertible!(Stuff, T))
        {
            if (_capacity == length)
            {
                reserve(1 + capacity * 3 / 2);
            }
            assert(capacity > length && _payload.ptr);
            emplace(_payload.ptr + _payload.length, stuff);
            _payload = _payload.ptr[0 .. _payload.length + 1];
            return 1;
        }

        /// Insert a range of items
        size_t insertBack(Stuff)(Stuff stuff)
        if (isInputRange!Stuff && isImplicitlyConvertible!(ElementType!Stuff, T))
        {
            static if (hasLength!Stuff)
            {
                immutable oldLength = length;
                reserve(oldLength + stuff.length);
            }
            size_t result;
            foreach (item; stuff)
            {
                insertBack(item);
                ++result;
            }
            static if (hasLength!Stuff)
            {
                assert(length == oldLength + stuff.length);
            }
            return result;
        }
    }
    private alias Data = RefCounted!(Payload, RefCountedAutoInitialize.no);
    private Data _data;

/**
Constructor taking a number of items
     */
    this(U)(U[] values...) if (isImplicitlyConvertible!(U, T))
    {
        auto p = cast(T*) malloc(T.sizeof * values.length);
        if (hasIndirections!T && p)
        {
            GC.addRange(p, T.sizeof * values.length);
        }
        foreach (i, e; values)
        {
            emplace(p + i, e);
            assert(p[i] == e);
        }
        _data = Data(p[0 .. values.length]);
    }

/**
Constructor taking an input range
     */
    this(Stuff)(Stuff stuff)
    if (isInputRange!Stuff && isImplicitlyConvertible!(ElementType!Stuff, T) && !is(Stuff == T[]))
    {
        insertBack(stuff);
    }


/**
Comparison for equality.
     */
    bool opEquals(const Array rhs) const
    {
        return opEquals(rhs);
    }

    /// ditto
    bool opEquals(ref const Array rhs) const
    {
        if (empty) return rhs.empty;
        if (rhs.empty) return false;
        return _data._payload == rhs._data._payload;
    }

/**
Defines the container's primary range, which is a random-access range.
     */
    static struct Range
    {
        private Array _outer;
        private size_t _a, _b;

        private this(ref Array data, size_t a, size_t b)
        {
            _outer = data;
            _a = a;
            _b = b;
        }

        @property Range save()
        {
            return this;
        }

        @property bool empty() @safe pure nothrow const
        {
            return _a >= _b;
        }

        @property size_t length() @safe pure nothrow const
        {
            return _b - _a;
        }
        alias opDollar = length;

        @property ref T front()
        {
            version (assert) if (empty) throw new RangeError();
            return _outer[_a];
        }

        @property ref T back()
        {
            version (assert) if (empty) throw new RangeError();
            return _outer[_b - 1];
        }

        void popFront() @safe pure nothrow
        {
            version (assert) if (empty) throw new RangeError();
            ++_a;
        }

        void popBack() @safe pure nothrow
        {
            version (assert) if (empty) throw new RangeError();
            --_b;
        }

        T moveFront()
        {
            version (assert) if (empty || _a >= _outer.length) throw new RangeError();
            return move(_outer._data._payload[_a]);
        }

        T moveBack()
        {
            version (assert) if (empty || _b  > _outer.length) throw new RangeError();
            return move(_outer._data._payload[_b - 1]);
        }

        T moveAt(size_t i)
        {
            version (assert) if (_a + i >= _b || _a + i >= _outer.length) throw new RangeError();
            return move(_outer._data._payload[_a + i]);
        }

        ref T opIndex(size_t i)
        {
            version (assert) if (_a + i >= _b) throw new RangeError();
            return _outer[_a + i];
        }

        typeof(this) opSlice()
        {
            return typeof(this)(_outer, _a, _b);
        }

        typeof(this) opSlice(size_t i, size_t j)
        {
            version (assert) if (i > j || _a + j > _b) throw new RangeError();
            return typeof(this)(_outer, _a + i, _a + j);
        }

        void opSliceAssign(T value)
        {
            version (assert) if (_b > _outer.length) throw new RangeError();
            _outer[_a .. _b] = value;
        }

        void opSliceAssign(T value, size_t i, size_t j)
        {
            version (assert) if (_a + j > _b) throw new RangeError();
            _outer[_a + i .. _a + j] = value;
        }

        void opSliceUnary(string op)()
            if(op == "++" || op == "--")
        {
            version (assert) if (_b > _outer.length) throw new RangeError();
            mixin(op~"_outer[_a .. _b];");
        }

        void opSliceUnary(string op)(size_t i, size_t j)
            if(op == "++" || op == "--")
        {
            version (assert) if (_a + j > _b) throw new RangeError();
            mixin(op~"_outer[_a + i .. _a + j];");
        }

        void opSliceOpAssign(string op)(T value)
        {
            version (assert) if (_b > _outer.length) throw new RangeError();
            mixin("_outer[_a .. _b] "~op~"= value;");
        }

        void opSliceOpAssign(string op)(T value, size_t i, size_t j)
        {
            version (assert) if (_a + j > _b) throw new RangeError();
            mixin("_outer[_a + i .. _a + j] "~op~"= value;");
        }
    }

/**
Duplicates the container. The elements themselves are not transitively
duplicated.

Complexity: $(BIGOH n).
     */
    @property Array dup()
    {
        if (!_data.refCountedStore.isInitialized) return this;
        return Array(_data._payload);
    }

/**
Property returning $(D true) if and only if the container has no
elements.

Complexity: $(BIGOH 1)
     */
    @property bool empty() const
    {
        return !_data.refCountedStore.isInitialized || _data._payload.empty;
    }

/**
Returns the number of elements in the container.

Complexity: $(BIGOH 1).
     */
    @property size_t length() const
    {
        return _data.refCountedStore.isInitialized ? _data._payload.length : 0;
    }

    /// ditto
    size_t opDollar() const
    {
        return length;
    }

/**
Returns the maximum number of elements the container can store without
   (a) allocating memory, (b) invalidating iterators upon insertion.

Complexity: $(BIGOH 1)
     */
    @property size_t capacity()
    {
        return _data.refCountedStore.isInitialized ? _data._capacity : 0;
    }

/**
Ensures sufficient capacity to accommodate $(D e) elements.

Postcondition: $(D capacity >= e)

Complexity: $(BIGOH 1)
     */
    void reserve(size_t elements)
    {
        if (!_data.refCountedStore.isInitialized)
        {
            if (!elements) return;
            immutable sz = elements * T.sizeof;
            auto p = enforce(malloc(sz));
            static if (hasIndirections!T)
            {
                GC.addRange(p, sz);
            }
            _data = Data(cast(T[]) p[0 .. 0]);
            _data._capacity = elements;
        }
        else
        {
            _data.reserve(elements);
        }
    }

/**
Returns a range that iterates over elements of the container, in
forward order.

Complexity: $(BIGOH 1)
     */
    Range opSlice()
    {
        return Range(this, 0, length);
    }

/**
Returns a range that iterates over elements of the container from
index $(D a) up to (excluding) index $(D b).

Precondition: $(D a <= b && b <= length)

Complexity: $(BIGOH 1)
     */
    Range opSlice(size_t i, size_t j)
    {
        version (assert) if (i > j || j > length) throw new RangeError();
        return Range(this, i, j);
    }

/**
Forward to $(D opSlice().front) and $(D opSlice().back), respectively.

Precondition: $(D !empty)

Complexity: $(BIGOH 1)
     */
    @property ref T front()
    {
        version (assert) if (!_data.refCountedStore.isInitialized) throw new RangeError();
        return _data._payload[0];
    }

    /// ditto
    @property ref T back()
    {
        version (assert) if (!_data.refCountedStore.isInitialized) throw new RangeError();
        return _data._payload[$ - 1];
    }

/**
Indexing operators yield or modify the value at a specified index.

Precondition: $(D i < length)

Complexity: $(BIGOH 1)
     */
    ref T opIndex(size_t i)
    {
        version (assert) if (!_data.refCountedStore.isInitialized) throw new RangeError();
        return _data._payload[i];
    }

/**
Slicing operations execute an operation on an entire slice.

Precondition: $(D i < j && j < length)

Complexity: $(BIGOH slice.length)
     */
    void opSliceAssign(T value)
    {
        if (!_data.refCountedStore.isInitialized) return;
        _data._payload[] = value;
    }

    /// ditto
    void opSliceAssign(T value, size_t i, size_t j)
    {
        auto slice = _data.refCountedStore.isInitialized ? _data._payload : T[].init;
        slice[i .. j] = value;
    }

    /// ditto
    void opSliceUnary(string op)()
        if(op == "++" || op == "--")
    {
        if(!_data.refCountedStore.isInitialized) return;
        mixin(op~"_data._payload[];");
    }

    /// ditto
    void opSliceUnary(string op)(size_t i, size_t j)
        if(op == "++" || op == "--")
    {
        auto slice = _data.refCountedStore.isInitialized ? _data._payload : T[].init;
        mixin(op~"slice[i .. j];");
    }

    /// ditto
    void opSliceOpAssign(string op)(T value)
    {
        if(!_data.refCountedStore.isInitialized) return;
        mixin("_data._payload[] "~op~"= value;");
    }

    /// ditto
    void opSliceOpAssign(string op)(T value, size_t i, size_t j)
    {
        auto slice = _data.refCountedStore.isInitialized ? _data._payload : T[].init;
        mixin("slice[i .. j] "~op~"= value;");
    }

/**
Returns a new container that's the concatenation of $(D this) and its
argument. $(D opBinaryRight) is only defined if $(D Stuff) does not
define $(D opBinary).

Complexity: $(BIGOH n + m), where m is the number of elements in $(D
stuff)
     */
    Array opBinary(string op, Stuff)(Stuff stuff)
        if (op == "~")
    {
        // TODO: optimize
        Array result;
        // @@@BUG@@ result ~= this[] doesn't work
        auto r = this[];
        result ~= r;
        assert(result.length == length);
        result ~= stuff[];
        return result;
    }

/**
Forwards to $(D insertBack(stuff)).
     */
    void opOpAssign(string op, Stuff)(Stuff stuff)
        if (op == "~")
    {
        static if (is(typeof(stuff[])))
        {
            insertBack(stuff[]);
        }
        else
        {
            insertBack(stuff);
        }
    }

/**
Removes all contents from the container. The container decides how $(D
capacity) is affected.

Postcondition: $(D empty)

Complexity: $(BIGOH n)
     */
    void clear()
    {
        .destroy(_data);
    }

/**
Sets the number of elements in the container to $(D newSize). If $(D
newSize) is greater than $(D length), the added elements are added to
unspecified positions in the container and initialized with $(D
T.init).

Complexity: $(BIGOH abs(n - newLength))

Postcondition: $(D length == newLength)
     */
    @property void length(size_t newLength)
    {
        _data.refCountedStore.ensureInitialized();
        _data.length = newLength;
    }

/**
Picks one value in an unspecified position in the container, removes
it from the container, and returns it. Implementations should pick the
value that's the most advantageous for the container, but document the
exact behavior. The stable version behaves the same, but guarantees
that ranges iterating over the container are never invalidated.

Precondition: $(D !empty)

Returns: The element removed.

Complexity: $(BIGOH log(n)).
     */
    T removeAny()
    {
        auto result = back;
        removeBack();
        return result;
    }
    /// ditto
    alias stableRemoveAny = removeAny;

/**
Inserts $(D value) to the front or back of the container. $(D stuff)
can be a value convertible to $(D T) or a range of objects convertible
to $(D T). The stable version behaves the same, but guarantees that
ranges iterating over the container are never invalidated.

Returns: The number of elements inserted

Complexity: $(BIGOH m * log(n)), where $(D m) is the number of
elements in $(D stuff)
     */
    size_t insertBack(Stuff)(Stuff stuff)
    if (isImplicitlyConvertible!(Stuff, T) ||
            isInputRange!Stuff && isImplicitlyConvertible!(ElementType!Stuff, T))
    {
        _data.refCountedStore.ensureInitialized();
        return _data.insertBack(stuff);
    }
    /// ditto
    alias insert = insertBack;

/**
Removes the value at the back of the container. The stable version
behaves the same, but guarantees that ranges iterating over the
container are never invalidated.

Precondition: $(D !empty)

Complexity: $(BIGOH log(n)).
     */
    void removeBack()
    {
        enforce(!empty);
        static if (is(T == struct))
        {
            // Destroy this guy
            .destroy(_data._payload[$ - 1]);
        }
        _data._payload = _data._payload[0 .. $ - 1];
    }
    /// ditto
    alias stableRemoveBack = removeBack;

/**
Removes $(D howMany) values at the front or back of the
container. Unlike the unparameterized versions above, these functions
do not throw if they could not remove $(D howMany) elements. Instead,
if $(D howMany > n), all elements are removed. The returned value is
the effective number of elements removed. The stable version behaves
the same, but guarantees that ranges iterating over the container are
never invalidated.

Returns: The number of elements removed

Complexity: $(BIGOH howMany).
     */
    size_t removeBack(size_t howMany)
    {
        if (howMany > length) howMany = length;
        static if (is(T == struct))
        {
            // Destroy this guy
            foreach (ref e; _data._payload[$ - howMany .. $])
            {
                .destroy(e);
            }
        }
        _data._payload = _data._payload[0 .. $ - howMany];
        return howMany;
    }
    /// ditto
    alias stableRemoveBack = removeBack;

/**
Inserts $(D stuff) before, after, or instead range $(D r), which must
be a valid range previously extracted from this container. $(D stuff)
can be a value convertible to $(D T) or a range of objects convertible
to $(D T). The stable version behaves the same, but guarantees that
ranges iterating over the container are never invalidated.

Returns: The number of values inserted.

Complexity: $(BIGOH n + m), where $(D m) is the length of $(D stuff)
     */
    size_t insertBefore(Stuff)(Range r, Stuff stuff)
    if (isImplicitlyConvertible!(Stuff, T))
    {
        enforce(r._outer._data is _data && r._a <= length);
        reserve(length + 1);
        assert(_data.refCountedStore.isInitialized);
        // Move elements over by one slot
        memmove(_data._payload.ptr + r._a + 1,
                _data._payload.ptr + r._a,
                T.sizeof * (length - r._a));
        emplace(_data._payload.ptr + r._a, stuff);
        _data._payload = _data._payload.ptr[0 .. _data._payload.length + 1];
        return 1;
    }

    /// ditto
    size_t insertBefore(Stuff)(Range r, Stuff stuff)
    if (isInputRange!Stuff && isImplicitlyConvertible!(ElementType!Stuff, T))
    {
        enforce(r._outer._data is _data && r._a <= length);
        static if (isForwardRange!Stuff)
        {
            // Can find the length in advance
            auto extra = walkLength(stuff);
            if (!extra) return 0;
            reserve(length + extra);
            assert(_data.refCountedStore.isInitialized);
            // Move elements over by extra slots
            memmove(_data._payload.ptr + r._a + extra,
                    _data._payload.ptr + r._a,
                    T.sizeof * (length - r._a));
            foreach (p; _data._payload.ptr + r._a ..
                    _data._payload.ptr + r._a + extra)
            {
                emplace(p, stuff.front);
                stuff.popFront();
            }
            _data._payload =
                _data._payload.ptr[0 .. _data._payload.length + extra];
            return extra;
        }
        else
        {
            enforce(_data);
            immutable offset = r._a;
            enforce(offset <= length);
            auto result = insertBack(stuff);
            bringToFront(this[offset .. length - result],
                    this[length - result .. length]);
            return result;
        }
    }

    /// ditto
    size_t insertAfter(Stuff)(Range r, Stuff stuff)
    {
        enforce(r._outer._data is _data);
        // TODO: optimize
        immutable offset = r._b;
        enforce(offset <= length);
        auto result = insertBack(stuff);
        bringToFront(this[offset .. length - result],
                this[length - result .. length]);
        return result;
    }

    /// ditto
    size_t replace(Stuff)(Range r, Stuff stuff)
    if (isInputRange!Stuff && isImplicitlyConvertible!(ElementType!Stuff, T))
    {
        enforce(r._outer._data is _data);
        size_t result;
        for (; !stuff.empty; stuff.popFront())
        {
            if (r.empty)
            {
                // insert the rest
                return result + insertBefore(r, stuff);
            }
            r.front = stuff.front;
            r.popFront();
            ++result;
        }
        // Remove remaining stuff in r
        linearRemove(r);
        return result;
    }

    /// ditto
    size_t replace(Stuff)(Range r, Stuff stuff)
    if (isImplicitlyConvertible!(Stuff, T))
    {
        enforce(r._outer._data is _data);
        if (r.empty)
        {
            insertBefore(r, stuff);
        }
        else
        {
            r.front = stuff;
            r.popFront();
            linearRemove(r);
        }
        return 1;
    }

/**
Removes all elements belonging to $(D r), which must be a range
obtained originally from this container. The stable version behaves
the same, but guarantees that ranges iterating over the container are
never invalidated.

Returns: A range spanning the remaining elements in the container that
initially were right after $(D r).

Complexity: $(BIGOH n - m), where $(D m) is the number of elements in
$(D r)
     */
    Range linearRemove(Range r)
    {
        enforce(r._outer._data is _data);
        enforce(_data.refCountedStore.isInitialized);
        enforce(r._a <= r._b && r._b <= length);
        immutable offset1 = r._a;
        immutable offset2 = r._b;
        immutable tailLength = length - offset2;
        // Use copy here, not a[] = b[] because the ranges may overlap
        copy(this[offset2 .. length], this[offset1 .. offset1 + tailLength]);
        length = offset1 + tailLength;
        return this[length - tailLength .. length];
    }
    /// ditto
    alias stableLinearRemove = remove;
}

unittest
{
    Array!int a;
    assert(a.empty);
}

unittest
{
    Array!int a = Array!int(1, 2, 3);
    //a._data._refCountedDebug = true;
    auto b = a.dup;
    assert(b == Array!int(1, 2, 3));
    b.front = 42;
    assert(b == Array!int(42, 2, 3));
    assert(a == Array!int(1, 2, 3));
}

unittest
{
    auto a = Array!int(1, 2, 3);
    assert(a.length == 3);
}

unittest
{
    Array!int a;
    a.reserve(1000);
    assert(a.length == 0);
    assert(a.empty);
    assert(a.capacity >= 1000);
    auto p = a._data._payload.ptr;
    foreach (i; 0 .. 1000)
    {
        a.insertBack(i);
    }
    assert(p == a._data._payload.ptr);
}

unittest
{
    auto a = Array!int(1, 2, 3);
    a[1] *= 42;
    assert(a[1] == 84);
}

unittest
{
    auto a = Array!int(1, 2, 3);
    auto b = Array!int(11, 12, 13);
    auto c = a ~ b;
    //foreach (e; c) writeln(e);
    assert(c == Array!int(1, 2, 3, 11, 12, 13));
    //assert(a ~ b[] == Array!int(1, 2, 3, 11, 12, 13));
}

unittest
{
    auto a = Array!int(1, 2, 3);
    auto b = Array!int(11, 12, 13);
    a ~= b;
    assert(a == Array!int(1, 2, 3, 11, 12, 13));
}

unittest
{
    auto a = Array!int(1, 2, 3, 4);
    assert(a.removeAny() == 4);
    assert(a == Array!int(1, 2, 3));
}

unittest
{
    auto a = Array!int(1, 2, 3, 4, 5);
    auto r = a[2 .. a.length];
    assert(a.insertBefore(r, 42) == 1);
    assert(a == Array!int(1, 2, 42, 3, 4, 5));
    r = a[2 .. 2];
    assert(a.insertBefore(r, [8, 9]) == 2);
    assert(a == Array!int(1, 2, 8, 9, 42, 3, 4, 5));
}

unittest
{
    auto a = Array!int(0, 1, 2, 3, 4, 5, 6, 7, 8);
    a.linearRemove(a[4 .. 6]);
    auto b = Array!int(0, 1, 2, 3, 6, 7, 8);
    //writeln(a.length);
    //foreach (e; a) writeln(e);
    assert(a == Array!int(0, 1, 2, 3, 6, 7, 8));
}

// Give the Range object some testing.
unittest
{
    auto a = Array!int(0, 1, 2, 3, 4, 5, 6)[];
    auto b = Array!int(6, 5, 4, 3, 2, 1, 0)[];
    alias A = typeof(a);

    static assert(isRandomAccessRange!A);
    static assert(hasSlicing!A);
    static assert(hasAssignableElements!A);
    static assert(hasMobileElements!A);

    assert(equal(retro(b), a));
    assert(a.length == 7);
    assert(equal(a[1..4], [1, 2, 3]));
}
// Test issue 5920
version(unittest)
{
    //@@@BUG4274@@@: This cannot be declared as an inner struct.
    private struct structBug5920
    {
        int order;
        uint* pDestructionMask;
        ~this()
        {
            if (pDestructionMask)
                *pDestructionMask += 1 << order;
        }
    }
}
unittest
{
    alias S = structBug5920;
    uint dMask;

    auto arr = Array!S(cast(S[])[]);
    foreach (i; 0..8)
        arr.insertBack(S(i, &dMask));
    // don't check dMask now as S may be copied multiple times (it's ok?)
    {
        assert(arr.length == 8);
        dMask = 0;
        arr.length = 6;
        assert(arr.length == 6);    // make sure shrinking calls the d'tor
        assert(dMask == 0b1100_0000);
        arr.removeBack();
        assert(arr.length == 5);    // make sure removeBack() calls the d'tor
        assert(dMask == 0b1110_0000);
        arr.removeBack(3);
        assert(arr.length == 2);    // ditto
        assert(dMask == 0b1111_1100);
        arr.clear();
        assert(arr.length == 0);    // make sure clear() calls the d'tor
        assert(dMask == 0b1111_1111);
    }
    assert(dMask == 0b1111_1111);   // make sure the d'tor is called once only.
}
// Test issue 5792 (mainly just to check if this piece of code is compilable)
unittest
{
    auto a = Array!(int[])([[1,2],[3,4]]);
    a.reserve(4);
    assert(a.capacity >= 4);
    assert(a.length == 2);
    assert(a[0] == [1,2]);
    assert(a[1] == [3,4]);
    a.reserve(16);
    assert(a.capacity >= 16);
    assert(a.length == 2);
    assert(a[0] == [1,2]);
    assert(a[1] == [3,4]);
}

// test replace!Stuff with range Stuff
unittest
{
    auto a = Array!int([1, 42, 5]);
    a.replace(a[1 .. 2], [2, 3, 4]);
    assert(equal(a[], [1, 2, 3, 4, 5]));
}

// test insertBefore and replace with empty Arrays
unittest
{
    auto a = Array!int();
    a.insertBefore(a[], 1);
    assert(equal(a[], [1]));
}
unittest
{
    auto a = Array!int();
    a.insertBefore(a[], [1, 2]);
    assert(equal(a[], [1, 2]));
}
unittest
{
    auto a = Array!int();
    a.replace(a[], [1, 2]);
    assert(equal(a[], [1, 2]));
}
unittest
{
    auto a = Array!int();
    a.replace(a[], 1);
    assert(equal(a[], [1]));
}
// make sure that Array instances refuse ranges that don't belong to them
unittest
{
    Array!int a = [1, 2, 3];
    auto r = a.dup[];
    assertThrown(a.insertBefore(r, 42));
    assertThrown(a.insertBefore(r, [42]));
    assertThrown(a.insertAfter(r, 42));
    assertThrown(a.replace(r, 42));
    assertThrown(a.replace(r, [42]));
    assertThrown(a.linearRemove(r));
}
unittest
{
    auto a = Array!int([1, 1]);
    a[1]  = 0; //Check Array.opIndexAssign
    assert(a[1] == 0);
    a[1] += 1; //Check Array.opIndexOpAssign
    assert(a[1] == 1);

    //Check Array.opIndexUnary
    ++a[0];
    //a[0]++ //op++ doesn't return, so this shouldn't work, even with 5044 fixed
    assert(a[0] == 2);
    assert(+a[0] == +2);
    assert(-a[0] == -2);
    assert(~a[0] == ~2);

    auto r = a[];
    r[1]  = 0; //Check Array.Range.opIndexAssign
    assert(r[1] == 0);
    r[1] += 1; //Check Array.Range.opIndexOpAssign
    assert(r[1] == 1);

    //Check Array.Range.opIndexUnary
    ++r[0];
    //r[0]++ //op++ doesn't return, so this shouldn't work, even with 5044 fixed
    assert(r[0] == 3);
    assert(+r[0] == +3);
    assert(-r[0] == -3);
    assert(~r[0] == ~3);
}

unittest
{
    //Test "array-wide" operations
    auto a = Array!int([0, 1, 2]); //Array
    a[] += 5;
    assert(a[].equal([5, 6, 7]));
    ++a[];
    assert(a[].equal([6, 7, 8]));
    a[1 .. 3] *= 5;
    assert(a[].equal([6, 35, 40]));
    a[0 .. 2] = 0;
    assert(a[].equal([0, 0, 40]));

    //Test empty array
    auto a2 = Array!int.init;
    ++a2[];
    ++a2[0 .. 0];
    a2[] = 0;
    a2[0 .. 0] = 0;
    a2[] += 0;
    a2[0 .. 0] += 0;

    //Test "range-wide" operations
    auto r = Array!int([0, 1, 2])[]; //Array.Range
    r[] += 5;
    assert(r.equal([5, 6, 7]));
    ++r[];
    assert(r.equal([6, 7, 8]));
    r[1 .. 3] *= 5;
    assert(r.equal([6, 35, 40]));
    r[0 .. 2] = 0;
    assert(r.equal([0, 0, 40]));

    //Test empty Range
    auto r2 = Array!int.init[];
    ++r2[];
    ++r2[0 .. 0];
    r2[] = 0;
    r2[0 .. 0] = 0;
    r2[] += 0;
    r2[0 .. 0] += 0;
}

// Test issue 11194
unittest {
    static struct S {
        int i = 1337;
        void* p;
        this(this) { assert(i == 1337); }
        ~this() { assert(i == 1337); }
    }
    Array!S arr;
    S s;
    arr ~= s;
    arr ~= s;
}

unittest //11459
{
    static struct S
    {
        bool b;
        alias b this;
    }
    alias A = Array!S;
    alias B = Array!(shared bool);
}

unittest //11884
{
    auto a = Array!int([1, 2, 2].filter!"true"());
}

unittest //8282
{
    auto arr = new Array!int;
}

// BinaryHeap
/**
Implements a $(WEB en.wikipedia.org/wiki/Binary_heap, binary heap)
container on top of a given random-access range type (usually $(D
T[])) or a random-access container type (usually $(D Array!T)). The
documentation of $(D BinaryHeap) will refer to the underlying range or
container as the $(I store) of the heap.

The binary heap induces structure over the underlying store such that
accessing the largest element (by using the $(D front) property) is a
$(BIGOH 1) operation and extracting it (by using the $(D
removeFront()) method) is done fast in $(BIGOH log n) time.

If $(D less) is the less-than operator, which is the default option,
then $(D BinaryHeap) defines a so-called max-heap that optimizes
extraction of the $(I largest) elements. To define a min-heap,
instantiate BinaryHeap with $(D "a > b") as its predicate.

Simply extracting elements from a $(D BinaryHeap) container is
tantamount to lazily fetching elements of $(D Store) in descending
order. Extracting elements from the $(D BinaryHeap) to completion
leaves the underlying store sorted in ascending order but, again,
yields elements in descending order.

If $(D Store) is a range, the $(D BinaryHeap) cannot grow beyond the
size of that range. If $(D Store) is a container that supports $(D
insertBack), the $(D BinaryHeap) may grow by adding elements to the
container.
     */
struct BinaryHeap(Store, alias less = "a < b")
if (isRandomAccessRange!(Store) || isRandomAccessRange!(typeof(Store.init[])))
{
// Really weird @@BUG@@: if you comment out the "private:" label below,
// mystd.algorithm can't unittest anymore
//private:

    // The payload includes the support store and the effective length
    private static struct Data
    {
        Store _store;
        size_t _length;
    }
    private RefCounted!(Data, RefCountedAutoInitialize.no) _payload;
    // Comparison predicate
    private alias comp = binaryFun!(less);
    // Convenience accessors
    private @property ref Store _store()
    {
        assert(_payload.refCountedStore.isInitialized);
        return _payload._store;
    }
    private @property ref size_t _length()
    {
        assert(_payload.refCountedStore.isInitialized);
        return _payload._length;
    }

    // Asserts that the heap property is respected.
    private void assertValid()
    {
        debug
        {
            if (!_payload.refCountedStore.isInitialized) return;
            if (_length < 2) return;
            for (size_t n = _length - 1; n >= 1; --n)
            {
                auto parentIdx = (n - 1) / 2;
                assert(!comp(_store[parentIdx], _store[n]), text(n));
            }
        }
    }

    // Assuming the element at index i perturbs the heap property in
    // store r, percolates it down the heap such that the heap
    // property is restored.
    private void percolateDown(Store r, size_t i, size_t length)
    {
        for (;;)
        {
            auto left = i * 2 + 1, right = left + 1;
            if (right == length)
            {
                if (comp(r[i], r[left])) swap(r, i, left);
                return;
            }
            if (right > length) return;
            assert(left < length && right < length);
            auto largest = comp(r[i], r[left])
                ? (comp(r[left], r[right]) ? right : left)
                : (comp(r[i], r[right]) ? right : i);
            if (largest == i) return;
            swap(r, i, largest);
            i = largest;
        }
    }

    // @@@BUG@@@: add private here, mystd.algorithm doesn't unittest anymore
    /*private*/ void pop(Store store)
    {
        assert(!store.empty, "Cannot pop an empty store.");
        if (store.length == 1) return;
        auto t1 = moveFront(store[]);
        auto t2 = moveBack(store[]);
        store.front = move(t2);
        store.back = move(t1);
        percolateDown(store, 0, store.length - 1);
    }

    /*private*/ static void swap(Store _store, size_t i, size_t j)
    {
        static if (is(typeof(swap(_store[i], _store[j]))))
        {
            swap(_store[i], _store[j]);
        }
        else static if (is(typeof(_store.moveAt(i))))
        {
            auto t1 = _store.moveAt(i);
            auto t2 = _store.moveAt(j);
            _store[i] = move(t2);
            _store[j] = move(t1);
        }
        else // assume it's a container and access its range with []
        {
            auto t1 = _store[].moveAt(i);
            auto t2 = _store[].moveAt(j);
            _store[i] = move(t2);
            _store[j] = move(t1);
        }
    }

public:

    /**
       Converts the store $(D s) into a heap. If $(D initialSize) is
       specified, only the first $(D initialSize) elements in $(D s)
       are transformed into a heap, after which the heap can grow up
       to $(D r.length) (if $(D Store) is a range) or indefinitely (if
       $(D Store) is a container with $(D insertBack)). Performs
       $(BIGOH min(r.length, initialSize)) evaluations of $(D less).
     */
    this(Store s, size_t initialSize = size_t.max)
    {
        acquire(s, initialSize);
    }

/**
Takes ownership of a store. After this, manipulating $(D s) may make
the heap work incorrectly.
     */
    void acquire(Store s, size_t initialSize = size_t.max)
    {
        _payload.refCountedStore.ensureInitialized();
        _store = move(s);
        _length = min(_store.length, initialSize);
        if (_length < 2) return;
        for (auto i = (_length - 2) / 2; ; )
        {
            this.percolateDown(_store, i, _length);
            if (i-- == 0) break;
        }
        assertValid();
    }

/**
Takes ownership of a store assuming it already was organized as a
heap.
     */
    void assume(Store s, size_t initialSize = size_t.max)
    {
        _payload.refCountedStore.ensureInitialized();
        _store = s;
        _length = min(_store.length, initialSize);
        assertValid();
    }

/**
Clears the heap. Returns the portion of the store from $(D 0) up to
$(D length), which satisfies the $(LUCKY heap property).
     */
    auto release()
    {
        if (!_payload.refCountedStore.isInitialized)
        {
            return typeof(_store[0 .. _length]).init;
        }
        assertValid();
        auto result = _store[0 .. _length];
        _payload = _payload.init;
        return result;
    }

/**
Returns $(D true) if the heap is _empty, $(D false) otherwise.
     */
    @property bool empty()
    {
        return !length;
    }

/**
Returns a duplicate of the heap. The underlying store must also
support a $(D dup) method.
     */
    @property BinaryHeap dup()
    {
        BinaryHeap result;
        if (!_payload.refCountedStore.isInitialized) return result;
        result.assume(_store.dup, length);
        return result;
    }

/**
Returns the _length of the heap.
     */
    @property size_t length()
    {
        return _payload.refCountedStore.isInitialized ? _length : 0;
    }

/**
Returns the _capacity of the heap, which is the length of the
underlying store (if the store is a range) or the _capacity of the
underlying store (if the store is a container).
     */
    @property size_t capacity()
    {
        if (!_payload.refCountedStore.isInitialized) return 0;
        static if (is(typeof(_store.capacity) : size_t))
        {
            return _store.capacity;
        }
        else
        {
            return _store.length;
        }
    }

/**
Returns a copy of the _front of the heap, which is the largest element
according to $(D less).
     */
    @property ElementType!Store front()
    {
        enforce(!empty, "Cannot call front on an empty heap.");
        return _store.front;
    }

/**
Clears the heap by detaching it from the underlying store.
     */
    void clear()
    {
        _payload = _payload.init;
    }

/**
Inserts $(D value) into the store. If the underlying store is a range
and $(D length == capacity), throws an exception.
     */
    size_t insert(ElementType!Store value)
    {
        static if (is(typeof(_store.insertBack(value))))
        {
            _payload.refCountedStore.ensureInitialized();
            if (length == _store.length)
            {
                // reallocate
                _store.insertBack(value);
            }
            else
            {
                // no reallocation
                _store[_length] = value;
            }
        }
        else
        {
            // can't grow
            enforce(length < _store.length,
                    "Cannot grow a heap created over a range");
            _store[_length] = value;
        }

        // sink down the element
        for (size_t n = _length; n; )
        {
            auto parentIdx = (n - 1) / 2;
            if (!comp(_store[parentIdx], _store[n])) break; // done!
            // must swap and continue
            swap(_store, parentIdx, n);
            n = parentIdx;
        }
        ++_length;
        assertValid();
        return 1;
    }

/**
Removes the largest element from the heap.
     */
    void removeFront()
    {
        enforce(!empty, "Cannot call removeFront on an empty heap.");
        if (_length > 1)
        {
            auto t1 = moveFront(_store[]);
            auto t2 = moveAt(_store[], _length - 1);
            _store.front = move(t2);
            _store[_length - 1] = move(t1);
        }
        --_length;
        percolateDown(_store, 0, _length);
    }

/**
Removes the largest element from the heap and returns a copy of
it. The element still resides in the heap's store. For performance
reasons you may want to use $(D removeFront) with heaps of objects
that are expensive to copy.
     */
    ElementType!Store removeAny()
    {
        removeFront();
        return _store[_length];
    }

/**
Replaces the largest element in the store with $(D value).
     */
    void replaceFront(ElementType!Store value)
    {
        // must replace the top
        assert(!empty, "Cannot call replaceFront on an empty heap.");
        _store.front = value;
        percolateDown(_store, 0, _length);
        assertValid();
    }

/**
If the heap has room to grow, inserts $(D value) into the store and
returns $(D true). Otherwise, if $(D less(value, front)), calls $(D
replaceFront(value)) and returns again $(D true). Otherwise, leaves
the heap unaffected and returns $(D false). This method is useful in
scenarios where the smallest $(D k) elements of a set of candidates
must be collected.
     */
    bool conditionalInsert(ElementType!Store value)
    {
        _payload.refCountedStore.ensureInitialized();
        if (_length < _store.length)
        {
            insert(value);
            return true;
        }
        // must replace the top
        assert(!_store.empty, "Cannot replace front of an empty heap.");
        if (!comp(value, _store.front)) return false; // value >= largest
        _store.front = value;
        percolateDown(_store, 0, _length);
        assertValid();
        return true;
    }
}

///
unittest
{
    // Example from "Introduction to Algorithms" Cormen et al, p 146
    int[] a = [ 4, 1, 3, 2, 16, 9, 10, 14, 8, 7 ];
    auto h = heapify(a);
    // largest element
    assert(h.front == 16);
    // a has the heap property
    assert(equal(a, [ 16, 14, 10, 8, 7, 9, 3, 2, 4, 1 ]));
}

/**
Convenience function that returns a $(D BinaryHeap!Store) object
initialized with $(D s) and $(D initialSize).
 */
BinaryHeap!(Store, less) heapify(alias less = "a < b", Store)(Store s,
        size_t initialSize = size_t.max)
{
    return BinaryHeap!(Store, less)(s, initialSize);
}

unittest
{
    {
        // example from "Introduction to Algorithms" Cormen et al., p 146
        int[] a = [ 4, 1, 3, 2, 16, 9, 10, 14, 8, 7 ];
        auto h = heapify(a);
        h = heapify!"a < b"(a);
        assert(h.front == 16);
        assert(a == [ 16, 14, 10, 8, 7, 9, 3, 2, 4, 1 ]);
        auto witness = [ 16, 14, 10, 9, 8, 7, 4, 3, 2, 1 ];
        for (; !h.empty; h.removeFront(), witness.popFront())
        {
            assert(!witness.empty);
            assert(witness.front == h.front);
        }
        assert(witness.empty);
    }
    {
        int[] a = [ 4, 1, 3, 2, 16, 9, 10, 14, 8, 7 ];
        int[] b = new int[a.length];
        BinaryHeap!(int[]) h = BinaryHeap!(int[])(b, 0);
        foreach (e; a)
        {
            h.insert(e);
        }
        assert(b == [ 16, 14, 10, 8, 7, 3, 9, 1, 4, 2 ], text(b));
    }
}

////////////////////////////////////////////////////////////////////////////////
// Array!bool
////////////////////////////////////////////////////////////////////////////////

/**
_Array specialized for $(D bool). Packs together values efficiently by
allocating one bit per element.
 */
struct Array(T)
if (is(Unqual!T == bool))
{
    static immutable uint bitsPerWord = size_t.sizeof * 8;
    private static struct Data
    {
        Array!size_t.Payload _backend;
        size_t _length;
    }
    private RefCounted!(Data, RefCountedAutoInitialize.no) _store;

    private @property ref size_t[] data()
    {
        assert(_store.refCountedStore.isInitialized);
        return _store._backend._payload;
    }

    /**
       Defines the container's primary range.
     */
    struct Range
    {
        private Array _outer;
        private size_t _a, _b;
        /// Range primitives
        @property Range save()
        {
            version (bug4437)
            {
                return this;
            }
            else
            {
                auto copy = this;
                return copy;
            }
        }
        /// Ditto
        @property bool empty()
        {
            return _a >= _b || _outer.length < _b;
        }
        /// Ditto
        @property T front()
        {
            enforce(!empty);
            return _outer[_a];
        }
        /// Ditto
        @property void front(bool value)
        {
            enforce(!empty);
            _outer[_a] = value;
        }
        /// Ditto
        T moveFront()
        {
            enforce(!empty);
            return _outer.moveAt(_a);
        }
        /// Ditto
        void popFront()
        {
            enforce(!empty);
            ++_a;
        }
        /// Ditto
        @property T back()
        {
            enforce(!empty);
            return _outer[_b - 1];
        }
        /// Ditto
        @property void back(bool value)
        {
            enforce(!empty);
            _outer[_b - 1] = value;
        }
        /// Ditto
        T moveBack()
        {
            enforce(!empty);
            return _outer.moveAt(_b - 1);
        }
        /// Ditto
        void popBack()
        {
            enforce(!empty);
            --_b;
        }
        /// Ditto
        T opIndex(size_t i)
        {
            return _outer[_a + i];
        }
        /// Ditto
        void opIndexAssign(T value, size_t i)
        {
            _outer[_a + i] = value;
        }
        /// Ditto
        T moveAt(size_t i)
        {
            return _outer.moveAt(_a + i);
        }
        /// Ditto
        @property size_t length() const
        {
            assert(_a <= _b);
            return _b - _a;
        }
        alias opDollar = length;
        /// ditto
        Range opSlice(size_t low, size_t high)
        {
            assert(_a <= low && low <= high && high <= _b);
            return Range(_outer, _a + low, _a + high);
        }
    }

    /**
       Property returning $(D true) if and only if the container has
       no elements.

       Complexity: $(BIGOH 1)
     */
    @property bool empty()
    {
        return !length;
    }

    unittest
    {
        Array!bool a;
        //a._store._refCountedDebug = true;
        assert(a.empty);
        a.insertBack(false);
        assert(!a.empty);
    }

    /**
       Returns a duplicate of the container. The elements themselves
       are not transitively duplicated.

       Complexity: $(BIGOH n).
     */
    @property Array dup()
    {
        Array result;
        result.insertBack(this[]);
        return result;
    }

    unittest
    {
        Array!bool a;
        assert(a.empty);
        auto b = a.dup;
        assert(b.empty);
        a.insertBack(true);
        assert(b.empty);
    }

    /**
       Returns the number of elements in the container.

       Complexity: $(BIGOH log(n)).
    */
    @property size_t length() const
    {
        return _store.refCountedStore.isInitialized ? _store._length : 0;
    }
    size_t opDollar() const
    {
        return length;
    }

    unittest
    {
        Array!bool a;
        assert(a.length == 0);
        a.insert(true);
        assert(a.length == 1, text(a.length));
    }

    /**
       Returns the maximum number of elements the container can store
       without (a) allocating memory, (b) invalidating iterators upon
       insertion.

       Complexity: $(BIGOH log(n)).
     */
    @property size_t capacity()
    {
        return _store.refCountedStore.isInitialized
            ? cast(size_t) bitsPerWord * _store._backend.capacity
            : 0;
    }

    unittest
    {
        Array!bool a;
        assert(a.capacity == 0);
        foreach (i; 0 .. 100)
        {
            a.insert(true);
            assert(a.capacity >= a.length, text(a.capacity));
        }
    }

    /**
       Ensures sufficient capacity to accommodate $(D n) elements.

       Postcondition: $(D capacity >= n)

       Complexity: $(BIGOH log(e - capacity)) if $(D e > capacity),
       otherwise $(BIGOH 1).
     */
    void reserve(size_t e)
    {
        _store.refCountedStore.ensureInitialized();
        _store._backend.reserve(to!size_t((e + bitsPerWord - 1) / bitsPerWord));
    }

    unittest
    {
        Array!bool a;
        assert(a.capacity == 0);
        a.reserve(15657);
        assert(a.capacity >= 15657);
    }

    /**
       Returns a range that iterates over all elements of the
       container, in a container-defined order. The container should
       choose the most convenient and fast method of iteration for $(D
       opSlice()).

       Complexity: $(BIGOH log(n))
     */
    Range opSlice()
    {
        return Range(this, 0, length);
    }

    unittest
    {
        Array!bool a;
        a.insertBack([true, false, true, true]);
        assert(a[].length == 4);
    }

    /**
       Returns a range that iterates the container between two
       specified positions.

       Complexity: $(BIGOH log(n))
     */
    Range opSlice(size_t a, size_t b)
    {
        enforce(a <= b && b <= length);
        return Range(this, a, b);
    }

    unittest
    {
        Array!bool a;
        a.insertBack([true, false, true, true]);
        assert(a[0 .. 2].length == 2);
    }

    /**
       Equivalent to $(D opSlice().front) and $(D opSlice().back),
       respectively.

       Complexity: $(BIGOH log(n))
     */
    @property bool front()
    {
        enforce(!empty);
        return data.ptr[0] & 1;
    }

    /// Ditto
    @property void front(bool value)
    {
        enforce(!empty);
        if (value) data.ptr[0] |= 1;
        else data.ptr[0] &= ~cast(size_t) 1;
    }

    unittest
    {
        Array!bool a;
        a.insertBack([true, false, true, true]);
        assert(a.front);
        a.front = false;
        assert(!a.front);
    }

    /// Ditto
    @property bool back()
    {
        enforce(!empty);
        return cast(bool)(data.back & (cast(size_t)1 << ((_store._length - 1) % bitsPerWord)));
    }

    /// Ditto
    @property void back(bool value)
    {
        enforce(!empty);
        if (value)
        {
            data.back |= (cast(size_t)1 << ((_store._length - 1) % bitsPerWord));
        }
        else
        {
            data.back &=
                ~(cast(size_t)1 << ((_store._length - 1) % bitsPerWord));
        }
    }

    unittest
    {
        Array!bool a;
        a.insertBack([true, false, true, true]);
        assert(a.back);
        a.back = false;
        assert(!a.back);
    }

    /**
       Indexing operators yield or modify the value at a specified index.
     */
    bool opIndex(size_t i)
    {
        auto div = cast(size_t) (i / bitsPerWord);
        auto rem = i % bitsPerWord;
        enforce(div < data.length);
        return cast(bool)(data.ptr[div] & (cast(size_t)1 << rem));
    }
    /// ditto
    void opIndexAssign(bool value, size_t i)
    {
        auto div = cast(size_t) (i / bitsPerWord);
        auto rem = i % bitsPerWord;
        enforce(div < data.length);
        if (value) data.ptr[div] |= (cast(size_t)1 << rem);
        else data.ptr[div] &= ~(cast(size_t)1 << rem);
    }
    /// ditto
    void opIndexOpAssign(string op)(bool value, size_t i)
    {
        auto div = cast(size_t) (i / bitsPerWord);
        auto rem = i % bitsPerWord;
        enforce(div < data.length);
        auto oldValue = cast(bool) (data.ptr[div] & (cast(size_t)1 << rem));
        // Do the deed
        auto newValue = mixin("oldValue "~op~" value");
        // Write back the value
        if (newValue != oldValue)
        {
            if (newValue) data.ptr[div] |= (cast(size_t)1 << rem);
            else data.ptr[div] &= ~(cast(size_t)1 << rem);
        }
    }
    /// Ditto
    T moveAt(size_t i)
    {
        return this[i];
    }

    unittest
    {
        Array!bool a;
        a.insertBack([true, false, true, true]);
        assert(a[0] && !a[1]);
        a[0] &= a[1];
        assert(!a[0]);
    }

    /**
       Returns a new container that's the concatenation of $(D this)
       and its argument.

       Complexity: $(BIGOH n + m), where m is the number of elements
       in $(D stuff)
     */
    Array!bool opBinary(string op, Stuff)(Stuff rhs) if (op == "~")
    {
        auto result = this;
        return result ~= rhs;
    }

    unittest
    {
        Array!bool a;
        a.insertBack([true, false, true, true]);
        Array!bool b;
        b.insertBack([true, true, false, true]);
        assert(equal((a ~ b)[],
                        [true, false, true, true, true, true, false, true]));
    }

    // /// ditto
    // TotalContainer opBinaryRight(Stuff, string op)(Stuff lhs) if (op == "~")
    // {
    //     assert(0);
    // }

    /**
       Forwards to $(D insertAfter(this[], stuff)).
     */
    // @@@BUG@@@
    //ref Array!bool opOpAssign(string op, Stuff)(Stuff stuff) if (op == "~")
    Array!bool opOpAssign(string op, Stuff)(Stuff stuff) if (op == "~")
    {
        static if (is(typeof(stuff[]))) insertBack(stuff[]);
        else insertBack(stuff);
        return this;
    }

    unittest
    {
        Array!bool a;
        a.insertBack([true, false, true, true]);
        Array!bool b;
        a.insertBack([false, true, false, true, true]);
        a ~= b;
        assert(equal(
                    a[],
                    [true, false, true, true, false, true, false, true, true]));
    }

    /**
       Removes all contents from the container. The container decides
       how $(D capacity) is affected.

       Postcondition: $(D empty)

       Complexity: $(BIGOH n)
     */
    void clear()
    {
        this = Array();
    }

    unittest
    {
        Array!bool a;
        a.insertBack([true, false, true, true]);
        a.clear();
        assert(a.capacity == 0);
    }

    /**
       Sets the number of elements in the container to $(D
       newSize). If $(D newSize) is greater than $(D length), the
       added elements are added to the container and initialized with
       $(D ElementType.init).

       Complexity: $(BIGOH abs(n - newLength))

       Postcondition: $(D _length == newLength)
     */
    @property void length(size_t newLength)
    {
        _store.refCountedStore.ensureInitialized();
        auto newDataLength =
            to!size_t((newLength + bitsPerWord - 1) / bitsPerWord);
        _store._backend.length = newDataLength;
        _store._length = newLength;
    }

    unittest
    {
        Array!bool a;
        a.length = 1057;
        assert(a.length == 1057);
        foreach (e; a)
        {
            assert(!e);
        }
    }

    /**
       Inserts $(D stuff) in the container. $(D stuff) can be a value
       convertible to $(D ElementType) or a range of objects
       convertible to $(D ElementType).

       The $(D stable) version guarantees that ranges iterating over
       the container are never invalidated. Client code that counts on
       non-invalidating insertion should use $(D stableInsert).

       Returns: The number of elements added.

       Complexity: $(BIGOH m * log(n)), where $(D m) is the number of
       elements in $(D stuff)
     */
    alias insert = insertBack;
    ///ditto
    alias stableInsert = insertBack;

    /**
       Same as $(D insert(stuff)) and $(D stableInsert(stuff))
       respectively, but relax the complexity constraint to linear.
     */
    alias linearInsert = insertBack;
    ///ditto
    alias stableLinearInsert = insertBack;

    /**
       Picks one value in the container, removes it from the
       container, and returns it. The stable version behaves the same,
       but guarantees that ranges iterating over the container are
       never invalidated.

       Precondition: $(D !empty)

       Returns: The element removed.

       Complexity: $(BIGOH log(n))
     */
    T removeAny()
    {
        auto result = back;
        removeBack();
        return result;
    }
    /// ditto
    alias stableRemoveAny = removeAny;

    unittest
    {
        Array!bool a;
        a.length = 1057;
        assert(!a.removeAny());
        assert(a.length == 1056);
        foreach (e; a)
        {
            assert(!e);
        }
    }

    /**
       Inserts $(D value) to the back of the container. $(D stuff) can
       be a value convertible to $(D ElementType) or a range of
       objects convertible to $(D ElementType). The stable version
       behaves the same, but guarantees that ranges iterating over the
       container are never invalidated.

       Returns: The number of elements inserted

       Complexity: $(BIGOH log(n))
     */
    size_t insertBack(Stuff)(Stuff stuff) if (is(Stuff : bool))
    {
        _store.refCountedStore.ensureInitialized();
        auto rem = _store._length % bitsPerWord;
        if (rem)
        {
            // Fits within the current array
            if (stuff)
            {
                data[$ - 1] |= (1u << rem);
            }
            else
            {
                data[$ - 1] &= ~(1u << rem);
            }
        }
        else
        {
            // Need to add more data
            _store._backend.insertBack(stuff);
        }
        ++_store._length;
        return 1;
    }
    /// Ditto
    size_t insertBack(Stuff)(Stuff stuff)
    if (isInputRange!Stuff && is(ElementType!Stuff : bool))
    {
        static if (!hasLength!Stuff) size_t result;
        for (; !stuff.empty; stuff.popFront())
        {
            insertBack(stuff.front);
            static if (!hasLength!Stuff) ++result;
        }
        static if (!hasLength!Stuff) return result;
        else return stuff.length;
    }
    /// ditto
    alias stableInsertBack = insertBack;

    /**
       Removes the value at the front or back of the container. The
       stable version behaves the same, but guarantees that ranges
       iterating over the container are never invalidated. The
       optional parameter $(D howMany) instructs removal of that many
       elements. If $(D howMany > n), all elements are removed and no
       exception is thrown.

       Precondition: $(D !empty)

       Complexity: $(BIGOH log(n)).
     */
    void removeBack()
    {
        enforce(_store._length);
        if (_store._length % bitsPerWord)
        {
            // Cool, just decrease the length
            --_store._length;
        }
        else
        {
            // Reduce the allocated space
            --_store._length;
            _store._backend.length = _store._backend.length - 1;
        }
    }
    /// ditto
    alias stableRemoveBack = removeBack;

    /**
       Removes $(D howMany) values at the front or back of the
       container. Unlike the unparameterized versions above, these
       functions do not throw if they could not remove $(D howMany)
       elements. Instead, if $(D howMany > n), all elements are
       removed. The returned value is the effective number of elements
       removed. The stable version behaves the same, but guarantees
       that ranges iterating over the container are never invalidated.

       Returns: The number of elements removed

       Complexity: $(BIGOH howMany * log(n)).
     */
    /// ditto
    size_t removeBack(size_t howMany)
    {
        if (howMany >= length)
        {
            howMany = length;
            clear();
        }
        else
        {
            length = length - howMany;
        }
        return howMany;
    }

    unittest
    {
        Array!bool a;
        a.length = 1057;
        assert(a.removeBack(1000) == 1000);
        assert(a.length == 57);
        foreach (e; a)
        {
            assert(!e);
        }
    }

    /**
       Inserts $(D stuff) before, after, or instead range $(D r),
       which must be a valid range previously extracted from this
       container. $(D stuff) can be a value convertible to $(D
       ElementType) or a range of objects convertible to $(D
       ElementType). The stable version behaves the same, but
       guarantees that ranges iterating over the container are never
       invalidated.

       Returns: The number of values inserted.

       Complexity: $(BIGOH n + m), where $(D m) is the length of $(D stuff)
     */
    size_t insertBefore(Stuff)(Range r, Stuff stuff)
    {
        // TODO: make this faster, it moves one bit at a time
        immutable inserted = stableInsertBack(stuff);
        immutable tailLength = length - inserted;
        bringToFront(
            this[r._a .. tailLength],
            this[tailLength .. length]);
        return inserted;
    }
    /// ditto
    alias stableInsertBefore = insertBefore;

    unittest
    {
        Array!bool a;
        version (bugxxxx)
        {
            a._store.refCountedDebug = true;
        }
        a.insertBefore(a[], true);
        assert(a.length == 1, text(a.length));
        a.insertBefore(a[], false);
        assert(a.length == 2, text(a.length));
    }

    /// ditto
    size_t insertAfter(Stuff)(Range r, Stuff stuff)
    {
        // TODO: make this faster, it moves one bit at a time
        immutable inserted = stableInsertBack(stuff);
        immutable tailLength = length - inserted;
        bringToFront(
            this[r._b .. tailLength],
            this[tailLength .. length]);
        return inserted;
    }
    /// ditto
    alias stableInsertAfter = insertAfter;

    unittest
    {
        Array!bool a;
        a.length = 10;
        a.insertAfter(a[0 .. 5], true);
        assert(a.length == 11, text(a.length));
        assert(a[5]);
    }
    /// ditto
    size_t replace(Stuff)(Range r, Stuff stuff) if (is(Stuff : bool))
    {
        if (!r.empty)
        {
            // There is room
            r.front = stuff;
            r.popFront();
            linearRemove(r);
        }
        else
        {
            // No room, must insert
            insertBefore(r, stuff);
        }
        return 1;
    }
    /// ditto
    alias stableReplace = replace;

    unittest
    {
        Array!bool a;
        a.length = 10;
        a.replace(a[3 .. 5], true);
        assert(a.length == 9, text(a.length));
        assert(a[3]);
    }

    /**
       Removes all elements belonging to $(D r), which must be a range
       obtained originally from this container. The stable version
       behaves the same, but guarantees that ranges iterating over the
       container are never invalidated.

       Returns: A range spanning the remaining elements in the container that
       initially were right after $(D r).

       Complexity: $(BIGOH n)
     */
    Range linearRemove(Range r)
    {
        copy(this[r._b .. length], this[r._a .. length]);
        length = length - r.length;
        return this[r._a .. length];
    }
    /// ditto
    alias stableLinearRemove = linearRemove;
}

unittest
{
    Array!bool a;
    assert(a.empty);
}

unittest
{
    Array!bool arr;
    arr.insert([false, false, false, false]);
    assert(arr.front == false);
    assert(arr.back == false);
    assert(arr[1] == false);
    auto slice = arr[];
    slice = arr[0 .. $];
    slice = slice[1 .. $];
    slice.front = true;
    slice.back = true;
    slice[1] = true;
    assert(slice.front == true);
    assert(slice.back == true);
    assert(slice[1] == true);
    assert(slice.moveFront == true);
    assert(slice.moveBack == true);
    assert(slice.moveAt(1) == true);
}

/*
 * Implementation for a Red Black node for use in a Red Black Tree (see below)
 *
 * this implementation assumes we have a marker Node that is the parent of the
 * root Node.  This marker Node is not a valid Node, but marks the end of the
 * collection.  The root is the left child of the marker Node, so it is always
 * last in the collection.  The marker Node is passed in to the setColor
 * function, and the Node which has this Node as its parent is assumed to be
 * the root Node.
 *
 * A Red Black tree should have O(lg(n)) insertion, removal, and search time.
 */
struct RBNode(V)
{
    /*
     * Convenience alias
     */
    alias Node = RBNode*;

    private Node _left;
    private Node _right;
    private Node _parent;

    /**
     * The value held by this node
     */
    V value;

    /**
     * Enumeration determining what color the node is.  Null nodes are assumed
     * to be black.
     */
    enum Color : byte
    {
        Red,
        Black
    }

    /**
     * The color of the node.
     */
    Color color;

    /**
     * Get the left child
     */
    @property Node left()
    {
        return _left;
    }

    /**
     * Get the right child
     */
    @property Node right()
    {
        return _right;
    }

    /**
     * Get the parent
     */
    @property Node parent()
    {
        return _parent;
    }

    /**
     * Set the left child.  Also updates the new child's parent node.  This
     * does not update the previous child.
     *
     * Returns newNode
     */
    @property Node left(Node newNode)
    {
        _left = newNode;
        if(newNode !is null)
            newNode._parent = &this;
        return newNode;
    }

    /**
     * Set the right child.  Also updates the new child's parent node.  This
     * does not update the previous child.
     *
     * Returns newNode
     */
    @property Node right(Node newNode)
    {
        _right = newNode;
        if(newNode !is null)
            newNode._parent = &this;
        return newNode;
    }

    // assume _left is not null
    //
    // performs rotate-right operation, where this is T, _right is R, _left is
    // L, _parent is P:
    //
    //      P         P
    //      |   ->    |
    //      T         L
    //     / \       / \
    //    L   R     a   T
    //   / \           / \
    //  a   b         b   R
    //
    /**
     * Rotate right.  This performs the following operations:
     *  - The left child becomes the parent of this node.
     *  - This node becomes the new parent's right child.
     *  - The old right child of the new parent becomes the left child of this
     *    node.
     */
    Node rotateR()
    in
    {
        assert(_left !is null);
    }
    body
    {
        // sets _left._parent also
        if(isLeftNode)
            parent.left = _left;
        else
            parent.right = _left;
        Node tmp = _left._right;

        // sets _parent also
        _left.right = &this;

        // sets tmp._parent also
        left = tmp;

        return &this;
    }

    // assumes _right is non null
    //
    // performs rotate-left operation, where this is T, _right is R, _left is
    // L, _parent is P:
    //
    //      P           P
    //      |    ->     |
    //      T           R
    //     / \         / \
    //    L   R       T   b
    //       / \     / \
    //      a   b   L   a
    //
    /**
     * Rotate left.  This performs the following operations:
     *  - The right child becomes the parent of this node.
     *  - This node becomes the new parent's left child.
     *  - The old left child of the new parent becomes the right child of this
     *    node.
     */
    Node rotateL()
    in
    {
        assert(_right !is null);
    }
    body
    {
        // sets _right._parent also
        if(isLeftNode)
            parent.left = _right;
        else
            parent.right = _right;
        Node tmp = _right._left;

        // sets _parent also
        _right.left = &this;

        // sets tmp._parent also
        right = tmp;
        return &this;
    }


    /**
     * Returns true if this node is a left child.
     *
     * Note that this should always return a value because the root has a
     * parent which is the marker node.
     */
    @property bool isLeftNode() const
    in
    {
        assert(_parent !is null);
    }
    body
    {
        return _parent._left is &this;
    }

    /**
     * Set the color of the node after it is inserted.  This performs an
     * update to the whole tree, possibly rotating nodes to keep the Red-Black
     * properties correct.  This is an O(lg(n)) operation, where n is the
     * number of nodes in the tree.
     *
     * end is the marker node, which is the parent of the topmost valid node.
     */
    void setColor(Node end)
    {
        // test against the marker node
        if(_parent !is end)
        {
            if(_parent.color == Color.Red)
            {
                Node cur = &this;
                while(true)
                {
                    // because root is always black, _parent._parent always exists
                    if(cur._parent.isLeftNode)
                    {
                        // parent is left node, y is 'uncle', could be null
                        Node y = cur._parent._parent._right;
                        if(y !is null && y.color == Color.Red)
                        {
                            cur._parent.color = Color.Black;
                            y.color = Color.Black;
                            cur = cur._parent._parent;
                            if(cur._parent is end)
                            {
                                // root node
                                cur.color = Color.Black;
                                break;
                            }
                            else
                            {
                                // not root node
                                cur.color = Color.Red;
                                if(cur._parent.color == Color.Black)
                                    // satisfied, exit the loop
                                    break;
                            }
                        }
                        else
                        {
                            if(!cur.isLeftNode)
                                cur = cur._parent.rotateL();
                            cur._parent.color = Color.Black;
                            cur = cur._parent._parent.rotateR();
                            cur.color = Color.Red;
                            // tree should be satisfied now
                            break;
                        }
                    }
                    else
                    {
                        // parent is right node, y is 'uncle'
                        Node y = cur._parent._parent._left;
                        if(y !is null && y.color == Color.Red)
                        {
                            cur._parent.color = Color.Black;
                            y.color = Color.Black;
                            cur = cur._parent._parent;
                            if(cur._parent is end)
                            {
                                // root node
                                cur.color = Color.Black;
                                break;
                            }
                            else
                            {
                                // not root node
                                cur.color = Color.Red;
                                if(cur._parent.color == Color.Black)
                                    // satisfied, exit the loop
                                    break;
                            }
                        }
                        else
                        {
                            if(cur.isLeftNode)
                                cur = cur._parent.rotateR();
                            cur._parent.color = Color.Black;
                            cur = cur._parent._parent.rotateL();
                            cur.color = Color.Red;
                            // tree should be satisfied now
                            break;
                        }
                    }
                }

            }
        }
        else
        {
            //
            // this is the root node, color it black
            //
            color = Color.Black;
        }
    }

    /**
     * Remove this node from the tree.  The 'end' node is used as the marker
     * which is root's parent.  Note that this cannot be null!
     *
     * Returns the next highest valued node in the tree after this one, or end
     * if this was the highest-valued node.
     */
    Node remove(Node end)
    {
        //
        // remove this node from the tree, fixing the color if necessary.
        //
        Node x;
        Node ret;
        if(_left is null || _right is null)
        {
            ret = next;
        }
        else
        {
            //
            // normally, we can just swap this node's and y's value, but
            // because an iterator could be pointing to y and we don't want to
            // disturb it, we swap this node and y's structure instead.  This
            // can also be a benefit if the value of the tree is a large
            // struct, which takes a long time to copy.
            //
            Node yp, yl, yr;
            Node y = next;
            yp = y._parent;
            yl = y._left;
            yr = y._right;
            auto yc = y.color;
            auto isyleft = y.isLeftNode;

            //
            // replace y's structure with structure of this node.
            //
            if(isLeftNode)
                _parent.left = y;
            else
                _parent.right = y;
            //
            // need special case so y doesn't point back to itself
            //
            y.left = _left;
            if(_right is y)
                y.right = &this;
            else
                y.right = _right;
            y.color = color;

            //
            // replace this node's structure with structure of y.
            //
            left = yl;
            right = yr;
            if(_parent !is y)
            {
                if(isyleft)
                    yp.left = &this;
                else
                    yp.right = &this;
            }
            color = yc;

            //
            // set return value
            //
            ret = y;
        }

        // if this has less than 2 children, remove it
        if(_left !is null)
            x = _left;
        else
            x = _right;

        // remove this from the tree at the end of the procedure
        bool removeThis = false;
        if(x is null)
        {
            // pretend this is a null node, remove this on finishing
            x = &this;
            removeThis = true;
        }
        else if(isLeftNode)
            _parent.left = x;
        else
            _parent.right = x;

        // if the color of this is black, then it needs to be fixed
        if(color == color.Black)
        {
            // need to recolor the tree.
            while(x._parent !is end && x.color == Node.Color.Black)
            {
                if(x.isLeftNode)
                {
                    // left node
                    Node w = x._parent._right;
                    if(w.color == Node.Color.Red)
                    {
                        w.color = Node.Color.Black;
                        x._parent.color = Node.Color.Red;
                        x._parent.rotateL();
                        w = x._parent._right;
                    }
                    Node wl = w.left;
                    Node wr = w.right;
                    if((wl is null || wl.color == Node.Color.Black) &&
                            (wr is null || wr.color == Node.Color.Black))
                    {
                        w.color = Node.Color.Red;
                        x = x._parent;
                    }
                    else
                    {
                        if(wr is null || wr.color == Node.Color.Black)
                        {
                            // wl cannot be null here
                            wl.color = Node.Color.Black;
                            w.color = Node.Color.Red;
                            w.rotateR();
                            w = x._parent._right;
                        }

                        w.color = x._parent.color;
                        x._parent.color = Node.Color.Black;
                        w._right.color = Node.Color.Black;
                        x._parent.rotateL();
                        x = end.left; // x = root
                    }
                }
                else
                {
                    // right node
                    Node w = x._parent._left;
                    if(w.color == Node.Color.Red)
                    {
                        w.color = Node.Color.Black;
                        x._parent.color = Node.Color.Red;
                        x._parent.rotateR();
                        w = x._parent._left;
                    }
                    Node wl = w.left;
                    Node wr = w.right;
                    if((wl is null || wl.color == Node.Color.Black) &&
                            (wr is null || wr.color == Node.Color.Black))
                    {
                        w.color = Node.Color.Red;
                        x = x._parent;
                    }
                    else
                    {
                        if(wl is null || wl.color == Node.Color.Black)
                        {
                            // wr cannot be null here
                            wr.color = Node.Color.Black;
                            w.color = Node.Color.Red;
                            w.rotateL();
                            w = x._parent._left;
                        }

                        w.color = x._parent.color;
                        x._parent.color = Node.Color.Black;
                        w._left.color = Node.Color.Black;
                        x._parent.rotateR();
                        x = end.left; // x = root
                    }
                }
            }
            x.color = Node.Color.Black;
        }

        if(removeThis)
        {
            //
            // clear this node out of the tree
            //
            if(isLeftNode)
                _parent.left = null;
            else
                _parent.right = null;
        }

        return ret;
    }

    /**
     * Return the leftmost descendant of this node.
     */
    @property Node leftmost()
    {
        Node result = &this;
        while(result._left !is null)
            result = result._left;
        return result;
    }

    /**
     * Return the rightmost descendant of this node
     */
    @property Node rightmost()
    {
        Node result = &this;
        while(result._right !is null)
            result = result._right;
        return result;
    }

    /**
     * Returns the next valued node in the tree.
     *
     * You should never call this on the marker node, as it is assumed that
     * there is a valid next node.
     */
    @property Node next()
    {
        Node n = &this;
        if(n.right is null)
        {
            while(!n.isLeftNode)
                n = n._parent;
            return n._parent;
        }
        else
            return n.right.leftmost;
    }

    /**
     * Returns the previous valued node in the tree.
     *
     * You should never call this on the leftmost node of the tree as it is
     * assumed that there is a valid previous node.
     */
    @property Node prev()
    {
        Node n = &this;
        if(n.left is null)
        {
            while(n.isLeftNode)
                n = n._parent;
            return n._parent;
        }
        else
            return n.left.rightmost;
    }

    Node dup(scope Node delegate(V v) alloc)
    {
        //
        // duplicate this and all child nodes
        //
        // The recursion should be lg(n), so we shouldn't have to worry about
        // stack size.
        //
        Node copy = alloc(value);
        copy.color = color;
        if(_left !is null)
            copy.left = _left.dup(alloc);
        if(_right !is null)
            copy.right = _right.dup(alloc);
        return copy;
    }

    Node dup()
    {
        Node copy = new RBNode!V;
        copy.value = value;
        copy.color = color;
        if(_left !is null)
            copy.left = _left.dup();
        if(_right !is null)
            copy.right = _right.dup();
        return copy;
    }
}

/**
 * Implementation of a $(LUCKY red-black tree) container.
 *
 * All inserts, removes, searches, and any function in general has complexity
 * of $(BIGOH lg(n)).
 *
 * To use a different comparison than $(D "a < b"), pass a different operator string
 * that can be used by $(XREF functional, binaryFun), or pass in a
 * function, delegate, functor, or any type where $(D less(a, b)) results in a $(D bool)
 * value.
 *
 * Note that less should produce a strict ordering.  That is, for two unequal
 * elements $(D a) and $(D b), $(D less(a, b) == !less(b, a)). $(D less(a, a)) should
 * always equal $(D false).
 *
 * If $(D allowDuplicates) is set to $(D true), then inserting the same element more than
 * once continues to add more elements.  If it is $(D false), duplicate elements are
 * ignored on insertion.  If duplicates are allowed, then new elements are
 * inserted after all existing duplicate elements.
 */
final class RedBlackTree(T, alias less = "a < b", bool allowDuplicates = false)
    if(is(typeof(binaryFun!less(T.init, T.init))))
{
    alias _less = binaryFun!less;

    // BUG: this must come first in the struct due to issue 2810

    // add an element to the tree, returns the node added, or the existing node
    // if it has already been added and allowDuplicates is false

    private auto _add(Elem n)
    {
        Node result;
        static if(!allowDuplicates)
            bool added = true;

        if(!_end.left)
        {
            _end.left = _begin = result = allocate(n);
        }
        else
        {
            Node newParent = _end.left;
            Node nxt = void;
            while(true)
            {
                if(_less(n, newParent.value))
                {
                    nxt = newParent.left;
                    if(nxt is null)
                    {
                        //
                        // add to right of new parent
                        //
                        newParent.left = result = allocate(n);
                        break;
                    }
                }
                else
                {
                    static if(!allowDuplicates)
                    {
                        if(!_less(newParent.value, n))
                        {
                            result = newParent;
                            added = false;
                            break;
                        }
                    }
                    nxt = newParent.right;
                    if(nxt is null)
                    {
                        //
                        // add to right of new parent
                        //
                        newParent.right = result = allocate(n);
                        break;
                    }
                }
                newParent = nxt;
            }
            if(_begin.left)
                _begin = _begin.left;
        }

        static if(allowDuplicates)
        {
            result.setColor(_end);
            version(RBDoChecks)
                check();
            ++_length;
            return result;
        }
        else
        {
            if(added)
            {
                ++_length;
                result.setColor(_end);
            }
            version(RBDoChecks)
                check();
            return Tuple!(bool, "added", Node, "n")(added, result);
        }
    }

    version(unittest)
    {
        private enum doUnittest = isIntegral!T;

        // note, this must be final so it does not affect the vtable layout
        final bool arrayEqual(T[] arr)
        {
            if(walkLength(this[]) == arr.length)
            {
                foreach(v; arr)
                {
                    if(!(v in this))
                        return false;
                }
                return true;
            }
            return false;
        }
    }
    else
    {
        private enum doUnittest = false;
    }

    /**
      * Element type for the tree
      */
    alias Elem = T;

    // used for convenience
    private alias Node = RBNode!Elem.Node;

    private Node   _end;
    private Node   _begin;
    private size_t _length;

    private void _setup()
    {
        assert(!_end); //Make sure that _setup isn't run more than once.
        _begin = _end = allocate();
    }

    static private Node allocate()
    {
        return new RBNode!Elem;
    }

    static private Node allocate(Elem v)
    {
        auto result = allocate();
        result.value = v;
        return result;
    }

    /**
     * The range type for $(D RedBlackTree)
     */
    struct Range
    {
        private Node _begin;
        private Node _end;

        private this(Node b, Node e)
        {
            _begin = b;
            _end = e;
        }

        /**
         * Returns $(D true) if the range is _empty
         */
        @property bool empty() const
        {
            return _begin is _end;
        }

        /**
         * Returns the first element in the range
         */
        @property Elem front()
        {
            return _begin.value;
        }

        /**
         * Returns the last element in the range
         */
        @property Elem back()
        {
            return _end.prev.value;
        }

        /**
         * pop the front element from the range
         *
         * complexity: amortized $(BIGOH 1)
         */
        void popFront()
        {
            _begin = _begin.next;
        }

        /**
         * pop the back element from the range
         *
         * complexity: amortized $(BIGOH 1)
         */
        void popBack()
        {
            _end = _end.prev;
        }

        /**
         * Trivial _save implementation, needed for $(D isForwardRange).
         */
        @property Range save()
        {
            return this;
        }
    }

    static if(doUnittest) unittest
    {
        auto ts = new RedBlackTree(1, 2, 3, 4, 5);
        assert(ts.length == 5);
        auto r = ts[];

        static if(less == "a < b")
            auto vals = [1, 2, 3, 4, 5];
        else
            auto vals = [5, 4, 3, 2, 1];

        assert(mystd.algorithm.equal(r, vals));
        assert(r.front == vals.front);
        assert(r.back != r.front);
        auto oldfront = r.front;
        auto oldback = r.back;
        r.popFront();
        r.popBack();
        assert(r.front != r.back);
        assert(r.front != oldfront);
        assert(r.back != oldback);
        assert(ts.length == 5);
    }

    // find a node based on an element value
    private Node _find(Elem e)
    {
        static if(allowDuplicates)
        {
            Node cur = _end.left;
            Node result = null;
            while(cur)
            {
                if(_less(cur.value, e))
                    cur = cur.right;
                else if(_less(e, cur.value))
                    cur = cur.left;
                else
                {
                    // want to find the left-most element
                    result = cur;
                    cur = cur.left;
                }
            }
            return result;
        }
        else
        {
            Node cur = _end.left;
            while(cur)
            {
                if(_less(cur.value, e))
                    cur = cur.right;
                else if(_less(e, cur.value))
                    cur = cur.left;
                else
                    return cur;
            }
            return null;
        }
    }

    /**
     * Check if any elements exist in the container.  Returns $(D false) if at least
     * one element exists.
     */
    @property bool empty()
    {
        return _end.left is null;
    }

    /++
        Returns the number of elements in the container.

        Complexity: $(BIGOH 1).
    +/
    @property size_t length()
    {
        return _length;
    }

    /**
     * Duplicate this container.  The resulting container contains a shallow
     * copy of the elements.
     *
     * Complexity: $(BIGOH n)
     */
    @property RedBlackTree dup()
    {
        return new RedBlackTree(_end.dup(), _length);
    }

    static if(doUnittest) unittest
    {
        auto ts = new RedBlackTree(1, 2, 3, 4, 5);
        assert(ts.length == 5);
        auto ts2 = ts.dup;
        assert(ts2.length == 5);
        assert(mystd.algorithm.equal(ts[], ts2[]));
        ts2.insert(cast(Elem)6);
        assert(!mystd.algorithm.equal(ts[], ts2[]));
        assert(ts.length == 5 && ts2.length == 6);
    }

    /**
     * Fetch a range that spans all the elements in the container.
     *
     * Complexity: $(BIGOH log(n))
     */
    Range opSlice()
    {
        return Range(_begin, _end);
    }

    /**
     * The front element in the container
     *
     * Complexity: $(BIGOH log(n))
     */
    Elem front()
    {
        return _begin.value;
    }

    /**
     * The last element in the container
     *
     * Complexity: $(BIGOH log(n))
     */
    Elem back()
    {
        return _end.prev.value;
    }

    /++
        $(D in) operator. Check to see if the given element exists in the
        container.

       Complexity: $(BIGOH log(n))
     +/
    bool opBinaryRight(string op)(Elem e) if (op == "in")
    {
        return _find(e) !is null;
    }

    static if(doUnittest) unittest
    {
        auto ts = new RedBlackTree(1, 2, 3, 4, 5);
        assert(cast(Elem)3 in ts);
        assert(cast(Elem)6 !in ts);
    }

    /**
     * Compares two trees for equality.
     *
     * Complexity: $(BIGOH n*log(n))
     */
    override bool opEquals(Object rhs)
    {
        RedBlackTree that = cast(RedBlackTree)rhs;
        if (that is null) return false;

        // If there aren't the same number of nodes, we can't be equal.
        if (this._length != that._length) return false;

        // FIXME: use a more efficient algo (if one exists?)
        auto thisRange = this[];
        auto thatRange = that[];
        return equal!(function(Elem a, Elem b) => !_less(a,b) && !_less(b,a))
                     (thisRange, thatRange);
    }

    static if(doUnittest) unittest
    {
        auto t1 = new RedBlackTree(1,2,3,4);
        auto t2 = new RedBlackTree(1,2,3,4);
        auto t3 = new RedBlackTree(1,2,3,5);
        auto t4 = new RedBlackTree(1,2,3,4,5);
        auto o = new Object();

        assert(t1==t2);
        assert(t1!=t3);
        assert(t1!=t4);
        assert(t1!=o);  // pathological case, must not crash
    }

    /**
     * Removes all elements from the container.
     *
     * Complexity: $(BIGOH 1)
     */
    void clear()
    {
        _end.left = null;
        _begin = _end;
        _length = 0;
    }

    static if(doUnittest) unittest
    {
        auto ts = new RedBlackTree(1,2,3,4,5);
        assert(ts.length == 5);
        ts.clear();
        assert(ts.empty && ts.length == 0);
    }

    /**
     * Insert a single element in the container.  Note that this does not
     * invalidate any ranges currently iterating the container.
     *
     * Complexity: $(BIGOH log(n))
     */
    size_t stableInsert(Stuff)(Stuff stuff) if (isImplicitlyConvertible!(Stuff, Elem))
    {
        static if(allowDuplicates)
        {
            _add(stuff);
            return 1;
        }
        else
        {
            return(_add(stuff).added ? 1 : 0);
        }
    }

    /**
     * Insert a range of elements in the container.  Note that this does not
     * invalidate any ranges currently iterating the container.
     *
     * Complexity: $(BIGOH m * log(n))
     */
    size_t stableInsert(Stuff)(Stuff stuff) if(isInputRange!Stuff && isImplicitlyConvertible!(ElementType!Stuff, Elem))
    {
        size_t result = 0;
        static if(allowDuplicates)
        {
            foreach(e; stuff)
            {
                ++result;
                _add(e);
            }
        }
        else
        {
            foreach(e; stuff)
            {
                if(_add(e).added)
                    ++result;
            }
        }
        return result;
    }

    /// ditto
    alias insert = stableInsert;

    static if(doUnittest) unittest
    {
        auto ts = new RedBlackTree(2,1,3,4,5,2,5);
        static if(allowDuplicates)
        {
            assert(ts.length == 7);
            assert(ts.stableInsert(cast(Elem[])[7, 8, 6, 9, 10, 8]) == 6);
            assert(ts.length == 13);
            assert(ts.stableInsert(cast(Elem)11) == 1 && ts.length == 14);
            assert(ts.stableInsert(cast(Elem)7) == 1 && ts.length == 15);

            static if(less == "a < b")
                assert(ts.arrayEqual([1,2,2,3,4,5,5,6,7,7,8,8,9,10,11]));
            else
                assert(ts.arrayEqual([11,10,9,8,8,7,7,6,5,5,4,3,2,2,1]));
        }
        else
        {
            assert(ts.length == 5);
            assert(ts.stableInsert(cast(Elem[])[7, 8, 6, 9, 10, 8]) == 5);
            assert(ts.length == 10);
            assert(ts.stableInsert(cast(Elem)11) == 1 && ts.length == 11);
            assert(ts.stableInsert(cast(Elem)7) == 0 && ts.length == 11);

            static if(less == "a < b")
                assert(ts.arrayEqual([1,2,3,4,5,6,7,8,9,10,11]));
            else
                assert(ts.arrayEqual([11,10,9,8,7,6,5,4,3,2,1]));
        }
    }

    /**
     * Remove an element from the container and return its value.
     *
     * Complexity: $(BIGOH log(n))
     */
    Elem removeAny()
    {
        scope(success)
            --_length;
        auto n = _begin;
        auto result = n.value;
        _begin = n.remove(_end);
        version(RBDoChecks)
            check();
        return result;
    }

    static if(doUnittest) unittest
    {
        auto ts = new RedBlackTree(1,2,3,4,5);
        assert(ts.length == 5);
        auto x = ts.removeAny();
        assert(ts.length == 4);
        Elem[] arr;
        foreach(Elem i; 1..6)
            if(i != x) arr ~= i;
        assert(ts.arrayEqual(arr));
    }

    /**
     * Remove the front element from the container.
     *
     * Complexity: $(BIGOH log(n))
     */
    void removeFront()
    {
        scope(success)
            --_length;
        _begin = _begin.remove(_end);
        version(RBDoChecks)
            check();
    }

    /**
     * Remove the back element from the container.
     *
     * Complexity: $(BIGOH log(n))
     */
    void removeBack()
    {
        scope(success)
            --_length;
        auto lastnode = _end.prev;
        if(lastnode is _begin)
            _begin = _begin.remove(_end);
        else
            lastnode.remove(_end);
        version(RBDoChecks)
            check();
    }

    static if(doUnittest) unittest
    {
        auto ts = new RedBlackTree(1,2,3,4,5);
        assert(ts.length == 5);
        ts.removeBack();
        assert(ts.length == 4);

        static if(less == "a < b")
            assert(ts.arrayEqual([1,2,3,4]));
        else
            assert(ts.arrayEqual([2,3,4,5]));

        ts.removeFront();
        assert(ts.arrayEqual([2,3,4]) && ts.length == 3);
    }

    /++
        Removes the given range from the container.

        Returns: A range containing all of the elements that were after the
                 given range.

        Complexity: $(BIGOH m * log(n)) (where m is the number of elements in
                    the range)
     +/
    Range remove(Range r)
    {
        auto b = r._begin;
        auto e = r._end;
        if(_begin is b)
            _begin = e;
        while(b !is e)
        {
            b = b.remove(_end);
            --_length;
        }
        version(RBDoChecks)
            check();
        return Range(e, _end);
    }

    static if(doUnittest) unittest
    {
        auto ts = new RedBlackTree(1,2,3,4,5);
        assert(ts.length == 5);
        auto r = ts[];
        r.popFront();
        r.popBack();
        assert(ts.length == 5);
        auto r2 = ts.remove(r);
        assert(ts.length == 2);
        assert(ts.arrayEqual([1,5]));

        static if(less == "a < b")
            assert(mystd.algorithm.equal(r2, [5]));
        else
            assert(mystd.algorithm.equal(r2, [1]));
    }

    /++
        Removes the given $(D Take!Range) from the container

        Returns: A range containing all of the elements that were after the
                 given range.

        Complexity: $(BIGOH m * log(n)) (where m is the number of elements in
                    the range)
     +/
    Range remove(Take!Range r)
    {
        immutable isBegin = (r.source._begin is _begin);
        auto b = r.source._begin;

        while(!r.empty)
        {
            r.popFront();
            b = b.remove(_end);
            --_length;
        }

        if(isBegin)
            _begin = b;

        return Range(b, _end);
    }

    static if(doUnittest) unittest
    {
        auto ts = new RedBlackTree(1,2,3,4,5);
        auto r = ts[];
        r.popFront();
        assert(ts.length == 5);
        auto r2 = ts.remove(take(r, 0));

        static if(less == "a < b")
        {
            assert(mystd.algorithm.equal(r2, [2,3,4,5]));
            auto r3 = ts.remove(take(r, 2));
            assert(ts.arrayEqual([1,4,5]) && ts.length == 3);
            assert(mystd.algorithm.equal(r3, [4,5]));
        }
        else
        {
            assert(mystd.algorithm.equal(r2, [4,3,2,1]));
            auto r3 = ts.remove(take(r, 2));
            assert(ts.arrayEqual([5,2,1]) && ts.length == 3);
            assert(mystd.algorithm.equal(r3, [2,1]));
        }
    }

    /++
       Removes elements from the container that are equal to the given values
       according to the less comparator. One element is removed for each value
       given which is in the container. If $(D allowDuplicates) is true,
       duplicates are removed only if duplicate values are given.

       Returns: The number of elements removed.

       Complexity: $(BIGOH m log(n)) (where m is the number of elements to remove)

        Examples:
--------------------
auto rbt = redBlackTree!true(0, 1, 1, 1, 4, 5, 7);
rbt.removeKey(1, 4, 7);
assert(mystd.algorithm.equal(rbt[], [0, 1, 1, 5]));
rbt.removeKey(1, 1, 0);
assert(mystd.algorithm.equal(rbt[], [5]));
--------------------
      +/
    size_t removeKey(U...)(U elems)
        if(allSatisfy!(isImplicitlyConvertibleToElem, U))
    {
        Elem[U.length] toRemove;

        foreach(i, e; elems)
            toRemove[i] = e;

        return removeKey(toRemove[]);
    }

    /++ Ditto +/
    size_t removeKey(U)(U[] elems)
        if(isImplicitlyConvertible!(U, Elem))
    {
        immutable lenBefore = length;

        foreach(e; elems)
        {
            auto beg = _firstGreaterEqual(e);
            if(beg is _end || _less(e, beg.value))
                // no values are equal
                continue;
            immutable isBegin = (beg is _begin);
            beg = beg.remove(_end);
            if(isBegin)
                _begin = beg;
            --_length;
        }

        return lenBefore - length;
    }

    /++ Ditto +/
    size_t removeKey(Stuff)(Stuff stuff)
        if(isInputRange!Stuff &&
           isImplicitlyConvertible!(ElementType!Stuff, Elem) &&
           !isDynamicArray!Stuff)
    {
        //We use array in case stuff is a Range from this RedBlackTree - either
        //directly or indirectly.
        return removeKey(array(stuff));
    }

    //Helper for removeKey.
    private template isImplicitlyConvertibleToElem(U)
    {
        enum isImplicitlyConvertibleToElem = isImplicitlyConvertible!(U, Elem);
    }

    static if(doUnittest) unittest
    {
        auto rbt = new RedBlackTree(5, 4, 3, 7, 2, 1, 7, 6, 2, 19, 45);

        //The cast(Elem) is because these tests are instantiated with a variety
        //of numeric types, and the literals are all int, which is not always
        //implicitly convertible to Elem (e.g. short).
        static if(allowDuplicates)
        {
            assert(rbt.length == 11);
            assert(rbt.removeKey(cast(Elem)4) == 1 && rbt.length == 10);
            assert(rbt.arrayEqual([1,2,2,3,5,6,7,7,19,45]) && rbt.length == 10);

            assert(rbt.removeKey(cast(Elem)6, cast(Elem)2, cast(Elem)1) == 3);
            assert(rbt.arrayEqual([2,3,5,7,7,19,45]) && rbt.length == 7);

            assert(rbt.removeKey(cast(Elem)(42)) == 0 && rbt.length == 7);
            assert(rbt.removeKey(take(rbt[], 3)) == 3 && rbt.length == 4);

            static if(less == "a < b")
                assert(mystd.algorithm.equal(rbt[], [7,7,19,45]));
            else
                assert(mystd.algorithm.equal(rbt[], [7,5,3,2]));
        }
        else
        {
            assert(rbt.length == 9);
            assert(rbt.removeKey(cast(Elem)4) == 1 && rbt.length == 8);
            assert(rbt.arrayEqual([1,2,3,5,6,7,19,45]));

            assert(rbt.removeKey(cast(Elem)6, cast(Elem)2, cast(Elem)1) == 3);
            assert(rbt.arrayEqual([3,5,7,19,45]) && rbt.length == 5);

            assert(rbt.removeKey(cast(Elem)(42)) == 0 && rbt.length == 5);
            assert(rbt.removeKey(take(rbt[], 3)) == 3 && rbt.length == 2);

            static if(less == "a < b")
                assert(mystd.algorithm.equal(rbt[], [19,45]));
            else
                assert(mystd.algorithm.equal(rbt[], [5,3]));
        }
    }

    // find the first node where the value is > e
    private Node _firstGreater(Elem e)
    {
        // can't use _find, because we cannot return null
        auto cur = _end.left;
        auto result = _end;
        while(cur)
        {
            if(_less(e, cur.value))
            {
                result = cur;
                cur = cur.left;
            }
            else
                cur = cur.right;
        }
        return result;
    }

    // find the first node where the value is >= e
    private Node _firstGreaterEqual(Elem e)
    {
        // can't use _find, because we cannot return null.
        auto cur = _end.left;
        auto result = _end;
        while(cur)
        {
            if(_less(cur.value, e))
                cur = cur.right;
            else
            {
                result = cur;
                cur = cur.left;
            }

        }
        return result;
    }

    /**
     * Get a range from the container with all elements that are > e according
     * to the less comparator
     *
     * Complexity: $(BIGOH log(n))
     */
    Range upperBound(Elem e)
    {
        return Range(_firstGreater(e), _end);
    }

    /**
     * Get a range from the container with all elements that are < e according
     * to the less comparator
     *
     * Complexity: $(BIGOH log(n))
     */
    Range lowerBound(Elem e)
    {
        return Range(_begin, _firstGreaterEqual(e));
    }

    /**
     * Get a range from the container with all elements that are == e according
     * to the less comparator
     *
     * Complexity: $(BIGOH log(n))
     */
    Range equalRange(Elem e)
    {
        auto beg = _firstGreaterEqual(e);
        if(beg is _end || _less(e, beg.value))
            // no values are equal
            return Range(beg, beg);
        static if(allowDuplicates)
        {
            return Range(beg, _firstGreater(e));
        }
        else
        {
            // no sense in doing a full search, no duplicates are allowed,
            // so we just get the next node.
            return Range(beg, beg.next);
        }
    }

    static if(doUnittest) unittest
    {
        auto ts = new RedBlackTree(1, 2, 3, 4, 5);
        auto rl = ts.lowerBound(3);
        auto ru = ts.upperBound(3);
        auto re = ts.equalRange(3);

        static if(less == "a < b")
        {
            assert(mystd.algorithm.equal(rl, [1,2]));
            assert(mystd.algorithm.equal(ru, [4,5]));
        }
        else
        {
            assert(mystd.algorithm.equal(rl, [5,4]));
            assert(mystd.algorithm.equal(ru, [2,1]));
        }

        assert(mystd.algorithm.equal(re, [3]));
    }

    version(RBDoChecks)
    {
        /*
         * Print the tree.  This prints a sideways view of the tree in ASCII form,
         * with the number of indentations representing the level of the nodes.
         * It does not print values, only the tree structure and color of nodes.
         */
        void printTree(Node n, int indent = 0)
        {
            if(n !is null)
            {
                printTree(n.right, indent + 2);
                for(int i = 0; i < indent; i++)
                    write(".");
                writeln(n.color == n.color.Black ? "B" : "R");
                printTree(n.left, indent + 2);
            }
            else
            {
                for(int i = 0; i < indent; i++)
                    write(".");
                writeln("N");
            }
            if(indent is 0)
                writeln();
        }

        /*
         * Check the tree for validity.  This is called after every add or remove.
         * This should only be enabled to debug the implementation of the RB Tree.
         */
        void check()
        {
            //
            // check implementation of the tree
            //
            int recurse(Node n, string path)
            {
                if(n is null)
                    return 1;
                if(n.parent.left !is n && n.parent.right !is n)
                    throw new Exception("Node at path " ~ path ~ " has inconsistent pointers");
                Node next = n.next;
                static if(allowDuplicates)
                {
                    if(next !is _end && _less(next.value, n.value))
                        throw new Exception("ordering invalid at path " ~ path);
                }
                else
                {
                    if(next !is _end && !_less(n.value, next.value))
                        throw new Exception("ordering invalid at path " ~ path);
                }
                if(n.color == n.color.Red)
                {
                    if((n.left !is null && n.left.color == n.color.Red) ||
                            (n.right !is null && n.right.color == n.color.Red))
                        throw new Exception("Node at path " ~ path ~ " is red with a red child");
                }

                int l = recurse(n.left, path ~ "L");
                int r = recurse(n.right, path ~ "R");
                if(l != r)
                {
                    writeln("bad tree at:");
                    printTree(n);
                    throw new Exception("Node at path " ~ path ~ " has different number of black nodes on left and right paths");
                }
                return l + (n.color == n.color.Black ? 1 : 0);
            }

            try
            {
                recurse(_end.left, "");
            }
            catch(Exception e)
            {
                printTree(_end.left, 0);
                throw e;
            }
        }
    }

    /+
        For the moment, using templatized contstructors doesn't seem to work
        very well (likely due to bug# 436 and/or bug# 1528). The redBlackTree
        helper function seems to do the job well enough though.

    /**
     * Constructor.  Pass in an array of elements, or individual elements to
     * initialize the tree with.
     */
    this(U)(U[] elems...) if (isImplicitlyConvertible!(U, Elem))
    {
        _setup();
        stableInsert(elems);
    }

    /**
     * Constructor.  Pass in a range of elements to initialize the tree with.
     */
    this(Stuff)(Stuff stuff) if (isInputRange!Stuff && isImplicitlyConvertible!(ElementType!Stuff, Elem) && !is(Stuff == Elem[]))
    {
        _setup();
        stableInsert(stuff);
    }
    +/

    /++ +/
    this()
    {
        _setup();
    }

    /++
       Constructor.  Pass in an array of elements, or individual elements to
       initialize the tree with.
     +/
    this(Elem[] elems...)
    {
        _setup();
        stableInsert(elems);
    }

    private this(Node end, size_t length)
    {
        _end = end;
        _begin = end.leftmost;
        _length = length;
    }
}

//Verify Example for removeKey.
unittest
{
    auto rbt = redBlackTree!true(0, 1, 1, 1, 4, 5, 7);
    rbt.removeKey(1, 4, 7);
    assert(mystd.algorithm.equal(rbt[], [0, 1, 1, 5]));
    rbt.removeKey(1, 1, 0);
    assert(mystd.algorithm.equal(rbt[], [5]));
}

//Tests for removeKey
unittest
{
    {
        auto rbt = redBlackTree(["hello", "world", "foo", "bar"]);
        assert(equal(rbt[], ["bar", "foo", "hello", "world"]));
        assert(rbt.removeKey("hello") == 1);
        assert(equal(rbt[], ["bar", "foo", "world"]));
        assert(rbt.removeKey("hello") == 0);
        assert(equal(rbt[], ["bar", "foo", "world"]));
        assert(rbt.removeKey("hello", "foo", "bar") == 2);
        assert(equal(rbt[], ["world"]));
        assert(rbt.removeKey(["", "world", "hello"]) == 1);
        assert(rbt.empty);
    }

    {
        auto rbt = redBlackTree([1, 2, 12, 27, 4, 500]);
        assert(equal(rbt[], [1, 2, 4, 12, 27, 500]));
        assert(rbt.removeKey(1u) == 1);
        assert(equal(rbt[], [2, 4, 12, 27, 500]));
        assert(rbt.removeKey(cast(byte)1) == 0);
        assert(equal(rbt[], [2, 4, 12, 27, 500]));
        assert(rbt.removeKey(1, 12u, cast(byte)27) == 2);
        assert(equal(rbt[], [2, 4, 500]));
        assert(rbt.removeKey([cast(short)0, cast(short)500, cast(short)1]) == 1);
        assert(equal(rbt[], [2, 4]));
    }
}

unittest
{
    void test(T)()
    {
        auto rt1 = new RedBlackTree!(T, "a < b", false)();
        auto rt2 = new RedBlackTree!(T, "a < b", true)();
        auto rt3 = new RedBlackTree!(T, "a > b", false)();
        auto rt4 = new RedBlackTree!(T, "a > b", true)();
    }

    test!long();
    test!ulong();
    test!int();
    test!uint();
    test!short();
    test!ushort();
    test!byte();
    test!byte();
}

/++
    Convenience function for creating a $(D RedBlackTree!E) from a list of
    values.

        Examples:
--------------------
auto rbt1 = redBlackTree(0, 1, 5, 7);
auto rbt2 = redBlackTree!string("hello", "world");
auto rbt3 = redBlackTree!true(0, 1, 5, 7, 5);
auto rbt4 = redBlackTree!"a > b"(0, 1, 5, 7);
auto rbt5 = redBlackTree!("a > b", true)(0.1, 1.3, 5.9, 7.2, 5.9);
--------------------
  +/
auto redBlackTree(E)(E[] elems...)
{
    return new RedBlackTree!E(elems);
}

/++ Ditto +/
auto redBlackTree(bool allowDuplicates, E)(E[] elems...)
{
    return new RedBlackTree!(E, "a < b", allowDuplicates)(elems);
}

/++ Ditto +/
auto redBlackTree(alias less, E)(E[] elems...)
{
    return new RedBlackTree!(E, less)(elems);
}

/++ Ditto +/
auto redBlackTree(alias less, bool allowDuplicates, E)(E[] elems...)
    if(is(typeof(binaryFun!less(E.init, E.init))))
{
    //We shouldn't need to instantiate less here, but for some reason,
    //dmd can't handle it if we don't (even though the template which
    //takes less but not allowDuplicates works just fine).
    return new RedBlackTree!(E, binaryFun!less, allowDuplicates)(elems);
}

//Verify Examples.
unittest
{
    auto rbt1 = redBlackTree(0, 1, 5, 7);
    auto rbt2 = redBlackTree!string("hello", "world");
    auto rbt3 = redBlackTree!true(0, 1, 5, 7, 5);
    auto rbt4 = redBlackTree!"a > b"(0, 1, 5, 7);
    auto rbt5 = redBlackTree!("a > b", true)(0.1, 1.3, 5.9, 7.2, 5.9);
}

//Combinations not in examples.
unittest
{
    auto rbt1 = redBlackTree!(true, string)("hello", "hello");
    auto rbt2 = redBlackTree!((a, b){return a < b;}, double)(5.1, 2.3);
    auto rbt3 = redBlackTree!("a > b", true, string)("hello", "world");
}

unittest
{
    auto rt1 = redBlackTree(5, 4, 3, 2, 1);
    assert(rt1.length == 5);
    assert(array(rt1[]) == [1, 2, 3, 4, 5]);

    auto rt2 = redBlackTree!"a > b"(1.1, 2.1);
    assert(rt2.length == 2);
    assert(array(rt2[]) == [2.1, 1.1]);

    auto rt3 = redBlackTree!true(5, 5, 4);
    assert(rt3.length == 3);
    assert(array(rt3[]) == [4, 5, 5]);

    auto rt4 = redBlackTree!string("hello", "hello");
    assert(rt4.length == 1);
    assert(array(rt4[]) == ["hello"]);
}

version(unittest) struct UnittestMe {
  int a;
}

unittest
{
    auto c = Array!UnittestMe();
}
