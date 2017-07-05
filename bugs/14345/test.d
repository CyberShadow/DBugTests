import std.typecons;

struct Array2D(E)
{
    E[] impl;
    int stride;
    int width, height;

    this(int width, int height, E[] initialData = [])
    {
        impl = initialData;
        this.stride = this.width = width;
        this.height = height;
        impl.length = width * height;
    }

    // Index a single element, e.g., arr[0, 1]
    ref E opIndex(int i, int j) { return impl[i + stride*j]; }

    // Array slicing, e.g., arr[1..2, 1..2], arr[2, 0..$], arr[0..$, 1].
    Array2D opIndex(int[2] r1, int[2] r2)
    {
        Array2D result;

        auto startOffset = r1[0] + r2[0]*stride;
        auto endOffset = r1[1] + (r2[1] - 1)*stride;
        result.impl = this.impl[startOffset .. endOffset];

        result.stride = this.stride;
        result.width = r1[1] - r1[0];
        result.height = r2[1] - r2[0];

        return result;
    }
    auto opIndex(int[2] r1, int j) { return opIndex(r1, [j, j+1]); }
    auto opIndex(int i, int[2] r2) { return opIndex([i, i+1], r2); }

    // Support for `x..y` notation in slicing operator for the given dimension.
    int[2] opSlice(size_t dim)(int start, int end)
        if (dim >= 0 && dim < 2)
    in { assert(start >= 0 && end <= this.opDollar!dim); }
    body
    {
        return [start, end];
    }

    // Support `$` in slicing notation, e.g., arr[1..$, 0..$-1].
    @property int opDollar(size_t dim : 0)() { return width; }
    @property int opDollar(size_t dim : 1)() { return height; }
}

unittest
{
    auto arr = Array2D!int(4, 3, [
        0, 1, 2,  3,
        4, 5, 6,  7,
        8, 9, 10, 11
    ]);

    // Basic indexing
    assert(arr[0, 0] == 0);
    assert(arr[1, 0] == 1);
    assert(arr[0, 1] == 4);

    // Use of opDollar
    assert(arr[$-1, 0] == 3);
    assert(arr[0, $-1] == 8);   // Note the value of $ differs by dimension
    assert(arr[$-1, $-1] == 11);

    // Slicing
    auto slice1 = arr[1..$, 0..$];
    assert(slice1[0, 0] == 1 && slice1[1, 0] == 2  && slice1[2, 0] == 3 &&
           slice1[0, 1] == 5 && slice1[1, 1] == 6  && slice1[2, 1] == 7 &&
           slice1[0, 2] == 9 && slice1[1, 2] == 10 && slice1[2, 2] == 11);

    auto slice2 = slice1[0..2, 1..$];
    assert(slice2[0, 0] == 5 && slice2[1, 0] == 6 &&
           slice2[0, 1] == 9 && slice2[1, 1] == 10);

    // Thin slices
    auto slice3 = arr[2, 0..$];
    assert(slice3[0, 0] == 2 &&
           slice3[0, 1] == 6 &&
           slice3[0, 2] == 10);

    auto slice4 = arr[0..3, 2];
    assert(slice4[0, 0] == 8 && slice4[1, 0] == 9 && slice4[2, 0] == 10);
}

unittest
{
    auto arr_ = Array2D!int(4, 3, [
        0, 1, 2,  3,
        4, 5, 6,  7,
        8, 9, 10, 11
    ]);
    struct Foo
    {
	    Array2D!int arr;
	    mixin Proxy!arr;
    }
    Foo arr;

    // Basic indexing
    assert(arr[0, 0] == 0);
    assert(arr[1, 0] == 1);
    assert(arr[0, 1] == 4);

    // Use of opDollar
    assert(arr[$-1, 0] == 3);
    assert(arr[0, $-1] == 8);   // Note the value of $ differs by dimension
    assert(arr[$-1, $-1] == 11);

    // Slicing
    auto slice1 = arr[1..$, 0..$];
    assert(slice1[0, 0] == 1 && slice1[1, 0] == 2  && slice1[2, 0] == 3 &&
           slice1[0, 1] == 5 && slice1[1, 1] == 6  && slice1[2, 1] == 7 &&
           slice1[0, 2] == 9 && slice1[1, 2] == 10 && slice1[2, 2] == 11);

    auto slice2 = slice1[0..2, 1..$];
    assert(slice2[0, 0] == 5 && slice2[1, 0] == 6 &&
           slice2[0, 1] == 9 && slice2[1, 1] == 10);

    // Thin slices
    auto slice3 = arr[2, 0..$];
    assert(slice3[0, 0] == 2 &&
           slice3[0, 1] == 6 &&
           slice3[0, 2] == 10);

    auto slice4 = arr[0..3, 2];
    assert(slice4[0, 0] == 8 && slice4[1, 0] == 9 && slice4[2, 0] == 10);
}

unittest
{
	
}
