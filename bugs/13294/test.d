void f(T)(const ref T src, ref T dest)
{ }

void main()
{
    const byte src;
    byte dest;
    f(src, dest);
}
