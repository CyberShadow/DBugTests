import std.algorithm;

enum E { a, b }

void main()
{
    auto a = new E[100];
    sort(a);
}
