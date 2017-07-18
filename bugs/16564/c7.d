import
		std.stdio,
		std.range,
		std.random,
		std.typecons,
		std.algorithm,

		std.experimental.allocator.building_blocks,

		core.memory;


void main()
{
	ubyte[128 * 1024] b;
	auto alloc = KRRegion!()(b);

	//alloc.switchToFreeList;

	auto k = alloc.allocate(128);
	assert(alloc.deallocate(k));

	assert(alloc.empty == Ternary.yes);
}
