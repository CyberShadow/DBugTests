class foo {
    bar fun;
    alias fun this;

    this() {
        fun = new bar(this);
        fun.a = 5; //remove this line and the program will compile.
    }
}

class bar {
    foo sun;
    alias sun this;

    this(foo t) {
        sun = t;
    }
}

void main() {
    foo fun = new foo;
}
