struct Symbol {

}

struct TypeMetadata {
}

void createMetadata(Type)() {
    if(__traits(compiles, getType!Type)) { }
}


void getType(T)() {
    Symbol = getSymbol!T;
}

Symbol getSymbol(Args...)() {
    Symbol result();
    return result;
}

void main() {
    createMetadata!TypeMetadata;
}
