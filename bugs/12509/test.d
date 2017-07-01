enum SIZE = 0x20000;

struct struct_A {
	uint			member_A;
}

struct struct_B {
	struct_A array[SIZE];
}

void main(){}