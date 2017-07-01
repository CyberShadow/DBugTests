__gshared int var;

void f(int i = var) @safe
{
}

void main() @safe
{
    f();
}
