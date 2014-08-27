immutable int[int] table;

static this() {
   table = [ 1: 2 ];
   table.rehash;
}



void main() {
	class A {}

	immutable A[short] table2;
	auto a = table2.get(10, null);
	
	immutable short[short] table3;
	auto v = table3.get(10, 0);
}
