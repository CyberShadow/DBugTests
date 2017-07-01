void main() @safe {
    import std.algorithm: cartesianProduct;
    import std.array: array;
    const r = cartesianProduct([1], [1]).array;
}
