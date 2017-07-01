module main;

import Foo;

class Super : Base
{
	//override protected void foo() {super.foo();} // works
	override void foo() {Base.foo();} // does not work:
	//Error: class Foo.Base member foo is not accessible
}
