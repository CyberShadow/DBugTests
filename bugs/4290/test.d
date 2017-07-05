struct Foo {
    int x;
    const bool opEquals(ref const Foo f) {
        return true;
    }
    int opCmp(ref const Foo f) {
        return 0;
    }
    hash_t toHash()const nothrow {
        return 10;
    }
}
void main() {
    int[Foo] aa;
    aa[Foo(1)]++;
    aa[Foo(2)]++;
    assert(aa.length == 1); // asserts, it's equal to 2
}
