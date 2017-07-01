void main() {
    import std.stdio, std.conv, std.string;
    auto p = "test".ptr;
    printf("%s\n", p);
    writef("%s\n", p);
    format("%s", p).writeln;
    p.text.writeln;
    text(cast(void*)p).writeln;
}
