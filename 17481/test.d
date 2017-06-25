class Obj{
  synchronized void trigger(){ new ubyte[1]; }
}

void main(){
  auto k = new shared Obj;
  k.trigger;
}
