import std.traits;

class A
{
 X x; 
 struct X 
 {
  int f() { return 1; }
 }
 auto opDispatch(string s, TArgs...)(TArgs args)
 {
  mixin("return x."~s~"(args);");
 }
}
A func() { return null; }
pragma(msg, isCallable!func); // Error
