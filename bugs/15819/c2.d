import std.traits : isIterable, isNarrowString;
import std.range : isInfinite,isInputRange;
import std.array;

unittest {
  EmitResult temp;
  alias Range = typeof(temp);
  static assert(isInputRange!Range);
  static assert(isIterable!Range && !isNarrowString!Range && !isInfinite!Range);
  // BUG:error: cannot resolve type for temp.array(Range)(Range r) if (isIterable!Range && !isNarrowString!Range && !isInfinite!Range)
  static assert(is(typeof(temp.array)));
  static assert(is(typeof(array(temp))));
}

private struct EmitResult {
  // comment this make things "normal"
  private import std.array;

  @property bool empty() {
    return true;
  }

  void popFront() {
  }

  @property int front() {
    return 0;
  }

}
