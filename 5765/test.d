import std.bigint;
void main() {
    BigInt p1 = BigInt(2) ^^ 10;         // OK
    BigInt p2 = BigInt(1) << 10;         // OK

    BigInt p3 = BigInt(2) ^^ BigInt(10); // Error
    BigInt p4 = 2 ^^ BigInt(10);         // Error

    BigInt p5 = BigInt(1) << BigInt(10); // Error
    BigInt p6 = 1 << BigInt(10);         // Error
}
