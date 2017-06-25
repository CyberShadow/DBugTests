void foo(T)(ref T[] a) {}
void bar(in int[] b) {
    foo(b);
}
void main() {}
