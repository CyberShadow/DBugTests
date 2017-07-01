void foo()(){bar();}
void bar()(){foo();}
void qux() @safe pure nothrow{foo();}
