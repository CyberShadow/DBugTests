enum ubyte x = 1;
void assert_minus_1(int y) { assert(y == -1); }
static assert(is(typeof(-x) == int), "Violating C's type rules");
unittest {
    assert_minus_1(-x); // -x is 255, it's zero-extended instead of sign-extended!
}
