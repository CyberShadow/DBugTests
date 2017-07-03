struct S
{
    const int i;
    void opOpAssign(string op : "+")(int) { }
    void opOpAssign(string op : "~")(int) { }
}

void main()
{
    S s;
    s += ""; // Error: cannot modify struct s S with immutable members
    s ~= ""; // Error: cannot modify struct s S with immutable members
}
