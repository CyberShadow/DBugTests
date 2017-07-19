class A {
    string filename() const { return "1";}
}

class B : A {
    override string filename() { return "2";}
}

void main(){
}
