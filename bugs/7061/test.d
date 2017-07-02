struct S{ void delegate() dg; }
struct T{ int delegate() dg; }

int x;
S a = {{}};              // fail
S b = {{;}};             // fail
S c = {{x=0;}};          // fail
T d = {{return 0;}};     // fail

void main(){
    S x = {{}};          // ok
    S y = {{;}};         // fail
    S z = {{x=0;}};      // fail
    T w = {{return 0;}}; // fail
}
