class C
{
    void method() {}

    void fun()
    {
        void local() {}

        call!local();  // OK
        call!method(); // Error
    }
}

void call(alias f)()
{
    f();
}
