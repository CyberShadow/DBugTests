import std.typecons;

class Foo {
    string[int] aa;
}

class Bar {
    string[int] aa;
    alias aa this;
}

void main() {
    auto foo = new immutable(Foo);
    assert(rebindable(foo).get is foo); // ok

    auto bar = new immutable(Bar);
    assert(rebindable(bar).get is bar);   // fails
    auto len = rebindable(bar).aa.length; // crash
}
