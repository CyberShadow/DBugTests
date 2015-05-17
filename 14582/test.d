import std.bitmanip;
int main(string[] args)
{
   auto datain = new ubyte[16];

   // this syntax works
   ushort descriptorLength = bigEndianToNative!ushort(datain[2..4]);

   // this syntax fails (worked in previous version)
   int offset = 2;
   descriptorLength = bigEndianToNative!ushort(cast(ubyte[2]) datain[offset..offset+2]);

   return 0;
}
