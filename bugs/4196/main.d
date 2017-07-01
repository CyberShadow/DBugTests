module main;
import t_def;
class C{ mixin T!(); }
void main(){
    C c = new C();
    c.func();
}
