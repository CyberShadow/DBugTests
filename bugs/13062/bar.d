module bar;

import foo;

struct S { private int x; enum y = f!x(); }
