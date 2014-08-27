alias Identity(alias x) = x;

struct X(T) { }

alias Xi = X!int;

pragma(msg, __traits(parent, Xi).stringof);
