template recTemplate(T)
{
	enum bool recTemplate = recTemplate!T;
}

bool recFunction(int i) {
    return recFunction(i);
}
void main() {
    version(RecTemplate) {
        enum bool value = recTemplate!int;
    }
    version(RecFunction) {
        enum bool value = recFunction(0);
    }
}
