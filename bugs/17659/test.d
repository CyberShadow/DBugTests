void indirectCall(T)(T fn) {
    pragma(msg, T);
}

__gshared int x;

void f() {
    indirectCall({x++;});      // void function() nothrow @nogc @system
}

void g() pure {
    indirectCall({x++;});     // pure delegate 'dtest.g.__lambda1' cannot access mutable static data 'x'
}
