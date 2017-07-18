import std.traits : fullyQualifiedName;
struct Foo { int fooMember; }
class Bar { static Foo foo; }
pragma(msg, fullyQualifiedName!(Bar.foo.fooMember));
