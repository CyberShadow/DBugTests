static assert(!is(typeof({
	char[12] getArr() { return "Hello World!"; }
	string getString() { return getArr(); }
})));