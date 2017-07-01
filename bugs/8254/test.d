struct S{
    int s;
    struct T{
        void f(){typeof(s) t;} // error
    }
}
