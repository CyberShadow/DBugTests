extern "C" int rt_init(); // prototypes of standard D runtime functions
extern "C" void rt_term();

extern "C" void dfunc();

int main()
{
  auto dinit = rt_init(); // returns 1
  dfunc(); // causes unhandled exception
}
