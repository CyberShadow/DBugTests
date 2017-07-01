void main()
{
    real x = 1;
    real y = x / 0;
    assert(y is real.infinity);    
}
