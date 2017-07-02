struct S
{
    struct Static
    {
        static:
        int payload;
    }
    alias Static.payload this; // no identifier for declarator Static.payload

    alias get this; // OK
    ref @property get(){return Static.payload;}
}
