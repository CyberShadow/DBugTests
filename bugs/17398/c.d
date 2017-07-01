module c;

import a;

enum BUG = true; // `false` "removes" the bug by reordering, 
                 // but this does not work in the original failing code.

struct S(F)
{
    void templateTaking__FILE__(string file = __FILE__)() {
    }

    static if (BUG) {
        auto addrFoo() {
            return &foo;
        }
    }

    private void foo() {
        templateTaking__FILE__();
    }

    static if (!BUG) {
        auto addrFoo() {
            return &foo;
        }
    }
}

S!int cInst;
