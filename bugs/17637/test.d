  import core.stdc.stdio;

  void main() {
    uint total = 0;
    void add(int x) { total += x; }
    ubyte popCount() { return 5; }

    add(popCount());
    add(-popCount());
    printf("%u\n", total);	// different result from C
  }
