class A
{
  final double caller(double d)
    {
      return callee(d);
    }

  double callee(double d)
    {
      return 0;
    }
}

class B : A
{
  final override double callee(double d)
    {
      // do some random math
      return (d*d - d/7.5)/d;
    }
}

void main()
{
  B b = new B;

  for(ulong l; l<50000000uL; l++)
    b.caller(l);
}
