class Test {
    struct Foo {
        int a, b, c;
    }

    Foo foo;
    alias foo this;
}

void main() {
    auto test = new Test();
    destroy(test);
}
