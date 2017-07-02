	import cls : Cls;
	interface Ifc {}

	// This class causes the error,
	// but it isn't mentioned in the error message.
	class ClsHolder {Cls.Cls cls;}
