immutable int[int] table;

static this() {
    table = [ 1: 2 ];
    table.rehash;
}
