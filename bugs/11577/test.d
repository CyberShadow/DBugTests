import std.meta : NoDuplicates;
import std.typetuple : TypeTuple;

// OK
static assert(is(NoDuplicates!(int, const(int)) == TypeTuple!(int, const(int))));
// Error - result is (DateTime)
static assert(is(NoDuplicates!(DateTime, const(DateTime)) == TypeTuple!(DateTime, const(DateTime))));
// Error - result is (Object)
static assert(is(NoDuplicates!(Object, const(Object)) == TypeTuple!(Object, const(Object))));
