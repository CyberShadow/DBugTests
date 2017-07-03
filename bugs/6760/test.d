class C{
    void foo(){}
}

class D: C{
    @disable override void foo(){} // should be a compile-time error             
}
