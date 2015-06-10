struct Biggy {
    @disable this(this);
    ulong[500000] a;
}
__gshared Biggy biggy;

void main() {
    biggy = Biggy.init;
}
