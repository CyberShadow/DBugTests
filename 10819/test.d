void main() {
    import std.range;
    SortedRange!(int[], "a > b") a;
    SortedRange!(int[], "a > b") b;
    b = a;
    SortedRange!(int[], (a, b) => a > b) c;
    SortedRange!(int[], (a, b) => a > b) d;
    d = c;
}
