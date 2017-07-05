import std.algorithm.comparison;
import std.algorithm.iteration;

void main()
{
	const(int)[] var = [0, 1, 1, 2];
	assert(var.uniq.equal([0,1,2]));
}
