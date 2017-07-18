class Foo {
    int x;
    this(int x) {
        this.x = x;
    }
    bool opEquals(in Foo a) const {
        return a.x == this.x;
    }
}
void main() {
    Foo f1 = new Foo(10);
    Foo f2 = new Foo(10);
    assert(f1 != f2);
    assert(f1.opEquals(f2));
}
