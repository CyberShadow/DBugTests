class A(T)
{
     class B
     {
         T blah() { return t; }
     }

     T t;
}

mixin A!(int);

int main()
{
     A!(int) a = new A!(int)();
     return 0;
}
