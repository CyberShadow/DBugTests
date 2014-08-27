module b;

class myClass {
    ref self() { return this; }
}

struct myStruct {
    ref self() { return this; }
}

int y = 0;
ref myFunc() {return y;}
