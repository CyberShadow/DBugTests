void main()
{
    float a, b=1;
    assert(!(a < b));
    assert(typeid(float).compare(&a, &b) < 0);
}
