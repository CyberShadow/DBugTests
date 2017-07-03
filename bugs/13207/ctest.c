#include <assert.h>
#include <stddef.h>

const size_t n = 8;

struct S { long long ll; };

static_assert(sizeof(S) == n, "Size mismatch.");

size_t getN();
S getS1();
S getS2();

int main()
{
    // no 'rt_init' needed.

	assert(getN() == n); // , "D struct size mismatch.");
    const S s1 = getS1();
    const S s2 = getS2();
    assert(s1.ll == 0); // ok
    assert(s2.ll == 0); // fails

    return 0;
}
