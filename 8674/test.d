module main;
import std.stdio;
class A(T){
    T x;
    this(T x){this.x=x;}
}
auto make(alias a,T...)(T args){
    return new a!T(args);
}
void main(){
	//auto c=make!A(1.0);
    auto b=new A!double(1.0);
    writeln(typeid(b));
}
