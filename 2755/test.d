module a;
import b;

void main() {
    myClass mc;
    myStruct ms;
    mc.self;       // ICE
    ms.self;       // ICE
    myFunc();      // ICE
}
