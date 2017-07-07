import control;

class Label : Control {
    protected override void onTextChanged() {
        layoutTransaction({
            super.onTextChanged();
        });
    }
}
