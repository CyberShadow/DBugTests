void main() {
    import std.stdio, std.range, std.algorithm;
    auto items = iota(100, 250);
    immutable len = items.walkLength;
    immutable mean1 = items.sum / double(len);
    mean1.writeln;
}
