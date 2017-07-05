void main() {
    import std.stdio, std.algorithm, std.range;
    auto M = [[[1, 2]], [[3, 4]]];
    M.filter!(r => r.dup.transposed.walkLength).writeln;
    M.filter!(r => r.transposed.walkLength).writeln;
}
