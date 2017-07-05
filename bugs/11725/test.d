void foo() {
  const int[] aa = [1,2];
  int[] bb = aa.dup;		// Works

  const int[string] ia = ["a":1,"b":2];
  int[string] ib = ia.dup;	// Error
}
