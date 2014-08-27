struct Tuple(T...){
    pragma(msg, T); // shown twice!
    T expand;
    alias expand field;
    this(T values){
        field = values;
    }
}
struct Foo{ Tuple!(int,Foo)* foo; }
static bar(T...)(T args){  }
void main(){
    assert(Tuple!(int,Foo)(1,Foo()).expand[0] == 1);
}
