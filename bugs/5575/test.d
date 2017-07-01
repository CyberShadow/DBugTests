import std.algorithm;
void main() {
    auto u1 = uniq([1]);
    auto m1 = map!q{ a }(u1); // OK
    const u2 = u1;
    auto m2 = map!q{ a }(u2); // Error
}
