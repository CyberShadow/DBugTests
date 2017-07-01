static assert(!is(typeof({
	char[2] b()() { char[2] ret; return ret; }
	string a() { return b(); }
})));