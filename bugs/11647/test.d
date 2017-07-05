void main() {
    import std.stdio;
    int i = 0;
    auto a = [10, 20, 30];
    int r = 1 * a[i++] + 2 * a[i++] + 3 * a[i++];
    r.writeln;
}
