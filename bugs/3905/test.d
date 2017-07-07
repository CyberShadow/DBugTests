struct Group {
    int i1, i2;
    bool opBinary(string s:"in")(int x) { 
        return x == this.i1 || x == this.i2;
    }
}
auto enum r = 3 in Group(1, 2);
void main() {}
