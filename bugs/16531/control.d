void layoutTransaction(void delegate() action) {
    action();
}

class Control {
    protected void onTextChanged() {}
}
