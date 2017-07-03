// version=a1;
// version=a2;
// version=a3;
import std.complex;
void main(){
  version(a1)
    auto a=[complex(0,0)];//Error: incompatible types for ((a[]) / (2)): 'Complex!(double)[]' and 'int'
  else version(a2)
    auto a = [0 + 0.0i];//Error: incompatible types for ((a[]) / (2)): 'cdouble[]' and 'int'
  else version(a3)
    auto a = [0.0];
  else static assert(0);

  //auto b=a[]+2.0; // Error: Array operation a[] + 2.00000 not implemented (a3) or incompatible types for ... (a1/a2)
  a[]*=2;
}
