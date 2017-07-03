#include <assert.h>
#include <stddef.h>

const size_t n = 8;

struct S { char arr[n]; };

static_assert(sizeof(S) == n, "Size mismath.");

class I
{
public:
    virtual size_t getN() = 0;
    virtual S getS1() = 0;
    virtual S getS2() = 0;
};

extern "C" I *getI();

int main()
{
    rt_init();

    I *i = getI();
    assert(i->getN() == n); // simple test
    S s1 = i->getS1(); // ok
    S s2 = i->getS2(); // segfaults

    rt_term();
    return 0;
}
