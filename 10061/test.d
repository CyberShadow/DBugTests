import std.format, std.range;

void main()
{
  string line = "12 13 14";

  // arrays work
  int[] ary;
  formattedRead(line, "%(%d %)", &ary);
  assert(ary == [12, 13, 14]);

  // output ranges
  auto app = appender!(int[])();
  formattedRead(line, "%(%d %)", &app);
  assert(app.data == [12, 13, 14]);

  // delegates
  int cnt = 12;
  auto dg = (int v) { assert(v == cnt++); };
  formattedRead(line, "%(%d %)", dg);
}
