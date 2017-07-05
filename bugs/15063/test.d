import std.typecons : Flag;

void test1(alias pred="a == b", T)(T a) {}

alias SomeFlag = Flag!"SomeFlag";
void test1(SomeFlag allocate_gc = SomeFlag.no, T)(T a) {}

void main()
{
    test1(1);
}
