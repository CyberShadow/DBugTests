auto T(alias pred)() { return pred; }

auto f()
{
    string var="cheese";
    void test() { assert(var=="cheese"); }
    T!test();
}
