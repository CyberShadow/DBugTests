template T(alias f) {}
static assert(!is(T!((int x) {return invalid;})));
    /* no segfault without "return" */
