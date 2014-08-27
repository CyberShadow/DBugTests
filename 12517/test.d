struct CodepointInterval
{
uint[] _tuple;
alias _tuple this;
}

struct DecompressedIntervals
{
CodepointInterval _front;

void popFront()
{
_front[] = decompressFrom;
}

}
