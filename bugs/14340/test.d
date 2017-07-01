import std.algorithm, std.conv, std.range, std.stdio;
void main () {
    auto arr = [7, 5, 7, 3, 3, 5, 3, 3, 0, 3, 1, 1, 5, 1, 1, 1, 2, 2, 8, 5, 8, 8];
    arr.sort !((x, y) => arr.count (x) > arr.count (y) ||
        (arr.count (x) == arr.count (y) && x < y))
        .map !(to !(string))
        .join (" ")
        .writeln;
    // prints 1 1 1 1 1 3 3 3 3 3 5 5 5 5 8 8 8 2 2 0 7 7
    // should 1 1 1 1 1 3 3 3 3 3 5 5 5 5 8 8 8 2 2 7 7 0
}
