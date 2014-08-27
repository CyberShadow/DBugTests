template ID(alias a){ alias ID=a; }
class C{
    int x=3;
    alias a = ID!(()=>x);
}
static assert(new C().a()==3);
