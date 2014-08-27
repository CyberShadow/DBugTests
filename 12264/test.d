template X(alias T1)                      { pragma(msg, "1"); }
template X(alias T2 : B!A, alias B, A...) { pragma(msg, "2"); }

struct S(T) {}

void main()
{
    alias x3 = X!(S!int);
    // should prefer the second template
}
