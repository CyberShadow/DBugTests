static uint globalThreadLocal = 123456;

uint foo() {
	asm {
		naked;
		mov EAX, globalThreadLocal;
		ret;
	}
}

void main() {
	uint x = foo();
	
	import std.stdio;
	writeln(x);
}
