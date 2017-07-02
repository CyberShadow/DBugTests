static assert(!is(shared const int == shared U, U)); // should work
static assert( is(shared const int :  shared U, U));
static assert(!is(const inout  int == const  U, U)); // should work
static assert( is(const inout  int :  const  U, U));
