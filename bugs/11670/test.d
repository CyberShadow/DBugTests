void main()
{
    assert(typeid(int).rtInfo == cast(immutable(void)*)0xDEADBEEF);
}
