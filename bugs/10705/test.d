import std.stdio;

struct Rect(T) {
public:
	bool intersects(ref const Rect!T rhs, ShortRect* overlap = null) 
{
		return false;
	}
}

alias FloatRect = Rect!float;
alias ShortRect = Rect!short;

void main() {

}
