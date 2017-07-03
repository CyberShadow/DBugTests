void main()
{
  uint u = ~0;
  dchar d = u;//implicit conversion
  assert(d > d.max);
}
