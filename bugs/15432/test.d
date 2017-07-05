import std.stdio;

enum AnotherColor { Red, }

enum Color { red, }

int main(string[] argv)
{
    Color c = Color.red;    
    writeln(AnotherColor.Red.stringof); // line 10
    return 0;
}
