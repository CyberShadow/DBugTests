module foo;

static int f(A...)() { pragma(msg, typeof(A)); return 0; }
