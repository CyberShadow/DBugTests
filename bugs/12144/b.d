struct S { bool opEquals(T : S)(T) { return false; } }
S[] fun()() { return new S[1]; }
