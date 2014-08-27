template Tuple(T...) { alias T Tuple; }

void f(T...)(int arg0 = 0, T argN = Tuple!());

static this() { f(); }
