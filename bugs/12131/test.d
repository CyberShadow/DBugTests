import std.internal.math.biguintcore;
struct Foo { BigUint a; }
void main() pure {
    BigUint x;
    x = BigUint(); // OK
    Foo y;
    y = Foo(); // Error
}
