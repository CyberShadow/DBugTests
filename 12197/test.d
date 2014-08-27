void foo(T)(T[1] b) {
    b[] = b[] ^^ 2;
}
void main() {
    import std.stdio;
    foo([10]);
}
