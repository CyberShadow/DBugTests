import std.range;
import std.traits;

struct BinaryReader {
	ref read(E)(E e) {
		readWriteVariable!true(e, e);
	}

	void readWriteVariable(bool isRead, T, P)(T data, P parent) {

		enum varStruct = is(T == struct);

		static if(varStruct) {
			alias mArr = TypeTuple!(__traits(allMembers, T));

			foreach(it; mArr) {

				static if(mixin(`__traits(compiles, &data.` ~ it ~ `)`) == false)
					enum vValid = false;
				else
					enum vValid = mixin(`is(FunctionTypeOf!(T.` ~ it ~ `) == function) == false`);

				static if(vValid) {

					mixin(`alias R = typeof(T.` ~ it ~ `);`);

								R tmp;

								readWriteVariable!isRead(tmp, parent);

				}
			}
		} static if(isBasicType!(ElementType!T) == false)
			foreach(it; data)
				readWriteVariable!isRead(it, parent);
	}

}

auto binaryReaderBuf(T)(T ) {
	return BinaryReader();
}

void binaryRead(E, T)(E var, T data) { binaryReaderBuf(data).read!()(var); }
