void fun(){
  // ...
  alias Range = typeof(temp);
  static assert(isInputRange!Range);
  static assert(isIterable!Range && !isNarrowString!Range && !isInfinite!Range);

  static assert(is(typeof(temp.array))); // CT error
}
