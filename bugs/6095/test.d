int A51_a;

struct A51
{
    ~this() { ++A51_a; }
}

void main() // an excerpt from the full test
{
  // should fail to build, no case 1 and no default
  A51_a = 0; { if (0) final switch(1) A51 a;        } assert(A51_a == 0);

  // should be 0, there's no flow that should involve a being instantiated
  // or destroyed
  A51_a = 0; { if (1) switch(1) { A51 a; default: } } assert(A51_a == 0);
}
