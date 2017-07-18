import std.getopt;

void main()
{
    auto args = ["program", "-m", "-5", "-n", "-50", "-c", "-"];

    int m;
    int n;
    char c;

    getopt(
        args,
        "m|mm", "integer", &m,
        "n|nn", "integer", &n,
        "c|cc", "character", &c,
        );

    assert(m == -5);
    assert(n == -50);
    assert(c == '-');
}
