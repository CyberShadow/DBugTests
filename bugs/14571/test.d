struct InputPoint
{
  double[3] position;
  ubyte[4] color;
  uint pad;
}

struct GrowableArray(T, size_t chunkSize)
{
  struct Chunk
  {
    T[chunkSize] data;
  }
}

//alias X = GrowableArray!(InputPoint, 1024); // <-- this compiles quickly

alias GrowableArray!(InputPoint, 128*1024) X; // <-- this is very slow, appears to hang the compiler
