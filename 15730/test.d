void selector(A...) (Object o, scope A args) {
  import std.traits : arity;
  foreach (immutable aidx, arg; args) {
    static if (arity!arg == 0) arg(); else arg(o);
  }
}


void main () {
  selector(new Object,
    (Object o) {},
    () {}
  );
}
