void foo(ref int[1] b) {}
void main() {
    ubyte[4] a;
    foo(cast(int[1])a);
}
