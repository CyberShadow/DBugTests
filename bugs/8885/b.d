module b;
import a;

class B : A
{
    void x ( void delegate ( ) dg ) { dg(); }

    void f ( )
    {
        x(&super.d); // Expected to not be allowed to access private method of A
    }
}
