string foo(char[] s) // It cannot be compiled
{
    return s ? (){ return s[0..$].dup; }() : null;
}

string bar(char[] s) // It can be compiled
{
    return s ? s[0..$].dup : null;
}
