enum A { a }
enum B { b }
struct T { A x; B y; }
void main() {
    T t;
    auto r1 = [int(t.x), int(t.y)]; // OK
    auto r2 = [t.tupleof]; // error

    // A a = t.y;
    // pragma(msg, typeof(x));
}
