int* gInt;

ref int* getTheIntPtr(string str = "Hello") {
    assert(str !is null);
    return gInt;
}

unittest {
    int x;
    getTheIntPtr = &x;
    getTheIntPtr = null; // oops, assertion failure
}
