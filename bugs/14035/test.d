template alice (size_t ln=__LINE__) {
	enum alice = "{ int t_"~ln~" = 42; }";
}
pragma(msg, alice!());
