class Foo {                                              // 1 
  void baz() {}                                          // 2
  void bar() {                                           // 3
    static if(compilesWithoutThis!baz) {                 // 4
      import std.stdio;                                  // 5
      writeln("baz compiles in global scope");           // 6
    }                                                    // 7
  }                                                      // 8
}                                                        // 9
template compilesWithoutThis (alias F) {                 // 10
  static if(__traits(compiles, F()))                     // 11
    enum bool compilesWithoutThis = true;                // 12
  else                                                   // 13
    enum bool compilesWithoutThis = false;               // 14
}                                                        // 15
void main() {                                            // 16
  Foo foo = new Foo;                                     // 17
  foo.bar();                                             // 18
}                                                        // 19
