import std.traits;

struct Item {
    uint id;
    long time;
}

void main() {
    alias MultiIndexContainer!(Item) Container;

    Container c = new Container();
    c.index0.insert( Item(21, 35), );
}

template OrderedIndex() {
    alias void* Node;
    alias const(Item) Elem;
    auto _add(Node n) { }

    size_t insert(Stuff)(Stuff ) if (isImplicitlyConvertible!(Stuff, Elem)) {
        Node n ;
        _add(n);
        return 1;
    }
}

class MultiIndexContainer(Value) {
    this(){
    }
    new(size_t sz) {
        return (new void[](sz)).ptr;
    }

    mixin OrderedIndex!() index0;
}
