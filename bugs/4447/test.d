extern(C) int printf(const char*, ...);
extern(C) uint sleep(uint);

struct vector3 {
  float x;
  float y;
  float z;
}

class Timer {
  static long getTime() {
    asm {
      naked;
      rdtsc;
      ret;
    }
  }
  
  long starttime;
  string label;

  this() {
    starttime = getTime();
  }
  this(string label) {
    starttime = getTime();
    this.label = label;
  }
  ~this() {
    long endTime = getTime();
    if (label !is null) {
      printf("%*s ", label.length, label.ptr);
    }
    printf("time: %ld\n", endTime - starttime);
  }
}

float DOT(ref vector3 A, ref vector3 B) {
  return A.x * B.x + A.y * B.y + A.z * B.z;
}

void fooCompiler(ref vector3 a, ref vector3 b)
{
  scope Timer t = new Timer();

  float d = DOT(a, b);

  printf("compiler: d = %f, %p    ", d, &d);
}

void fooManual(ref vector3 a, ref vector3 b)
{
  scope Timer t = new Timer();

  float d = a.x * b.x + a.y * b.y + a.z * b.z;

  printf("manual:   d = %f, %p    ", d, &d);
}

void main() {
  vector3 a = { 1, 2, 3 };
  vector3 b = { 4, 5, 6 };

  version(warm)
  {{
    scope t = new Timer();
    float d = 1.0;
    printf("float rewarm: %f\n", d);
  }}

  version(one)
  {
    fooManual(a, b);
    fooCompiler(a, b);
  }
  version(two)
  {
    fooCompiler(a, b);
    fooManual(a, b);
  }
}
