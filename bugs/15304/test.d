import std.algorithm, std.container;

void main()
{
    static bool compare(P a, P b)
    {
        return a.curColumn < b.curColumn;
    }
    Array!P a = make!(Array!P);
    sort!compare(a[]);
}

struct P
{
    int curColumn = 0;
}
