alias Identity(alias x) = x;

struct X(T) { }

alias Xi = X!int;

static assert(!__traits(isSame, Xi, __traits(parent, Xi)));
