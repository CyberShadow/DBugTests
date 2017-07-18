import std.stdio;

enum A : int { a, b };
enum B : int { a, b };
enum AS : string[2] { a = ["1","2"], b = ["3","4"] };
enum BS : string[2] { a = ["5","6"], b = ["7","8"] };

void func(A x)   { writeln("A");  }
void func(B x)   { writeln("B");  }
void funcs(AS x) { writeln("AS"); }
void funcs(BS x) { writeln("BS"); }

void test()
{
    func(A.a); // no compiler error
    funcs(AS.a); // compiler error: matches both funcs(AS) and funcs(BS)
}

void main(string[] args) { }
