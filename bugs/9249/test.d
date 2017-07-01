class Bar {                  // 1
  public T opCast(T)()       // 2
    if(is(T  == string))     // 3
      {                      // 4
        return "Bar";        // 5
      }                      // 6
}                            // 7
                             // 8
class Foo: Bar { }           // 9
                             // 10
void main() {                // 11
  Bar bar = new Foo();       // 12
  Foo foo = cast(Foo) bar;   // 13
}                            // 14
