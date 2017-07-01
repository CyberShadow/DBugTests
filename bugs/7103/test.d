import std.stdio;

struct duck
{
    void quack(int I1, int I2 = 0)(bool louder = false)
    {
        if (louder)
            writeln("QUACK");
        else
            writeln("quack");
    }
}

void main()
{
    duck d;
    d.quack!(0, 0);
}
