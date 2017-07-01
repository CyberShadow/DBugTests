void bar()() {
}

struct P {
    void foo() {
        bar!(&this)();
    }
}
