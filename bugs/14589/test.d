class C{
  auto opUnary( string op)() {
    return this;
  }
}

class D:C{
  auto opUnary( string op)(){
    return super--;
  }
}
void main(){
  auto var= new D;
  var--;
}

