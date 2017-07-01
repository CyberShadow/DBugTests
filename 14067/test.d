enum E { a }

void fun(E e)()
{
}

///
alias FA = fun!(E.a);

struct S(E e) {}

///
alias SA = S!(E.a);

// stringof property
//static assert(S!(E.a).stringof == "S!(E.a)"); // fail - stringof is "S!cast(E)0"
