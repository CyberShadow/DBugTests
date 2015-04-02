immutable(int)[string] foo(int[string] aa) {
    return cast(immutable(int)[string]) aa;
}

void main() {
    auto x = foo(["a": 1]);
    enum y = foo(["a": 1]); // Error
}
