import
		std.stdio,
		std.random,
		std.typecons,
		std.algorithm,

		std.experimental.allocator.building_blocks;


void main()
{
	ubyte[1024 * 1024] buf;
	auto a = KRRegion!()(buf);

	while(true)
	{
		void[][] bufs;

		foreach(_; 0..10_000)
		{
			bufs ~= a.allocate(uniform(1, buf.length));
		}

		foreach(b; bufs.randomCover)
		{
			a.deallocate(b);
		}

		if(a.empty == Ternary.no) break;
	}

	writeln(`all the elements are freed but allocator is not empty !`);
}
