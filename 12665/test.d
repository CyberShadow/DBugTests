struct DateInterval {
    int value;
    this(int v) { value = v; }

    enum YEAR = DateInterval(365);
}
