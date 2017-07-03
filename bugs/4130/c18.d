void fun(size_t a)() {}

string gen(size_t limit)
{
    string s;
    foreach(i; 0..limit)
    {
        s ~= "fun!__LINE__();\n";
    }
    return s;
}

void main()
{
    mixin(gen(2^^16));
}
