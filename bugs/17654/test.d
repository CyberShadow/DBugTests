char[] assumeUTF(ubyte[] str) pure { return cast(char[]) str; }

void main()
{
    ubyte[] b = ['a', 'b', 'c'];
    string s = assumeUTF(b); /* should be rejected */
    assert(s == "abc"); /* passes */
    b[0] = '!';
    assert(s == "abc"); /* fails */
}
