import std.stdio;

void main() {
//  for (auto bc = File.ByChunk(File(""), 1); ; ) { } // as expected
//  for (auto bc = File("").byChunk(1);  false; ) { } // as expected
    for (auto bc = File("").byChunk(1); ; ) { } // infinite loop
    foreach(line; File("").byLine()) { }        // infinite loop too
}
