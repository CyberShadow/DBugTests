const struct S {
	int x;
}

static assert(is(S == const(S)));
