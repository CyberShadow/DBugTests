// import std.conv: to;
// void main() {
//     assert(to!int("1") == 1);
//     assert(cast(int)'1' == 49);
//     assert(to!int('1') == 49);
// }


// But I think this is more handy:

import std.conv: to;
void main() {
    assert(to!int("1") == 1);
    assert(cast(int)'1' == 49);
    assert(to!int('1') == 1);
}
