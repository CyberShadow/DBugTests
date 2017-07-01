module c;
import b;
// Note that foo is only used in the template constraint here,
// so this never causes foo!int to be emitted. 
T barImpl(T)(T t) if (is(typeof({ foo!T(); }))) { return t; }
int bar(int a) { return barImpl(a); }
