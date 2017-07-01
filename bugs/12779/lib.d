module lib;

void test( string data) {
    auto ret = new Foo();
    ret.data = data;
    assert(ret.data.length < 1_000_000); // OK!
    ret.check(); // NG
}

class Foo {
    // Removing this or changing order of these members
    // affects the runtime behavior ...
    version (defined) {
        int[int] unusedAA;
    }

    string data;

    void check() {
        assert(data.length < 1_000_000); // NG!
    }
}
