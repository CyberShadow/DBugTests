template Tuple(T...) {
    alias T Tuple;
}

template Repeat(int count) {
    static if (!count) {
        alias Tuple!() Repeat;
    } else {
        alias Tuple!(count-1, Repeat!(count-1)) Repeat;
    }
}

void sometemplate(int T)() {
    foreach (x; Repeat!(62)) {
        sometemplate!(T)();
    }
}

void main() {
    foreach (x; Repeat!(298)) {
        sometemplate!(x)();
    }
}
