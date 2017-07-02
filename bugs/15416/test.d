class C { int x; void bar() { } }
void foo(C) { }

void main() {
	auto c = new C;
	auto d = &c;
	d.bar; // d.bar (C*) does multiple derefs to c.bar (C)
	d.foo; // d.foo does not attempt to deref d (C*) to c (C)
}
