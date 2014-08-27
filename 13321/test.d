struct Foo {
    this(int) {}
}
void main(string[] args) {
    Foo x;
    if (args.length > 1)
        goto EXIT;
    x = Foo(1);
    EXIT:
    {}
}
