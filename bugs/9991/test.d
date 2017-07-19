int sum1(const int[] arr) {
  auto end = arr.ptr + arr.length - 3;
  int[4] sums;
  for(auto cur = arr.ptr; cur < end; cur += 4) {
    sums[0] += cur[0];
    sums[1] += cur[1];
    sums[2] += cur[2];
    sums[3] += cur[3];
  }

  return sums[0] + sums[1] + sums[2] + sums[3];
}

int sum2(const int[] arr) {
  auto end = arr.ptr + arr.length - 3;
  int sum0 = 0, sum1 = 0, sum2 = 0, sum3 = 0;
  for(auto cur = arr.ptr; cur < end; cur += 4) {
    sum0 += cur[0];
    sum1 += cur[1];
    sum2 += cur[2];
    sum3 += cur[3];
  }

  return sum0 + sum1 + sum2 + sum3;
}

void main()
{
	import std.random;
	auto rnd = Random(42);
	auto arr = new int[1024];
	foreach (ref a; arr)
		a = uniform!int(rnd);
	foreach (n; 0..1_000_000)
	{
		sum1(arr);
		sum2(arr);
	}
}
