//alias id(alias a) = a;
template id(alias a) { alias a id; }

struct A(alias f) {
  alias id!(a => f(a)) g;
  this(int) {
    g.stringof;
  }
}

A!(a => a) x;
