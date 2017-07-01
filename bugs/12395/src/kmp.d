import std.array;
import std.stdio;
import std.string;

@safe
pure T[] find(S,T)(T[] bigline, S[] smallline) 
	if(is(typeof(findmatch(bigline,smallline,[])):T[]))
{
	immutable ptrdiff_t[] match_table = kmpPreprocess(smallline);
	return findmatch(bigline, smallline, match_table);
}

@safe
pure T[] findmatch(S,T)(T[] bigline, S[] smallline, immutable ptrdiff_t[] match_table)
	if(is(typeof(smallline[0] != bigline[0]):bool))
{
	if(smallline.empty)
		return bigline;
	ptrdiff_t prevmatch = -1;
	foreach(size_t i, T c; bigline) {
		while(prevmatch >= 0 && c != smallline[prevmatch]) {
			prevmatch = match_table[prevmatch];
		}
		++prevmatch;
		if(prevmatch == smallline.length) {
			return bigline[i - smallline.length + 1..$];
		}
	}
	return [];
}

@safe
pure immutable ptrdiff_t[] kmpPreprocess(T)(const T[] line) {
	if(line.empty)
		return [];
	ptrdiff_t[] table = new ptrdiff_t[line.length];
	ptrdiff_t[] restable = table[1..$];
	ptrdiff_t prevmatch = -1;
	table[0] = -1;
	foreach(size_t i, T c; line[0..$-1]) {
		while(prevmatch >= 0 && c != line[prevmatch]) {
			prevmatch = table[prevmatch];
		}
		++prevmatch;
		restable[i] = prevmatch;
	}
	return table;
}

unittest {
	assert(kmpPreprocess!int([]) == []);
	assert(kmpPreprocess("abcdabd")==[-1, 0, 0, 0, 0, 1, 2]);
	assert(kmpPreprocess("aaaaaaa")==[-1, 0, 1, 2, 3, 4, 5]);
	assert(find("ababababababababcabab","abababc") == "abababcabab");
	assert(find("ababab","abc") == "");
	assert(find("abc","") == "abc");
}
