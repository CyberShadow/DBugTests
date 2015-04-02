immutable struct Bug
{  
    string s_name;
    alias s_name this;

    string opBinary(string op, V)(V tValue) {
        return "";
    }
}

class Buggy {

    static string fun(string str)()
    {
        return str;
    }
    static immutable C_A = immutable Bug("c_a");
}


void main(string[] args)
{
    enum kt = Buggy.fun!(Buggy.C_A);
    enum bt = Buggy.C_A ~ " - ";
}
