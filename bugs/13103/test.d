import std.typecons : Rebindable, rebindable;

struct Test {
    Rebindable!(Object) obj;
    Rebindable!(const Object) cobj;
}

void main()
{
    Test t1; // Okay                                                                                                                                                            
    Test t2 = Test(null); // Okay                                                                                                                                               
    t2.cobj = null; // Still okay                                                                                                                                               
    Test t3 = Test(null, null); // Error: cannot implicitly convert expression (null) of type typeof(null) to Rebindable!(const(Object))                                        
}
