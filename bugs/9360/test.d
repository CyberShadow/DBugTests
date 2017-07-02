struct A {
public:
	void test()() {	
	}
}

void main() {
	const A[4] as;
	foreach (index; 0 .. 4) {
		as[index].test();
	}
}
