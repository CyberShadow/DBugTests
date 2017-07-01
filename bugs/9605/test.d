import std.conv;

void main()
{
  string s1 = `[['h', 'e', 'l', 'l', 'o'], ['w', 'o', 'r', 'l', 'd']]`;
  string s2 = `["hello", "world"]`;
  string s3 = `['h', 'e', 'l', 'l', 'o']`;
  string s4 = `"hello"`;

  auto ss1 = parse!(string[])(s1);
  auto ss2 = parse!(string[])(s2);
  auto ss3 = parse!(string  )(s3);
  auto ss4 = parse!(string  )(s4); //Can't parse string: "[" is missing
  return;
}
