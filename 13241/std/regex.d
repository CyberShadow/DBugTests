//Written in the D programming language
/++
  $(SECTION Intro)
  $(LUCKY Regular expressions) are a commonly used method of pattern matching
  on strings, with $(I regex) being a catchy word for a pattern in this domain
  specific language. Typical problems usually solved by regular expressions
  include validation of user input and the ubiquitous find & replace
  in text processing utilities.

  $(SECTION Synopsis)
  ---
  import std.regex;
  import std.stdio;
  void main()
  {
      // Print out all possible dd/mm/yy(yy) dates found in user input.
      auto r = regex(r"\b[0-9][0-9]?/[0-9][0-9]?/[0-9][0-9](?:[0-9][0-9])?\b");
      foreach(line; stdin.byLine)
      {
        // matchAll() returns a range that can be iterated
        // to get all subsequent matches.
        foreach(c; matchAll(line, r))
            writeln(c.hit);
      }
  }
  ...

  // Create a static regex at compile-time, which contains fast native code.
  auto ctr = ctRegex!(`^.*/([^/]+)/?$`);

  // It works just like a normal regex:
  auto c2 = matchFirst("foo/bar", ctr);   // First match found here, if any
  assert(!c2.empty);   // Be sure to check if there is a match before examining contents!
  assert(c2[1] == "bar");   // Captures is a range of submatches: 0 = full match.

  ...

  // The result of the $(D matchAll) is directly testable with if/assert/while.
  // e.g. test if a string consists of letters:
  assert(matchFirst("Letter", `^\p{L}+$`));


  ---
  $(SECTION Syntax and general information)
  The general usage guideline is to keep regex complexity on the side of simplicity,
  as its capabilities reside in purely character-level manipulation.
  As such it's ill-suited for tasks involving higher level invariants
  like matching an integer number $(U bounded) in an [a,b] interval.
  Checks of this sort of are better addressed by additional post-processing.

  The basic syntax shouldn't surprise experienced users of regular expressions.
  For an introduction to $(D std.regex) see a
  $(WEB dlang.org/regular-expression.html, short tour) of the module API
  and its abilities.

  There are other web resources on regular expressions to help newcomers,
  and a good $(WEB www.regular-expressions.info, reference with tutorial)
  can easily be found.

  This library uses a remarkably common ECMAScript syntax flavor
  with the following extensions:
  $(UL
    $(LI Named subexpressions, with Python syntax. )
    $(LI Unicode properties such as Scripts, Blocks and common binary properties e.g Alphabetic, White_Space, Hex_Digit etc.)
    $(LI Arbitrary length and complexity lookbehind, including lookahead in lookbehind and vise-versa.)
  )

  $(REG_START Pattern syntax )
  $(I std.regex operates on codepoint level,
    'character' in this table denotes a single Unicode codepoint.)
  $(REG_TABLE
    $(REG_TITLE Pattern element, Semantics )
    $(REG_TITLE Atoms, Match single characters )
    $(REG_ROW any character except [{|*+?()^$, Matches the character itself. )
    $(REG_ROW ., In single line mode matches any character.
      Otherwise it matches any character except '\n' and '\r'. )
    $(REG_ROW [class], Matches a single character
      that belongs to this character class. )
    $(REG_ROW [^class], Matches a single character that
      does $(U not) belong to this character class.)
    $(REG_ROW \cC, Matches the control character corresponding to letter C)
    $(REG_ROW \xXX, Matches a character with hexadecimal value of XX. )
    $(REG_ROW \uXXXX, Matches a character  with hexadecimal value of XXXX. )
    $(REG_ROW \U00YYYYYY, Matches a character with hexadecimal value of YYYYYY. )
    $(REG_ROW \f, Matches a formfeed character. )
    $(REG_ROW \n, Matches a linefeed character. )
    $(REG_ROW \r, Matches a carriage return character. )
    $(REG_ROW \t, Matches a tab character. )
    $(REG_ROW \v, Matches a vertical tab character. )
    $(REG_ROW \d, Matches any Unicode digit. )
    $(REG_ROW \D, Matches any character except Unicode digits. )
    $(REG_ROW \w, Matches any word character (note: this includes numbers).)
    $(REG_ROW \W, Matches any non-word character.)
    $(REG_ROW \s, Matches whitespace, same as \p{White_Space}.)
    $(REG_ROW \S, Matches any character except those recognized as $(I \s ). )
    $(REG_ROW \\, Matches \ character. )
    $(REG_ROW \c where c is one of [|*+?(), Matches the character c itself. )
    $(REG_ROW \p{PropertyName}, Matches a character that belongs
        to the Unicode PropertyName set.
      Single letter abbreviations can be used without surrounding {,}. )
    $(REG_ROW  \P{PropertyName}, Matches a character that does not belong
        to the Unicode PropertyName set.
      Single letter abbreviations can be used without surrounding {,}. )
    $(REG_ROW \p{InBasicLatin}, Matches any character that is part of
          the BasicLatin Unicode $(U block).)
    $(REG_ROW \P{InBasicLatin}, Matches any character except ones in
          the BasicLatin Unicode $(U block).)
    $(REG_ROW \p{Cyrillic}, Matches any character that is part of
        Cyrillic $(U script).)
    $(REG_ROW \P{Cyrillic}, Matches any character except ones in
        Cyrillic $(U script).)
    $(REG_TITLE Quantifiers, Specify repetition of other elements)
    $(REG_ROW *, Matches previous character/subexpression 0 or more times.
      Greedy version - tries as many times as possible.)
    $(REG_ROW *?, Matches previous character/subexpression 0 or more times.
      Lazy version  - stops as early as possible.)
    $(REG_ROW +, Matches previous character/subexpression 1 or more times.
      Greedy version - tries as many times as possible.)
    $(REG_ROW +?, Matches previous character/subexpression 1 or more times.
      Lazy version  - stops as early as possible.)
    $(REG_ROW {n}, Matches previous character/subexpression exactly n times. )
    $(REG_ROW {n&#44}, Matches previous character/subexpression n times or more.
      Greedy version - tries as many times as possible. )
    $(REG_ROW {n&#44}?, Matches previous character/subexpression n times or more.
      Lazy version - stops as early as possible.)
    $(REG_ROW {n&#44m}, Matches previous character/subexpression n to m times.
      Greedy version - tries as many times as possible, but no more than m times. )
    $(REG_ROW {n&#44m}?, Matches previous character/subexpression n to m times.
      Lazy version - stops as early as possible, but no less then n times.)
    $(REG_TITLE Other, Subexpressions & alternations )
    $(REG_ROW (regex),  Matches subexpression regex,
      saving matched portion of text for later retrieval. )
    $(REG_ROW (?:regex), Matches subexpression regex,
      $(U not) saving matched portion of text. Useful to speed up matching. )
    $(REG_ROW A|B, Matches subexpression A, or failing that, matches B. )
    $(REG_ROW (?P&lt;name&gt;regex), Matches named subexpression
        regex labeling it with name 'name'.
        When referring to a matched portion of text,
        names work like aliases in addition to direct numbers.
     )
    $(REG_TITLE Assertions, Match position rather than character )
    $(REG_ROW ^, Matches at the begining of input or line (in multiline mode).)
    $(REG_ROW $, Matches at the end of input or line (in multiline mode). )
    $(REG_ROW \b, Matches at word boundary. )
    $(REG_ROW \B, Matches when $(U not) at word boundary. )
    $(REG_ROW (?=regex), Zero-width lookahead assertion.
        Matches at a point where the subexpression
        regex could be matched starting from the current position.
      )
    $(REG_ROW (?!regex), Zero-width negative lookahead assertion.
        Matches at a point where the subexpression
        regex could $(U not) be matched starting from the current position.
      )
    $(REG_ROW (?<=regex), Zero-width lookbehind assertion. Matches at a point
        where the subexpression regex could be matched ending
        at the current position (matching goes backwards).
      )
    $(REG_ROW  (?<!regex), Zero-width negative lookbehind assertion.
      Matches at a point where the subexpression regex could $(U not)
      be matched ending at the current position (matching goes backwards).
     )
  )

  $(REG_START Character classes )
  $(REG_TABLE
    $(REG_TITLE Pattern element, Semantics )
    $(REG_ROW Any atom, Has the same meaning as outside of a character class.)
    $(REG_ROW a-z, Includes characters a, b, c, ..., z. )
    $(REG_ROW [a||b]&#44 [a--b]&#44 [a~~b]&#44 [a&&b], Where a, b are arbitrary classes,
     means union, set difference, symmetric set difference, and intersection respectively.
     $(I Any sequence of character class elements implicitly forms a union.) )
  )

  $(REG_START Regex flags )
  $(REG_TABLE
    $(REG_TITLE Flag, Semantics )
    $(REG_ROW g, Global regex, repeat over the whole input. )
    $(REG_ROW i, Case insensitive matching. )
    $(REG_ROW m, Multi-line mode, match ^, $ on start and end line separators
       as well as start and end of input.)
    $(REG_ROW s, Single-line mode, makes . match '\n' and '\r' as well. )
    $(REG_ROW x, Free-form syntax, ignores whitespace in pattern,
      useful for formatting complex regular expressions. )
  )

  $(SECTION Unicode support)

  This library provides full Level 1 support* according to
    $(WEB unicode.org/reports/tr18/, UTS 18). Specifically:
  $(UL
    $(LI 1.1 Hex notation via any of \uxxxx, \U00YYYYYY, \xZZ.)
    $(LI 1.2 Unicode properties.)
    $(LI 1.3 Character classes with set operations.)
    $(LI 1.4 Word boundaries use the full set of "word" characters.)
    $(LI 1.5 Using simple casefolding to match case
        insensitively across the full range of codepoints.)
    $(LI 1.6 Respecting line breaks as any of
        \u000A | \u000B | \u000C | \u000D | \u0085 | \u2028 | \u2029 | \u000D\u000A.)
    $(LI 1.7 Operating on codepoint level.)
  )
  *With exception of point 1.1.1, as of yet, normalization of input
    is expected to be enforced by user.

    $(SECTION Replace format string)

    A set of functions in this module that do the substitution rely
    on a simple format to guide the process. In particular the table below
    applies to the $(D format) argument of
    $(LREF replaceFirst) and $(LREF replaceAll).

    The format string can reference parts of match using the following notation.
    $(REG_TABLE
        $(REG_TITLE Format specifier, Replaced by )
        $(REG_ROW $&amp;, the whole match. )
        $(REG_ROW $`, part of input $(I preceding) the match. )
        $(REG_ROW $', part of input $(I following) the match. )
        $(REG_ROW $$, '$' character. )
        $(REG_ROW \c &#44 where c is any character, the character c itself. )
        $(REG_ROW \\, '\' character. )
        $(REG_ROW &#36;1 .. &#36;99, submatch number 1 to 99 respectively. )
    )

  $(SECTION Slicing and zero memory allocations orientation)

  All matches returned by pattern matching functionality in this library
    are slices of the original input. The notable exception is the $(D replace)
    family of functions  that generate a new string from the input.

    In cases where producing the replacement is the ultimate goal
    $(LREF replaceFirstInto) and $(LREF replaceAllInto) could come in handy
    as functions that  avoid allocations even for replacement.

    Copyright: Copyright Dmitry Olshansky, 2011-

  License: $(WEB boost.org/LICENSE_1_0.txt, Boost License 1.0).

  Authors: Dmitry Olshansky,

    API and utility constructs are modeled after the original $(D std.regex)
  by Walter Bright and Andrei Alexandrescu.

  Source: $(PHOBOSSRC std/_regex.d)

Macros:
    REG_ROW = $(TR $(TD $(I $1 )) $(TD $+) )
    REG_TITLE = $(TR $(TD $(B $1)) $(TD $(B $2)) )
    REG_TABLE = <table border="1" cellspacing="0" cellpadding="5" > $0 </table>
    REG_START = <h3><div align="center"> $0 </div></h3>
    SECTION = <h3><a id="$1">$0</a></h3>
    S_LINK = <a href="#$1">$+</a>
 +/

module std.regex;

import std.array, std.algorithm, std.range,
       std.conv, std.exception, std.traits, std.typetuple,
       std.uni, std.utf, std.format, std.typecons, std.bitmanip,
       std.functional, std.exception;

import core.bitop, core.stdc.string, core.stdc.stdlib;
static import std.ascii;
import std.string : representation;

debug(std_regex_parser) import std.stdio; //trace parser progress
debug(std_regex_search) import std.stdio; //trace prefix search engine
debug(std_regex_matcher) import std.stdio;  //trace matcher engine
debug(std_regex_allocation) import std.stdio; //track object life cycle
debug(std_regex_ctr) import std.stdio; //dump ctRegex generated sources
debug(std_regex_test) import std.stdio; //trace test suite progress

private:

// IR bit pattern: 0b1_xxxxx_yy
// where yy indicates class of instruction, xxxxx for actual operation code
//     00: atom, a normal instruction
//     01: open, opening of a group, has length of contained IR in the low bits
//     10: close, closing of a group, has length of contained IR in the low bits
//     11 unused
//
// Loops with Q (non-greedy, with ? mark) must have the same size / other properties as non Q version
// Possible changes:
//* merge group, option, infinite/repeat start (to never copy during parsing of (a|b){1,2})
//* reorganize groups to make n args easier to find, or simplify the check for groups of similar ops
//  (like lookaround), or make it easier to identify hotspots.

enum IR:uint {
    Char              = 0b1_00000_00, //a character
    Any               = 0b1_00001_00, //any character
    CodepointSet      = 0b1_00010_00, //a most generic CodepointSet [...]
    Trie              = 0b1_00011_00, //CodepointSet implemented as Trie
    //match with any of a consecutive OrChar's in this sequence
    //(used for case insensitive match)
    //OrChar holds in upper two bits of data total number of OrChars in this _sequence_
    //the drawback of this representation is that it is difficult
    // to detect a jump in the middle of it
    OrChar            = 0b1_00100_00,
    Nop               = 0b1_00101_00, //no operation (padding)
    End               = 0b1_00110_00, //end of program
    Bol               = 0b1_00111_00, //beginning of a string ^
    Eol               = 0b1_01000_00, //end of a string $
    Wordboundary      = 0b1_01001_00, //boundary of a word
    Notwordboundary   = 0b1_01010_00, //not a word boundary
    Backref           = 0b1_01011_00, //backreference to a group (that has to be pinned, i.e. locally unique) (group index)
    GroupStart        = 0b1_01100_00, //start of a group (x) (groupIndex+groupPinning(1bit))
    GroupEnd          = 0b1_01101_00, //end of a group (x) (groupIndex+groupPinning(1bit))
    Option            = 0b1_01110_00, //start of an option within an alternation x | y (length)
    GotoEndOr         = 0b1_01111_00, //end of an option (length of the rest)
    //... any additional atoms here

    OrStart           = 0b1_00000_01, //start of alternation group  (length)
    OrEnd             = 0b1_00000_10, //end of the or group (length,mergeIndex)
    //with this instruction order
    //bit mask 0b1_00001_00 could be used to test/set greediness
    InfiniteStart     = 0b1_00001_01, //start of an infinite repetition x* (length)
    InfiniteEnd       = 0b1_00001_10, //end of infinite repetition x* (length,mergeIndex)
    InfiniteQStart    = 0b1_00010_01, //start of a non eager infinite repetition x*? (length)
    InfiniteQEnd      = 0b1_00010_10, //end of non eager infinite repetition x*? (length,mergeIndex)
    RepeatStart       = 0b1_00011_01, //start of a {n,m} repetition (length)
    RepeatEnd         = 0b1_00011_10, //end of x{n,m} repetition (length,step,minRep,maxRep)
    RepeatQStart      = 0b1_00100_01, //start of a non eager x{n,m}? repetition (length)
    RepeatQEnd        = 0b1_00100_10, //end of non eager x{n,m}? repetition (length,step,minRep,maxRep)
    //
    LookaheadStart    = 0b1_00101_01, //begin of the lookahead group (length)
    LookaheadEnd      = 0b1_00101_10, //end of a lookahead group (length)
    NeglookaheadStart = 0b1_00110_01, //start of a negative lookahead (length)
    NeglookaheadEnd   = 0b1_00110_10, //end of a negative lookahead (length)
    LookbehindStart   = 0b1_00111_01, //start of a lookbehind (length)
    LookbehindEnd     = 0b1_00111_10, //end of a lookbehind (length)
    NeglookbehindStart= 0b1_01000_01, //start of a negative lookbehind (length)
    NeglookbehindEnd  = 0b1_01000_10, //end of negative lookbehind (length)
}

//a shorthand for IR length - full length of specific opcode evaluated at compile time
template IRL(IR code)
{
    enum uint IRL =  lengthOfIR(code);
}

static assert (IRL!(IR.LookaheadStart) == 3);

//how many parameters follow the IR, should be optimized fixing some IR bits
int immediateParamsIR(IR i){
    switch (i){
    case IR.OrEnd,IR.InfiniteEnd,IR.InfiniteQEnd:
        return 1;
    case IR.RepeatEnd, IR.RepeatQEnd:
        return 4;
    case IR.LookaheadStart, IR.NeglookaheadStart, IR.LookbehindStart, IR.NeglookbehindStart:
        return 2;
    default:
        return 0;
    }
}

//full length of IR instruction inlcuding all parameters that might follow it
int lengthOfIR(IR i)
{
    return 1 + immediateParamsIR(i);
}

//full length of the paired IR instruction inlcuding all parameters that might follow it
int lengthOfPairedIR(IR i)
{
    return 1 + immediateParamsIR(pairedIR(i));
}

//if the operation has a merge point (this relies on the order of the ops)
bool hasMerge(IR i)
{
    return (i&0b11)==0b10 && i <= IR.RepeatQEnd;
}

//is an IR that opens a "group"
bool isStartIR(IR i)
{
    return (i&0b11)==0b01;
}

//is an IR that ends a "group"
bool isEndIR(IR i)
{
    return (i&0b11)==0b10;
}

//is a standalone IR
bool isAtomIR(IR i)
{
    return (i&0b11)==0b00;
}

//makes respective pair out of IR i, swapping start/end bits of instruction
IR pairedIR(IR i)
{
    assert(isStartIR(i) || isEndIR(i));
    return cast(IR)(i ^ 0b11);
}

//encoded IR instruction
struct Bytecode
{
    uint raw;
    //natural constraints
    enum maxSequence = 2+4;
    enum maxData = 1<<22;
    enum maxRaw = 1<<31;

    this(IR code, uint data)
    {
        assert(data < (1<<22) && code < 256);
        raw = code<<24 | data;
    }

    this(IR code, uint data, uint seq)
    {
        assert(data < (1<<22) && code < 256 );
        assert(seq >= 2 && seq < maxSequence);
        raw = code << 24 | (seq - 2)<<22 | data;
    }

    //store raw data
    static Bytecode fromRaw(uint data)
    {
        Bytecode t;
        t.raw = data;
        return t;
    }

    //bit twiddling helpers
    //0-arg template due to @@@BUG@@@ 10985
    @property uint data()() const { return raw & 0x003f_ffff; }

    //ditto
    //0-arg template due to @@@BUG@@@ 10985
    @property uint sequence()() const { return 2 + (raw >> 22 & 0x3); }

    //ditto
    //0-arg template due to @@@BUG@@@ 10985
    @property IR code()() const { return cast(IR)(raw>>24); }

    //ditto
    @property bool hotspot() const { return hasMerge(code); }

    //test the class of this instruction
    @property bool isAtom() const { return isAtomIR(code); }

    //ditto
    @property bool isStart() const { return isStartIR(code); }

    //ditto
    @property bool isEnd() const { return isEndIR(code); }

    //number of arguments for this instruction
    @property int args() const { return immediateParamsIR(code); }

    //mark this GroupStart or GroupEnd as referenced in backreference
    void setBackrefence()
    {
        assert(code == IR.GroupStart || code == IR.GroupEnd);
        raw = raw | 1 << 23;
    }

    //is referenced
    @property bool backreference() const
    {
        assert(code == IR.GroupStart || code == IR.GroupEnd);
        return cast(bool)(raw & 1 << 23);
    }

    //mark as local reference (for backrefs in lookarounds)
    void setLocalRef()
    {
        assert(code == IR.Backref);
        raw = raw | 1 << 23;
    }

    //is a local ref
    @property bool localRef() const
    {
        assert(code == IR.Backref);
        return cast(bool)(raw & 1 << 23);
    }

    //human readable name of instruction
    @trusted @property string mnemonic() const
    {//@@@BUG@@@ to is @system
        return to!string(code);
    }

    //full length of instruction
    @property uint length() const
    {
        return lengthOfIR(code);
    }

    //full length of respective start/end of this instruction
    @property uint pairedLength() const
    {
        return lengthOfPairedIR(code);
    }

    //returns bytecode of paired instruction (assuming this one is start or end)
    @property Bytecode paired() const
    {//depends on bit and struct layout order
        assert(isStart || isEnd);
        return Bytecode.fromRaw(raw ^ 0b11 << 24);
    }

    //gets an index into IR block of the respective pair
    uint indexOfPair(uint pc) const
    {
        assert(isStart || isEnd);
        return isStart ? pc + data + length  : pc - data - lengthOfPairedIR(code);
    }
}

static assert(Bytecode.sizeof == 4);

//debugging tool, prints out instruction along with opcodes
@trusted string disassemble(in Bytecode[] irb, uint pc, in NamedGroup[] dict=[])
{
    auto output = appender!string();
    formattedWrite(output,"%s", irb[pc].mnemonic);
    switch(irb[pc].code)
    {
    case IR.Char:
        formattedWrite(output, " %s (0x%x)",cast(dchar)irb[pc].data, irb[pc].data);
        break;
    case IR.OrChar:
        formattedWrite(output, " %s (0x%x) seq=%d", cast(dchar)irb[pc].data, irb[pc].data, irb[pc].sequence);
        break;
    case IR.RepeatStart, IR.InfiniteStart, IR.Option, IR.GotoEndOr, IR.OrStart:
        //forward-jump instructions
        uint len = irb[pc].data;
        formattedWrite(output, " pc=>%u", pc+len+IRL!(IR.RepeatStart));
        break;
    case IR.RepeatEnd, IR.RepeatQEnd: //backward-jump instructions
        uint len = irb[pc].data;
        formattedWrite(output, " pc=>%u min=%u max=%u step=%u",
            pc - len, irb[pc + 3].raw, irb[pc + 4].raw, irb[pc + 2].raw);
        break;
    case IR.InfiniteEnd, IR.InfiniteQEnd, IR.OrEnd: //ditto
        uint len = irb[pc].data;
        formattedWrite(output, " pc=>%u", pc-len);
        break;
    case  IR.LookaheadEnd, IR.NeglookaheadEnd: //ditto
        uint len = irb[pc].data;
        formattedWrite(output, " pc=>%u", pc-len);
        break;
    case IR.GroupStart, IR.GroupEnd:
        uint n = irb[pc].data;
        string name;
        foreach(v;dict)
            if(v.group == n)
            {
                name = "'"~v.name~"'";
                break;
            }
        formattedWrite(output, " %s #%u " ~ (irb[pc].backreference ? "referenced" : ""),
                name, n);
        break;
    case IR.LookaheadStart, IR.NeglookaheadStart, IR.LookbehindStart, IR.NeglookbehindStart:
        uint len = irb[pc].data;
        uint start = irb[pc+1].raw, end = irb[pc+2].raw;
        formattedWrite(output, " pc=>%u [%u..%u]", pc + len + IRL!(IR.LookaheadStart), start, end);
        break;
    case IR.Backref: case IR.CodepointSet: case IR.Trie:
        uint n = irb[pc].data;
        formattedWrite(output, " %u",  n);
        if(irb[pc].code == IR.Backref)
            formattedWrite(output, " %s", irb[pc].localRef ? "local" : "global");
        break;
    default://all data-free instructions
    }
    if(irb[pc].hotspot)
        formattedWrite(output, " Hotspot %u", irb[pc+1].raw);
    return output.data;
}

//disassemble the whole chunk
@trusted void printBytecode()(in Bytecode[] slice, in NamedGroup[] dict=[])
{
    import std.stdio;
    for(uint pc=0; pc<slice.length; pc += slice[pc].length)
        writeln("\t", disassemble(slice, pc, dict));
}

//index entry structure for name --> number of submatch
struct NamedGroup
{
    string name;
    uint group;
}

//holds pair of start-end markers for a submatch
struct Group(DataIndex)
{
    DataIndex begin, end;
    @trusted string toString() const
    {
        auto a = appender!string();
        formattedWrite(a, "%s..%s", begin, end);
        return a.data;
    }
}

@trusted void reverseBytecode()(Bytecode[] code)
{
    Bytecode[] rev = new Bytecode[code.length];
    uint revPc = cast(uint)rev.length;
    Stack!(Tuple!(uint, uint, uint)) stack;
    uint start = 0;
    uint end = cast(uint)code.length;
    for(;;)
    {
        for(uint pc = start; pc < end; )
        {
            uint len = code[pc].length;
            if(code[pc].code == IR.GotoEndOr)
                break; //pick next alternation branch
            if(code[pc].isAtom)
            {
                rev[revPc - len .. revPc] = code[pc .. pc + len];
                revPc -= len;
                pc += len;
            }
            else if(code[pc].isStart || code[pc].isEnd)
            {
                //skip over other embedded lookbehinds they are reversed
                if(code[pc].code == IR.LookbehindStart
                    || code[pc].code == IR.NeglookbehindStart)
                {
                    uint blockLen = len + code[pc].data
                         + code[pc].pairedLength;
                    rev[revPc - blockLen .. revPc] = code[pc .. pc + blockLen];
                    pc += blockLen;
                    revPc -= blockLen;
                    continue;
                }
                uint second = code[pc].indexOfPair(pc);
                uint secLen = code[second].length;
                rev[revPc - secLen .. revPc] = code[second .. second + secLen];
                revPc -= secLen;
                if(code[pc].code == IR.OrStart)
                {
                    //we pass len bytes forward, but secLen in reverse
                    uint revStart = revPc - (second + len - secLen - pc);
                    uint r = revStart;
                    uint i = pc + IRL!(IR.OrStart);
                    while(code[i].code == IR.Option)
                    {
                        if(code[i - 1].code != IR.OrStart)
                        {
                            assert(code[i - 1].code == IR.GotoEndOr);
                            rev[r - 1] = code[i - 1];
                        }
                        rev[r] = code[i];
                        auto newStart = i + IRL!(IR.Option);
                        auto newEnd = newStart + code[i].data;
                        auto newRpc = r + code[i].data + IRL!(IR.Option);
                        if(code[newEnd].code != IR.OrEnd)
                        {
                            newRpc--;
                        }
                        stack.push(tuple(newStart, newEnd, newRpc));
                        r += code[i].data + IRL!(IR.Option);
                        i += code[i].data + IRL!(IR.Option);
                    }
                    pc = i;
                    revPc = revStart;
                    assert(code[pc].code == IR.OrEnd);
                }
                else
                    pc += len;
            }
        }
        if(stack.empty)
            break;
        start = stack.top[0];
        end = stack.top[1];
        revPc = stack.top[2];
        stack.pop();
    }
    code[] = rev[];
}


//Regular expression engine/parser options:
// global - search  all nonoverlapping matches in input
// casefold - case insensitive matching, do casefolding on match in unicode mode
// freeform - ignore whitespace in pattern, to match space use [ ] or \s
// multiline - switch  ^, $ detect start and end of linesinstead of just start and end of input
enum RegexOption: uint {
    global = 0x1,
    casefold = 0x2,
    freeform = 0x4,
    nonunicode = 0x8,
    multiline = 0x10,
    singleline = 0x20
}
//do not reorder this list
alias RegexOptionNames = TypeTuple!('g', 'i', 'x', 'U', 'm', 's');
static assert( RegexOption.max < 0x80);
enum RegexInfo : uint { oneShot = 0x80 }
alias Escapables = TypeTuple!('[', ']', '\\', '^', '$', '.', '|', '?', ',', '-',
    ';', ':', '#', '&', '%', '/', '<', '>', '`',  '*', '+', '(', ')', '{', '}',  '~');

private enum NEL = '\u0085', LS = '\u2028', PS = '\u2029';

//test if a given string starts with hex number of maxDigit that's a valid codepoint
//returns it's value and skips these maxDigit chars on success, throws on failure
dchar parseUniHex(Char)(ref Char[] str, size_t maxDigit)
{
    //std.conv.parse is both @system and bogus
    enforce(str.length >= maxDigit,"incomplete escape sequence");
    uint val;
    for(int k = 0; k < maxDigit; k++)
    {
        auto current = str[k];//accepts ascii only, so it's OK to index directly
        if('0' <= current && current <= '9')
            val = val * 16 + current - '0';
        else if('a' <= current && current <= 'f')
            val = val * 16 + current -'a' + 10;
        else if('A' <= current && current <= 'F')
            val = val * 16 + current - 'A' + 10;
        else
            throw new Exception("invalid escape sequence");
    }
    enforce(val <= 0x10FFFF, "invalid codepoint");
    str = str[maxDigit..$];
    return val;
}

@system unittest //BUG canFind is system
{
    string[] non_hex = [ "000j", "000z", "FffG", "0Z"];
    string[] hex = [ "01", "ff", "00af", "10FFFF" ];
    int[] value = [ 1, 0xFF, 0xAF, 0x10FFFF ];
    foreach(v; non_hex)
        assert(collectException(parseUniHex(v, v.length)).msg
          .canFind("invalid escape sequence"));
    foreach(i, v; hex)
        assert(parseUniHex(v, v.length) == value[i]);
    string over = "0011FFFF";
    assert(collectException(parseUniHex(over, over.length)).msg
      .canFind("invalid codepoint"));
}

//heuristic value determines maximum CodepointSet length suitable for linear search
enum maxCharsetUsed = 6;

enum maxCachedTries = 8;

alias CodepointSetTrie!(13, 8) Trie;
alias codepointSetTrie!(13, 8) makeTrie;

Trie[CodepointSet] trieCache;

//accessor with caching
@trusted Trie getTrie(CodepointSet set)
{// @@@BUG@@@ 6357 almost all properties of AA are not @safe
    if(__ctfe || maxCachedTries == 0)
        return makeTrie(set);
    else
    {
        auto p = set in trieCache;
        if(p)
            return *p;
        if(trieCache.length == maxCachedTries)
        {
            // flush entries in trieCache
            trieCache = null;
        }
        return (trieCache[set] = makeTrie(set));
    }
}

//property for \w character class
@property CodepointSet wordCharacter()
{
    return memoizeExpr!("unicode.Alphabetic | unicode.Mn | unicode.Mc
        | unicode.Me | unicode.Nd | unicode.Pc")();
}

@property Trie wordTrie()
{
    return memoizeExpr!("makeTrie(wordCharacter)")();
}

@trusted auto memoizeExpr(string expr)()
{
    if(__ctfe)
        return mixin(expr);
    alias T = typeof(mixin(expr));
    static T slot;
    static bool initialized;
    if(!initialized)
    {
        slot =  mixin(expr);
        initialized = true;
    }
    return slot;
}

auto caseEnclose(CodepointSet set)
{
    auto cased = set & unicode.LC;
    foreach (dchar ch; cased.byCodepoint)
    {
        foreach(c; simpleCaseFoldings(ch))
            set |= c;
    }
    return set;
}

/+
    fetch codepoint set corresponding to a name (InBlock or binary property)
+/
@trusted CodepointSet getUnicodeSet(in char[] name, bool negated,  bool casefold)
{
    CodepointSet s = unicode(name);
    //FIXME: caseEnclose for new uni as Set | CaseEnclose(SET && LC)
    if(casefold)
       s = caseEnclose(s);
    if(negated)
        s = s.inverted;
    return s;
}

//basic stack, just in case it gets used anywhere else then Parser
@trusted struct Stack(T)
{
    T[] data;
    @property bool empty(){ return data.empty; }

    @property size_t length(){ return data.length; }

    void push(T val){ data ~= val;  }

    T pop()
    {
        assert(!empty);
        auto val = data[$ - 1];
        data = data[0 .. $ - 1];
        if(!__ctfe)
            cast(void)data.assumeSafeAppend();
        return val;
    }

    @property ref T top()
    {
        assert(!empty);
        return data[$ - 1];
    }
}

//safety limits
enum maxGroupNumber = 2^^19;
enum maxLookaroundDepth = 16;
// *Bytecode.sizeof, i.e. 1Mb of bytecode alone
enum maxCompiledLength = 2^^18;
//amounts to up to 4 Mb of auxilary table for matching
enum maxCumulativeRepetitionLength = 2^^20;

alias BasicElementOf(Range) = Unqual!(ElementEncodingType!Range);

struct Parser(R)
    if (isForwardRange!R && is(ElementType!R : dchar))
{
    enum infinite = ~0u;
    dchar _current;
    bool empty;
    R pat, origin;       //keep full pattern for pretty printing error messages
    Bytecode[] ir;       //resulting bytecode
    uint re_flags = 0;   //global flags e.g. multiline + internal ones
    Stack!(uint) fixupStack;  //stack of opened start instructions
    NamedGroup[] dict;   //maps name -> user group number
    //current num of group, group nesting level and repetitions step
    Stack!(uint) groupStack;
    uint nesting = 0;
    uint lookaroundNest = 0;
    uint counterDepth = 0; //current depth of nested counted repetitions
    CodepointSet[] charsets;  //
    const(Trie)[] tries; //
    uint[] backrefed; //bitarray for groups

    @trusted this(S)(R pattern, S flags)
        if(isSomeString!S)
    {
        pat = origin = pattern;
        //reserve slightly more then avg as sampled from unittests
        if(!__ctfe)
            ir.reserve((pat.length*5+2)/4);
        parseFlags(flags);
        _current = ' ';//a safe default for freeform parsing
        next();
        try
        {
            parseRegex();
        }
        catch(Exception e)
        {
            error(e.msg);//also adds pattern location
        }
        put(Bytecode(IR.End, 0));
    }

    //mark referenced groups for latter processing
    void markBackref(uint n)
    {
        if(n/32 >= backrefed.length)
            backrefed.length = n/32 + 1;
        backrefed[n / 32] |= 1 << (n & 31);
    }

    bool isOpenGroup(uint n)
    {
        // walk the fixup stack and see if there are groups labeled 'n'
        // fixup '0' is reserved for alternations
        return fixupStack.data[1..$].
            canFind!(fix => ir[fix].code == IR.GroupStart && ir[fix].data == n)();
    }

    @property dchar current(){ return _current; }

    bool _next()
    {
        if(pat.empty)
        {
            empty =  true;
            return false;
        }
        _current = pat.front;
        pat.popFront();
        return true;
    }

    void skipSpace()
    {
        while(isWhite(current) && _next()){ }
    }

    bool next()
    {
        if(re_flags & RegexOption.freeform)
        {
            bool r = _next();
            skipSpace();
            return r;
        }
        else
            return _next();
    }

    void put(Bytecode code)
    {
        enforce(ir.length < maxCompiledLength,
            "maximum compiled pattern length is exceeded");
        ir ~= code;
    }

    void putRaw(uint number)
    {
        enforce(ir.length < maxCompiledLength,
            "maximum compiled pattern length is exceeded");
        ir ~= Bytecode.fromRaw(number);
    }

    //parsing number with basic overflow check
    uint parseDecimal()
    {
        uint r = 0;
        while(std.ascii.isDigit(current))
        {
            if(r >= (uint.max/10))
                error("Overflow in decimal number");
            r = 10*r + cast(uint)(current-'0');
            if(!next())
                break;
        }
        return r;
    }

    //parse control code of form \cXXX, c assumed to be the current symbol
    dchar parseControlCode()
    {
        enforce(next(), "Unfinished escape sequence");
        enforce(('a' <= current && current <= 'z') || ('A' <= current && current <= 'Z'),
            "Only letters are allowed after \\c");
        return current & 0x1f;
    }

    //
    @trusted void parseFlags(S)(S flags)
    {//@@@BUG@@@ text is @system
        foreach(ch; flags)//flags are ASCII anyway
        {
        L_FlagSwitch:
            switch(ch)
            {

                foreach(i, op; __traits(allMembers, RegexOption))
                {
                    case RegexOptionNames[i]:
                            if(re_flags & mixin("RegexOption."~op))
                                throw new RegexException(text("redundant flag specified: ",ch));
                            re_flags |= mixin("RegexOption."~op);
                            break L_FlagSwitch;
                }
                default:
                    throw new RegexException(text("unknown regex flag '",ch,"'"));
            }
        }
    }

    //parse and store IR for regex pattern
    @trusted void parseRegex()
    {
        fixupStack.push(0);
        groupStack.push(1);//0 - whole match
        auto maxCounterDepth = counterDepth;
        uint fix;//fixup pointer

        while(!empty)
        {
            debug(std_regex_parser)
                writeln("*LR*\nSource: ", pat, "\nStack: ",fixupStack.stack.data);
            switch(current)
            {
            case '(':
                next();
                nesting++;
                uint nglob;
                fixupStack.push(cast(uint)ir.length);
                if(current == '?')
                {
                    next();
                    switch(current)
                    {
                    case ':':
                        put(Bytecode(IR.Nop, 0));
                        next();
                        break;
                    case '=':
                        genLookaround(IR.LookaheadStart);
                        next();
                        break;
                    case '!':
                        genLookaround(IR.NeglookaheadStart);
                        next();
                        break;
                    case 'P':
                        next();
                        if(current != '<')
                            error("Expected '<' in named group");
                        string name;
                        if(!next() || !(isAlpha(current) || current == '_'))
                            error("Expected alpha starting a named group");
                        name ~= current;
                        while(next() && (isAlpha(current) ||
                            current == '_' || std.ascii.isDigit(current)))
                        {
                            name ~= current;
                        }
                        if(current != '>')
                            error("Expected '>' closing named group");
                        next();
                        nglob = groupStack.top++;
                        enforce(groupStack.top <= maxGroupNumber, "limit on submatches is exceeded");
                        auto t = NamedGroup(name, nglob);
                        auto d = assumeSorted!"a.name < b.name"(dict);
                        auto ind = d.lowerBound(t).length;
                        insertInPlace(dict, ind, t);
                        put(Bytecode(IR.GroupStart, nglob));
                        break;
                    case '<':
                        next();
                        if(current == '=')
                            genLookaround(IR.LookbehindStart);
                        else if(current == '!')
                            genLookaround(IR.NeglookbehindStart);
                        else
                            error("'!' or '=' expected after '<'");
                        next();
                        break;
                    default:
                        error(" ':', '=', '<', 'P' or '!' expected after '(?' ");
                    }
                }
                else
                {
                    nglob = groupStack.top++;
                    enforce(groupStack.top <= maxGroupNumber, "limit on number of submatches is exceeded");
                    put(Bytecode(IR.GroupStart, nglob));
                }
                break;
            case ')':
                enforce(nesting, "Unmatched ')'");
                nesting--;
                next();
                fix = fixupStack.pop();
                switch(ir[fix].code)
                {
                case IR.GroupStart:
                    put(Bytecode(IR.GroupEnd,ir[fix].data));
                    parseQuantifier(fix);
                    break;
                case IR.LookaheadStart, IR.NeglookaheadStart, IR.LookbehindStart, IR.NeglookbehindStart:
                    assert(lookaroundNest);
                    fixLookaround(fix);
                    lookaroundNest--;
                    break;
                case IR.Option: //| xxx )
                    //two fixups: last option + full OR
                    finishAlternation(fix);
                    fix = fixupStack.top;
                    switch(ir[fix].code)
                    {
                    case IR.GroupStart:
                        fixupStack.pop();
                        put(Bytecode(IR.GroupEnd,ir[fix].data));
                        parseQuantifier(fix);
                        break;
                    case IR.LookaheadStart, IR.NeglookaheadStart, IR.LookbehindStart, IR.NeglookbehindStart:
                        assert(lookaroundNest);
                        lookaroundNest--;
                        fix = fixupStack.pop();
                        fixLookaround(fix);
                        break;
                    default://(?:xxx)
                        fixupStack.pop();
                        parseQuantifier(fix);
                    }
                    break;
                default://(?:xxx)
                    parseQuantifier(fix);
                }
                break;
            case '|':
                next();
                fix = fixupStack.top;
                if(ir.length > fix && ir[fix].code == IR.Option)
                {
                    ir[fix] = Bytecode(ir[fix].code, cast(uint)ir.length - fix);
                    put(Bytecode(IR.GotoEndOr, 0));
                    fixupStack.top = cast(uint)ir.length; //replace latest fixup for Option
                    put(Bytecode(IR.Option, 0));
                    break;
                }
                uint len, orStart;
                //start a new option
                if(fixupStack.length == 1)
                {//only root entry, effectively no fixup
                    len = cast(uint)ir.length + IRL!(IR.GotoEndOr);
                    orStart = 0;
                }
                else
                {//IR.lookahead, etc. fixups that have length > 1, thus check ir[x].length
                    len = cast(uint)ir.length - fix - (ir[fix].length - 1);
                    orStart = fix + ir[fix].length;
                }
                insertInPlace(ir, orStart, Bytecode(IR.OrStart, 0), Bytecode(IR.Option, len));
                assert(ir[orStart].code == IR.OrStart);
                put(Bytecode(IR.GotoEndOr, 0));
                fixupStack.push(orStart); //fixup for StartOR
                fixupStack.push(cast(uint)ir.length); //for second Option
                put(Bytecode(IR.Option, 0));
                break;
            default://no groups or whatever
                uint start = cast(uint)ir.length;
                parseAtom();
                parseQuantifier(start);
            }
        }

        if(fixupStack.length != 1)
        {
            fix = fixupStack.pop();
            enforce(ir[fix].code == IR.Option, "no matching ')'");
            finishAlternation(fix);
            enforce(fixupStack.length == 1, "no matching ')'");
        }
    }

    //helper function, finalizes IR.Option, fix points to the first option of sequence
    void finishAlternation(uint fix)
    {
        enforce(ir[fix].code == IR.Option, "no matching ')'");
        ir[fix] = Bytecode(ir[fix].code, cast(uint)ir.length - fix - IRL!(IR.OrStart));
        fix = fixupStack.pop();
        enforce(ir[fix].code == IR.OrStart, "no matching ')'");
        ir[fix] = Bytecode(IR.OrStart, cast(uint)ir.length - fix - IRL!(IR.OrStart));
        put(Bytecode(IR.OrEnd, cast(uint)ir.length - fix - IRL!(IR.OrStart)));
        uint pc = fix + IRL!(IR.OrStart);
        while(ir[pc].code == IR.Option)
        {
            pc = pc + ir[pc].data;
            if(ir[pc].code != IR.GotoEndOr)
                break;
            ir[pc] = Bytecode(IR.GotoEndOr, cast(uint)(ir.length - pc - IRL!(IR.OrEnd)));
            pc += IRL!(IR.GotoEndOr);
        }
        put(Bytecode.fromRaw(0));
    }

    //parse and store IR for atom-quantifier pair
    @trusted void parseQuantifier(uint offset)
    {//copy is @system
        uint replace = ir[offset].code == IR.Nop;
        if(empty && !replace)
            return;
        uint min, max;
        switch(current)
        {
        case '*':
            min = 0;
            max = infinite;
            break;
        case '?':
            min = 0;
            max = 1;
            break;
        case '+':
            min = 1;
            max = infinite;
            break;
        case '{':
            enforce(next(), "Unexpected end of regex pattern");
            enforce(std.ascii.isDigit(current), "First number required in repetition");
            min = parseDecimal();
            if(current == '}')
                max = min;
            else if(current == ',')
            {
                next();
                if(std.ascii.isDigit(current))
                    max = parseDecimal();
                else if(current == '}')
                    max = infinite;
                else
                    error("Unexpected symbol in regex pattern");
                skipSpace();
                if(current != '}')
                    error("Unmatched '{' in regex pattern");
            }
            else
                error("Unexpected symbol in regex pattern");
            if(min > max)
                error("Illegal {n,m} quantifier");
            break;
        default:
            if(replace)
            {
                copy(ir[offset + 1 .. $], ir[offset .. $ - 1]);
                ir.length -= 1;
            }
            return;
        }
        uint len = cast(uint)ir.length - offset - replace;
        bool greedy = true;
        //check only if we managed to get new symbol
        if(next() && current == '?')
        {
            greedy = false;
            next();
        }
        if(max != infinite)
        {
            if(min != 1 || max != 1)
            {
                Bytecode op = Bytecode(greedy ? IR.RepeatStart : IR.RepeatQStart, len);
                if(replace)
                    ir[offset] = op;
                else
                    insertInPlace(ir, offset, op);
                put(Bytecode(greedy ? IR.RepeatEnd : IR.RepeatQEnd, len));
                put(Bytecode.init); //hotspot
                putRaw(1);
                putRaw(min);
                putRaw(max);
                counterDepth = std.algorithm.max(counterDepth, nesting+1);
            }
        }
        else if(min) //&& max is infinite
        {
            if(min != 1)
            {
                Bytecode op = Bytecode(greedy ? IR.RepeatStart : IR.RepeatQStart, len);
                if(replace)
                    ir[offset] = op;
                else
                    insertInPlace(ir, offset, op);
                offset += 1;//so it still points to the repeated block
                put(Bytecode(greedy ? IR.RepeatEnd : IR.RepeatQEnd, len));
                put(Bytecode.init); //hotspot
                putRaw(1);
                putRaw(min);
                putRaw(min);
                counterDepth = std.algorithm.max(counterDepth, nesting+1);
            }
            else if(replace)
            {
                copy(ir[offset+1 .. $], ir[offset .. $-1]);
                ir.length -= 1;
            }
            put(Bytecode(greedy ? IR.InfiniteStart : IR.InfiniteQStart, len));
            enforce(ir.length + len < maxCompiledLength,  "maximum compiled pattern length is exceeded");
            ir ~= ir[offset .. offset+len];
            //IR.InfinteX is always a hotspot
            put(Bytecode(greedy ? IR.InfiniteEnd : IR.InfiniteQEnd, len));
            put(Bytecode.init); //merge index
        }
        else//vanila {0,inf}
        {
            Bytecode op = Bytecode(greedy ? IR.InfiniteStart : IR.InfiniteQStart, len);
            if(replace)
                ir[offset] = op;
            else
                insertInPlace(ir, offset, op);
            //IR.InfinteX is always a hotspot
            put(Bytecode(greedy ? IR.InfiniteEnd : IR.InfiniteQEnd, len));
            put(Bytecode.init); //merge index

        }
    }

    //parse and store IR for atom
    void parseAtom()
    {
        if(empty)
            return;
        switch(current)
        {
        case '*', '?', '+', '|', '{', '}':
            error("'*', '+', '?', '{', '}' not allowed in atom");
            break;
        case '.':
            put(Bytecode(IR.Any, 0));
            next();
            break;
        case '[':
            parseCharset();
            break;
        case '\\':
            enforce(_next(), "Unfinished escape sequence");
            parseEscape();
            break;
        case '^':
            put(Bytecode(IR.Bol, 0));
            next();
            break;
        case '$':
            put(Bytecode(IR.Eol, 0));
            next();
            break;
        default:
            //FIXME: getCommonCasing in new std uni
            if(re_flags & RegexOption.casefold)
            {
                auto range = simpleCaseFoldings(current);
                assert(range.length <= 5);
                if(range.length == 1)
                    put(Bytecode(IR.Char, range.front));
                else
                    foreach(v; range)
                        put(Bytecode(IR.OrChar, v, cast(uint)range.length));
            }
            else
                put(Bytecode(IR.Char, current));
            next();
        }
    }

    //generate code for start of lookaround: (?= (?! (?<= (?<!
    void genLookaround(IR opcode)
    {
        put(Bytecode(opcode, 0));
        put(Bytecode.fromRaw(0));
        put(Bytecode.fromRaw(0));
        groupStack.push(0);
        lookaroundNest++;
        enforce(lookaroundNest <= maxLookaroundDepth,
            "maximum lookaround depth is exceeded");
    }

    //fixup lookaround with start at offset fix and append a proper *-End opcode
    void fixLookaround(uint fix)
    {
        ir[fix] = Bytecode(ir[fix].code,
            cast(uint)ir.length - fix - IRL!(IR.LookaheadStart));
        auto g = groupStack.pop();
        assert(!groupStack.empty);
        ir[fix+1] = Bytecode.fromRaw(groupStack.top);
        //groups are cumulative across lookarounds
        ir[fix+2] = Bytecode.fromRaw(groupStack.top+g);
        groupStack.top += g;
        if(ir[fix].code == IR.LookbehindStart || ir[fix].code == IR.NeglookbehindStart)
        {
            reverseBytecode(ir[fix + IRL!(IR.LookbehindStart) .. $]);
    }
        put(ir[fix].paired);
    }

    //CodepointSet operations relatively in order of priority
    enum Operator:uint {
        Open = 0, Negate,  Difference, SymDifference, Intersection, Union, None
    }

    //parse unit of CodepointSet spec, most notably escape sequences and char ranges
    //also fetches next set operation
    Tuple!(CodepointSet,Operator) parseCharTerm()
    {
        enum State{ Start, Char, Escape, CharDash, CharDashEscape,
            PotentialTwinSymbolOperator }
        Operator op = Operator.None;
        dchar last;
        CodepointSet set;
        State state = State.Start;

        static void addWithFlags(ref CodepointSet set, uint ch, uint re_flags)
        {
            if(re_flags & RegexOption.casefold)
            {
                auto range = simpleCaseFoldings(ch);
                foreach(v; range)
                    set |= v;
            }
            else
                set |= ch;
        }

        static Operator twinSymbolOperator(dchar symbol)
        {
            switch(symbol)
            {
            case '|':
                return Operator.Union;
            case '-':
                return Operator.Difference;
            case '~':
                return Operator.SymDifference;
            case '&':
                return Operator.Intersection;
            default:
                assert(false);
            }
        }

        L_CharTermLoop:
        for(;;)
        {
            final switch(state)
            {
            case State.Start:
                switch(current)
                {
                case '|':
                case '-':
                case '~':
                case '&':
                    state = State.PotentialTwinSymbolOperator;
                    last = current;
                    break;
                case '[':
                    op = Operator.Union;
                    goto case;
                case ']':
                    break L_CharTermLoop;
                case '\\':
                    state = State.Escape;
                    break;
                default:
                    state = State.Char;
                    last = current;
                }
                break;
            case State.Char:
                // xxx last current xxx
                switch(current)
                {
                case '|':
                case '~':
                case '&':
                    // then last is treated as normal char and added as implicit union
                    state = State.PotentialTwinSymbolOperator;
                    addWithFlags(set, last, re_flags);
                    last = current;
                    break;
                case '-': // still need more info
                    state = State.CharDash;
                    break;
                case '\\':
                    set |= last;
                    state = State.Escape;
                    break;
                case '[':
                    op = Operator.Union;
                    goto case;
                case ']':
                    set |= last;
                    break L_CharTermLoop;
                default:
                    addWithFlags(set, last, re_flags);
                    last = current;
                }
                break;
            case State.PotentialTwinSymbolOperator:
                // xxx last current xxxx
                // where last = [|-&~]
                if(current == last)
                {
                    op = twinSymbolOperator(last);
                    next();//skip second twin char
                    break L_CharTermLoop;
                }
                //~~~WORKAROUND~~~
                //It's a copy of State.Char, should be goto case but see @@@BUG12603
                switch(current)
                {
                case '|':
                case '~':
                case '&':
                    // then last is treated as normal char and added as implicit union
                    state = State.PotentialTwinSymbolOperator;
                    addWithFlags(set, last, re_flags);
                    last = current;
                    break;
                case '-': // still need more info
                    state = State.CharDash;
                    break;
                case '\\':
                    set |= last;
                    state = State.Escape;
                    break;
                case '[':
                    op = Operator.Union;
                    goto case;
                case ']':
                    set |= last;
                    break L_CharTermLoop;
                default:
                    addWithFlags(set, last, re_flags);
                    state = State.Char;
                    last = current;
                }
                break;
                //~~~END OF WORKAROUND~~~
                //goto case State.Char;// it's not a twin lets re-run normal logic
            case State.Escape:
                // xxx \ current xxx
                switch(current)
                {
                case 'f':
                    last = '\f';
                    state = State.Char;
                    break;
                case 'n':
                    last = '\n';
                    state = State.Char;
                    break;
                case 'r':
                    last = '\r';
                    state = State.Char;
                    break;
                case 't':
                    last = '\t';
                    state = State.Char;
                    break;
                case 'v':
                    last = '\v';
                    state = State.Char;
                    break;
                case 'c':
                    last = parseControlCode();
                    state = State.Char;
                    break;
                foreach(val; Escapables)
                {
                case val:
                }
                    last = current;
                    state = State.Char;
                    break;
                case 'p':
                    set.add(parseUnicodePropertySpec(false));
                    state = State.Start;
                    continue L_CharTermLoop; //next char already fetched
                case 'P':
                    set.add(parseUnicodePropertySpec(true));
                    state = State.Start;
                    continue L_CharTermLoop; //next char already fetched
                case 'x':
                    last = parseUniHex(pat, 2);
                    state = State.Char;
                    break;
                case 'u':
                    last = parseUniHex(pat, 4);
                    state = State.Char;
                    break;
                case 'U':
                    last = parseUniHex(pat, 8);
                    state = State.Char;
                    break;
                case 'd':
                    set.add(unicode.Nd);
                    state = State.Start;
                    break;
                case 'D':
                    set.add(unicode.Nd.inverted);
                    state = State.Start;
                    break;
                case 's':
                    set.add(unicode.White_Space);
                    state = State.Start;
                    break;
                case 'S':
                    set.add(unicode.White_Space.inverted);
                    state = State.Start;
                    break;
                case 'w':
                    set.add(wordCharacter);
                    state = State.Start;
                    break;
                case 'W':
                    set.add(wordCharacter.inverted);
                    state = State.Start;
                    break;
                default:
                    enforce(false, "invalid escape sequence");
                }
                break;
            case State.CharDash:
                // xxx last - current xxx
                switch(current)
                {
                case '[':
                    op = Operator.Union;
                    goto case;
                case ']':
                    //means dash is a single char not an interval specifier
                    addWithFlags(set, last, re_flags);
                    addWithFlags(set, '-', re_flags);
                    break L_CharTermLoop;
                 case '-'://set Difference again
                    addWithFlags(set, last, re_flags);
                    op = Operator.Difference;
                    next();//skip '-'
                    break L_CharTermLoop;
                case '\\':
                    state = State.CharDashEscape;
                    break;
                default:
                    enforce(last <= current, "inverted range");
                    if(re_flags & RegexOption.casefold)
                    {
                        for(uint ch = last; ch <= current; ch++)
                            addWithFlags(set, ch, re_flags);
                    }
                    else
                        set.add(last, current + 1);
                    state = State.Start;
                }
                break;
            case State.CharDashEscape:
            //xxx last - \ current xxx
                uint end;
                switch(current)
                {
                case 'f':
                    end = '\f';
                    break;
                case 'n':
                    end = '\n';
                    break;
                case 'r':
                    end = '\r';
                    break;
                case 't':
                    end = '\t';
                    break;
                case 'v':
                    end = '\v';
                    break;
                foreach(val; Escapables)
                {
                case val:
                }
                    end = current;
                    break;
                case 'c':
                    end = parseControlCode();
                    break;
                case 'x':
                    end = parseUniHex(pat, 2);
                    break;
                case 'u':
                    end = parseUniHex(pat, 4);
                    break;
                case 'U':
                    end = parseUniHex(pat, 8);
                    break;
                default:
                    error("invalid escape sequence");
                }
                enforce(last <= end,"inverted range");
                set.add(last, end + 1);
                state = State.Start;
                break;
            }
            enforce(next(), "unexpected end of CodepointSet");
        }
        return tuple(set, op);
    }

    alias ValStack = Stack!(CodepointSet);
    alias OpStack = Stack!(Operator);

    //parse and store IR for CodepointSet
    void parseCharset()
    {
        ValStack vstack;
        OpStack opstack;
        //
        static bool apply(Operator op, ref ValStack stack)
        {
            switch(op)
            {
            case Operator.Negate:
                stack.top = stack.top.inverted;
                break;
            case Operator.Union:
                auto s = stack.pop();//2nd operand
                enforce(!stack.empty, "no operand for '||'");
                stack.top.add(s);
                break;
            case Operator.Difference:
                auto s = stack.pop();//2nd operand
                enforce(!stack.empty, "no operand for '--'");
                stack.top.sub(s);
                break;
            case Operator.SymDifference:
                auto s = stack.pop();//2nd operand
                enforce(!stack.empty, "no operand for '~~'");
                stack.top ~= s;
                break;
            case Operator.Intersection:
                auto s = stack.pop();//2nd operand
                enforce(!stack.empty, "no operand for '&&'");
                stack.top.intersect(s);
                break;
            default:
                return false;
            }
            return true;
        }
        static bool unrollWhile(alias cond)(ref ValStack vstack, ref OpStack opstack)
        {
            while(cond(opstack.top))
            {
                if(!apply(opstack.pop(),vstack))
                    return false;//syntax error
                if(opstack.empty)
                    return false;
            }
            return true;
        }

        L_CharsetLoop:
        do
        {
            switch(current)
            {
            case '[':
                opstack.push(Operator.Open);
                enforce(next(), "unexpected end of character class");
                if(current == '^')
                {
                    opstack.push(Operator.Negate);
                    enforce(next(), "unexpected end of character class");
                }
                //[] is prohibited
                enforce(current != ']', "wrong character class");
                goto default;
            case ']':
                enforce(unrollWhile!(unaryFun!"a != a.Open")(vstack, opstack),
                    "character class syntax error");
                enforce(!opstack.empty, "unmatched ']'");
                opstack.pop();
                next();
                if(opstack.empty)
                    break L_CharsetLoop;
                auto pair  = parseCharTerm();
                if(!pair[0].empty)//not only operator e.g. -- or ~~
                {
                    vstack.top.add(pair[0]);//apply union
                }
                if(pair[1] != Operator.None)
                {
                    if(opstack.top == Operator.Union)
                        unrollWhile!(unaryFun!"a == a.Union")(vstack, opstack);
                    opstack.push(pair[1]);
                }
                break;
            //
            default://yet another pair of term(op)?
                auto pair = parseCharTerm();
                if(pair[1] != Operator.None)
                {
                    if(opstack.top == Operator.Union)
                        unrollWhile!(unaryFun!"a == a.Union")(vstack, opstack);
                    opstack.push(pair[1]);
                }
                vstack.push(pair[0]);
            }

        }while(!empty || !opstack.empty);
        while(!opstack.empty)
            apply(opstack.pop(),vstack);
        assert(vstack.length == 1);
        charsetToIr(vstack.top);
    }
    //try to generate optimal IR code for this CodepointSet
    @trusted void charsetToIr(CodepointSet set)
    {//@@@BUG@@@ writeln is @system
        uint chars = cast(uint)set.length;
        if(chars < Bytecode.maxSequence)
        {
            switch(chars)
            {
                case 1:
                    put(Bytecode(IR.Char, set.byCodepoint.front));
                    break;
                case 0:
                    error("empty CodepointSet not allowed");
                    break;
                default:
                    foreach(ch; set.byCodepoint)
                        put(Bytecode(IR.OrChar, ch, chars));
            }
        }
        else
        {
            import std.algorithm : countUntil;
            auto ivals = set.byInterval;
            auto n = charsets.countUntil(set);
            if(n >= 0)
            {
                if(ivals.length*2 > maxCharsetUsed)
                    put(Bytecode(IR.Trie, cast(uint)n));
                else
                    put(Bytecode(IR.CodepointSet, cast(uint)n));
                return;
            }
            if(ivals.length*2 > maxCharsetUsed)
            {
                auto t  = getTrie(set);
                put(Bytecode(IR.Trie, cast(uint)tries.length));
                tries ~= t;
                debug(std_regex_allocation) writeln("Trie generated");
            }
            else
            {
                put(Bytecode(IR.CodepointSet, cast(uint)charsets.length));
                tries ~= Trie.init;
            }
            charsets ~= set;
            assert(charsets.length == tries.length);
        }
    }

    //parse and generate IR for escape stand alone escape sequence
    @trusted void parseEscape()
    {//accesses array of appender

        switch(current)
        {
        case 'f':   next(); put(Bytecode(IR.Char, '\f')); break;
        case 'n':   next(); put(Bytecode(IR.Char, '\n')); break;
        case 'r':   next(); put(Bytecode(IR.Char, '\r')); break;
        case 't':   next(); put(Bytecode(IR.Char, '\t')); break;
        case 'v':   next(); put(Bytecode(IR.Char, '\v')); break;

        case 'd':
            next();
            charsetToIr(unicode.Nd);
            break;
        case 'D':
            next();
            charsetToIr(unicode.Nd.inverted);
            break;
        case 'b':   next(); put(Bytecode(IR.Wordboundary, 0)); break;
        case 'B':   next(); put(Bytecode(IR.Notwordboundary, 0)); break;
        case 's':
            next();
            charsetToIr(unicode.White_Space);
            break;
        case 'S':
            next();
            charsetToIr(unicode.White_Space.inverted);
            break;
        case 'w':
            next();
            charsetToIr(wordCharacter);
            break;
        case 'W':
            next();
            charsetToIr(wordCharacter.inverted);
            break;
        case 'p': case 'P':
            auto CodepointSet = parseUnicodePropertySpec(current == 'P');
            charsetToIr(CodepointSet);
            break;
        case 'x':
            uint code = parseUniHex(pat, 2);
            next();
            put(Bytecode(IR.Char,code));
            break;
        case 'u': case 'U':
            uint code = parseUniHex(pat, current == 'u' ? 4 : 8);
            next();
            put(Bytecode(IR.Char, code));
            break;
        case 'c': //control codes
            Bytecode code = Bytecode(IR.Char, parseControlCode());
            next();
            put(code);
            break;
        case '0':
            next();
            put(Bytecode(IR.Char, 0));//NUL character
            break;
        case '1': .. case '9':
            uint nref = cast(uint)current - '0';
            uint maxBackref = sum(groupStack.data);
            enforce(nref < maxBackref, "Backref to unseen group");
            //perl's disambiguation rule i.e.
            //get next digit only if there is such group number
            while(nref < maxBackref && next() && std.ascii.isDigit(current))
            {
                nref = nref * 10 + current - '0';
            }
            if(nref >= maxBackref)
                nref /= 10;
            enforce(!isOpenGroup(nref), "Backref to open group");
            uint localLimit = maxBackref - groupStack.top;
            if(nref >= localLimit)
            {
                put(Bytecode(IR.Backref, nref-localLimit));
                ir[$-1].setLocalRef();
            }
            else
                put(Bytecode(IR.Backref, nref));
            markBackref(nref);
            break;
        default:
            auto op = Bytecode(IR.Char, current);
            next();
            put(op);
        }
    }

    //parse and return a CodepointSet for \p{...Property...} and \P{...Property..},
    //\ - assumed to be processed, p - is current
    CodepointSet parseUnicodePropertySpec(bool negated)
    {
        enum MAX_PROPERTY = 128;
        char[MAX_PROPERTY] result;
        uint k = 0;
        enforce(next());
        if(current == '{')
        {
            while(k < MAX_PROPERTY && next() && current !='}' && current !=':')
                if(current != '-' && current != ' ' && current != '_')
                    result[k++] = cast(char)std.ascii.toLower(current);
            enforce(k != MAX_PROPERTY, "invalid property name");
            enforce(current == '}', "} expected ");
        }
        else
        {//single char properties e.g.: \pL, \pN ...
            enforce(current < 0x80, "invalid property name");
            result[k++] = cast(char)current;
        }
        auto s = getUnicodeSet(result[0..k], negated,
            cast(bool)(re_flags & RegexOption.casefold));
        enforce(!s.empty, "unrecognized unicode property spec");
        next();
        return s;
    }

    //
    @trusted void error(string msg)
    {
        auto app = appender!string();
        ir = null;
        formattedWrite(app, "%s\nPattern with error: `%s` <--HERE-- `%s`",
                       msg, origin[0..$-pat.length], pat);
        throw new RegexException(app.data);
    }

    alias Char = BasicElementOf!R;
    //packages parsing results into a RegEx object
    @property Regex!Char program()
    {
        return Regex!Char(this);
    }
}


/++
    $(D Regex) object holds regular expression pattern in compiled form.
    Instances of this object are constructed via calls to $(D regex).
    This is an intended form for caching and storage of frequently
    used regular expressions.
+/
public struct Regex(Char)
{
    //temporary workaround for identifier lookup
    CodepointSet[] charsets; //
    Bytecode[] ir;      //compiled bytecode of pattern

    /++
        Test if this object doesn't contain any compiled pattern.
        Example:
        ---
        Regex!char r;
        assert(r.empty);
        r = regex(""); // Note: "" is a valid regex pattern.
        assert(!r.empty);
        ---
    +/
    @safe @property bool empty() const nothrow {  return ir is null; }

    /++
        A range of all the named captures in the regex.
        Example:
        ----
        import std.range;
        import std.algorithm;

        auto re = regex(`(?P<name>\w+) = (?P<var>\d+)`);
        auto nc = re.namedCaptures;
        static assert(isRandomAccessRange!(typeof(nc)));
        assert(!nc.empty);
        assert(nc.length == 2);
        assert(nc.equal(["name", "var"]));
        assert(nc[0] == "name");
        assert(nc[1..$].equal(["var"]));
        ----
     +/
    @safe @property auto namedCaptures()
    {
        static struct NamedGroupRange
        {
        private:
            NamedGroup[] groups;
            size_t start;
            size_t end;
        public:
            this(NamedGroup[] g, size_t s, size_t e)
            {
                assert(s <= e);
                assert(e <= g.length);
                groups = g;
                start = s;
                end = e;
            }

            @property string front() { return groups[start].name; }
            @property string back() { return groups[end-1].name; }
            @property bool empty() { return start >= end; }
            @property size_t length() { return end - start; }
            alias opDollar = length;
            @property NamedGroupRange save()
            {
                return NamedGroupRange(groups, start, end);
            }
            void popFront() { assert(!empty); start++; }
            void popBack() { assert(!empty); end--; }
            string opIndex()(size_t i)
            {
                assert(start + i < end,
                       "Requested named group is out of range.");
                return groups[start+i].name;
            }
            NamedGroupRange opSlice(size_t low, size_t high) {
                assert(low <= high);
                assert(start + high <= end);
                return NamedGroupRange(groups, start + low, start + high);
            }
            NamedGroupRange opSlice() { return this.save; }
        }
        return NamedGroupRange(dict, 0, dict.length);
    }

private:
    NamedGroup[] dict;  //maps name -> user group number
    uint ngroup;        //number of internal groups
    uint maxCounterDepth; //max depth of nested {n,m} repetitions
    uint hotspotTableSize; //number of entries in merge table
    uint threadCount;
    uint flags;         //global regex flags
    public const(Trie)[]  tries; //
    uint[] backrefed; //bit array of backreferenced submatches
    Kickstart!Char kickstart;

    //bit access helper
    uint isBackref(uint n)
    {
        if(n/32 >= backrefed.length)
            return 0;
        return backrefed[n / 32] & (1 << (n & 31));
    }

    //check if searching is not needed
    void checkIfOneShot()
    {
        if(flags & RegexOption.multiline)
            return;
    L_CheckLoop:
        for(uint i = 0; i < ir.length; i += ir[i].length)
        {
            switch(ir[i].code)
            {
                case IR.Bol:
                    flags |= RegexInfo.oneShot;
                    break L_CheckLoop;
                case IR.GroupStart, IR.GroupEnd, IR.Eol, IR.Wordboundary, IR.Notwordboundary:
                    break;
                default:
                    break L_CheckLoop;
            }
        }
    }

    /+
        lightweight post process step,
        only essentials
    +/
    @trusted void lightPostprocess()
    {//@@@BUG@@@ write is @system
        struct FixedStack(T)
        {
            T[] arr;
            uint _top;
            //this(T[] storage){   arr = storage; _top = -1; }
            @property ref T top(){  assert(!empty); return arr[_top]; }
            void push(T x){  arr[++_top] = x; }
            T pop() { assert(!empty);   return arr[_top--]; }
            @property bool empty(){   return _top == -1; }
        }
        auto counterRange = FixedStack!uint(new uint[maxCounterDepth+1], -1);
        counterRange.push(1);
        ulong cumRange = 0;
        for(uint i = 0; i < ir.length; i += ir[i].length)
        {
            if(ir[i].hotspot)
            {
                assert(i + 1 < ir.length,
                    "unexpected end of IR while looking for hotspot");
                ir[i+1] = Bytecode.fromRaw(hotspotTableSize);
                hotspotTableSize += counterRange.top;
            }
            switch(ir[i].code)
            {
            case IR.RepeatStart, IR.RepeatQStart:
                uint repEnd = cast(uint)(i + ir[i].data + IRL!(IR.RepeatStart));
                assert(ir[repEnd].code == ir[i].paired.code);
                uint max = ir[repEnd + 4].raw;
                ir[repEnd+2].raw = counterRange.top;
                ir[repEnd+3].raw *= counterRange.top;
                ir[repEnd+4].raw *= counterRange.top;
                ulong cntRange = cast(ulong)(max)*counterRange.top;
                cumRange += cntRange;
                enforce(cumRange < maxCumulativeRepetitionLength,
                    "repetition length limit is exceeded");
                counterRange.push(cast(uint)cntRange + counterRange.top);
                threadCount += counterRange.top;
                break;
            case IR.RepeatEnd, IR.RepeatQEnd:
                threadCount += counterRange.top;
                counterRange.pop();
                break;
            case IR.GroupStart:
                if(isBackref(ir[i].data))
                    ir[i].setBackrefence();
                threadCount += counterRange.top;
                break;
            case IR.GroupEnd:
                if(isBackref(ir[i].data))
                    ir[i].setBackrefence();
                threadCount += counterRange.top;
                break;
            default:
                threadCount += counterRange.top;
            }
        }
        checkIfOneShot();
        if(!(flags & RegexInfo.oneShot))
            kickstart = Kickstart!Char(this, new uint[](256));
        debug(std_regex_allocation) writefln("IR processed, max threads: %d", threadCount);
    }

    //IR code validator - proper nesting, illegal instructions, etc.
    @trusted void validate()
    {//@@@BUG@@@ text is @system
        for(uint pc = 0; pc < ir.length; pc += ir[pc].length)
        {
            if(ir[pc].isStart || ir[pc].isEnd)
            {
                uint dest = ir[pc].indexOfPair(pc);
                assert(dest < ir.length, text("Wrong length in opcode at pc=",
                    pc, " ", dest, " vs ", ir.length));
                assert(ir[dest].paired ==  ir[pc],
                    text("Wrong pairing of opcodes at pc=", pc, "and pc=", dest));
            }
            else if(ir[pc].isAtom)
            {

            }
            else
               assert(0, text("Unknown type of instruction at pc=", pc));
        }
    }

    //print out disassembly a program's IR
    @trusted debug(std_regex_parser) void print() const
    {//@@@BUG@@@ write is system
        for(uint i = 0; i < ir.length; i += ir[i].length)
        {
            writefln("%d\t%s ", i, disassemble(ir, i, dict));
        }
        writeln("Total merge table size: ", hotspotTableSize);
        writeln("Max counter nesting depth: ", maxCounterDepth);
    }

    //
    this(S)(Parser!(S) p)
    {
        ir = p.ir;
        dict = p.dict;
        ngroup = p.groupStack.top;
        maxCounterDepth = p.counterDepth;
        flags = p.re_flags;
        charsets = p.charsets;
        tries = p.tries;
        backrefed = p.backrefed;
        lightPostprocess();
        debug(std_regex_parser)
        {
            print();
        }
        version(assert) validate();
    }
}

unittest
{
    auto re = regex(`(?P<name>\w+) = (?P<var>\d+)`);
    auto nc = re.namedCaptures;
    static assert(isRandomAccessRange!(typeof(nc)));
    assert(!nc.empty);
    assert(nc.length == 2);
    assert(nc.equal(["name", "var"]));
    assert(nc[0] == "name");
    assert(nc[1..$].equal(["var"]));

    re = regex(`(\w+) (?P<named>\w+) (\w+)`);
    nc = re.namedCaptures;
    assert(nc.length == 1);
    assert(nc[0] == "named");
    assert(nc.front == "named");
    assert(nc.back == "named");

    re = regex(`(\w+) (\w+)`);
    nc = re.namedCaptures;
    assert(nc.empty);

    re = regex(`(?P<year>\d{4})/(?P<month>\d{2})/(?P<day>\d{2})/`);
    nc = re.namedCaptures;
    auto cp = nc.save;
    assert(nc.equal(cp));
    nc.popFront();
    assert(nc.equal(cp[1..$]));
    nc.popBack();
    assert(nc.equal(cp[1 .. $ - 1]));
}

//
@trusted uint lookupNamedGroup(String)(NamedGroup[] dict, String name)
{//equal is @system?
    auto fnd = assumeSorted!"cmp(a,b) < 0"(map!"a.name"(dict)).lowerBound(name).length;
    enforce(fnd < dict.length && equal(dict[fnd].name, name),
        text("no submatch named ", name));
    return dict[fnd].group;
}

//whether ch is one of unicode newline sequences
//0-arg template due to @@@BUG@@@ 10985
bool endOfLine()(dchar front, bool seenCr)
{
    return ((front == '\n') ^ seenCr) || front == '\r'
    || front == NEL || front == LS || front == PS;
}

//
//0-arg template due to @@@BUG@@@ 10985
bool startOfLine()(dchar back, bool seenNl)
{
    return ((back == '\r') ^ seenNl) || back == '\n'
    || back == NEL || back == LS || back == PS;
}

//Test if bytecode starting at pc in program 're' can match given codepoint
//Returns: 0 - can't tell, -1 if doesn't match
int quickTestFwd(RegEx)(uint pc, dchar front, const ref RegEx re)
{
    static assert(IRL!(IR.OrChar) == 1);//used in code processing IR.OrChar
    for(;;)
        switch(re.ir[pc].code)
        {
        case IR.OrChar:
            uint len = re.ir[pc].sequence;
            uint end = pc + len;
            if(re.ir[pc].data != front && re.ir[pc+1].data != front)
            {
                for(pc = pc+2; pc < end; pc++)
                    if(re.ir[pc].data == front)
                        break;
                if(pc == end)
                    return -1;
            }
            return 0;
        case IR.Char:
            if(front == re.ir[pc].data)
                return 0;
            else
                return -1;
        case IR.Any:
            return 0;
        case IR.CodepointSet:
            if(re.charsets[re.ir[pc].data].scanFor(front))
                return 0;
            else
                return -1;
        case IR.GroupStart, IR.GroupEnd:
            pc += IRL!(IR.GroupStart);
            break;
        case IR.Trie:
            if(re.tries[re.ir[pc].data][front])
                return 0;
            else
                return -1;
        default:
            return 0;
        }
}

/*
    Useful utility for self-testing, an infinite range of string samples
    that _have_ to match given compiled regex.
    Caveats: supports only a simple subset of bytecode.
*/
@trusted public struct SampleGenerator(Char)
{
    import std.random;
    Regex!Char re;
    Appender!(char[]) app;
    uint limit, seed;
    Xorshift gen;
    //generator for pattern r, with soft maximum of threshold elements
    //and a given random seed
    this(ref Regex!Char r, uint threshold, uint randomSeed)
    {
        re = r;
        limit = threshold;
        seed = randomSeed;
        app = appender!(Char[])();
        compose();
    }

    uint rand(uint x)
    {
        uint r = gen.front % x;
        gen.popFront();
        return r;
    }

    void compose()
    {
        uint pc = 0, counter = 0, dataLenOld = uint.max;
        for(;;)
        {
            switch(re.ir[pc].code)
            {
            case IR.Char:
                    formattedWrite(app,"%s", cast(dchar)re.ir[pc].data);
                    pc += IRL!(IR.Char);
                    break;
                case IR.OrChar:
                    uint len = re.ir[pc].sequence;
                    formattedWrite(app, "%s", cast(dchar)re.ir[pc + rand(len)].data);
                    pc += len;
                    break;
                case IR.CodepointSet:
                case IR.Trie:
                    auto set = re.charsets[re.ir[pc].data];
                    auto x = rand(set.ivals.length/2);
                    auto y = rand(set.ivals[x*2+1] - set.ivals[2*x]);
                    formattedWrite(app, "%s", cast(dchar)(set.ivals[2*x]+y));
                    pc += IRL!(IR.CodepointSet);
                    break;
                case IR.Any:
                    uint x;
                    do
                    {
                        x = rand(0x11_000);
                    }while(x == '\r' || x == '\n' || !isValidDchar(x));
                    formattedWrite(app, "%s", cast(dchar)x);
                    pc += IRL!(IR.Any);
                    break;
                case IR.GotoEndOr:
                    pc += IRL!(IR.GotoEndOr)+re.ir[pc].data;
                    assert(re.ir[pc].code == IR.OrEnd);
                    goto case;
                case IR.OrEnd:
                    pc += IRL!(IR.OrEnd);
                    break;
                case IR.OrStart:
                    pc += IRL!(IR.OrStart);
                    goto case;
                case IR.Option:
                    uint next = pc + re.ir[pc].data + IRL!(IR.Option);
                    uint nOpt = 0;
                    //queue next Option
                    while(re.ir[next].code == IR.Option)
                    {
                        nOpt++;
                        next += re.ir[next].data + IRL!(IR.Option);
                    }
                    nOpt++;
                    nOpt = rand(nOpt);
                    for(;nOpt; nOpt--)
                    {
                        pc += re.ir[pc].data + IRL!(IR.Option);
                    }
                    assert(re.ir[pc].code == IR.Option);
                    pc += IRL!(IR.Option);
                    break;
                case IR.RepeatStart:case IR.RepeatQStart:
                    pc += IRL!(IR.RepeatStart)+re.ir[pc].data;
                    goto case IR.RepeatEnd;
                case IR.RepeatEnd:
                case IR.RepeatQEnd:
                    uint len = re.ir[pc].data;
                    uint step = re.ir[pc+2].raw;
                    uint min = re.ir[pc+3].raw;
                    if(counter < min)
                    {
                        counter += step;
                        pc -= len;
                        break;
                    }
                    uint max = re.ir[pc+4].raw;
                    if(counter < max)
                    {
                        if(app.data.length < limit && rand(3) > 0)
                        {
                            pc -= len;
                            counter += step;
                        }
                        else
                        {
                            counter = counter%step;
                            pc += IRL!(IR.RepeatEnd);
                        }
                    }
                    else
                    {
                        counter = counter%step;
                        pc += IRL!(IR.RepeatEnd);
                    }
                    break;
                case IR.InfiniteStart, IR.InfiniteQStart:
                    pc += re.ir[pc].data + IRL!(IR.InfiniteStart);
                    goto case IR.InfiniteEnd; //both Q and non-Q
                case IR.InfiniteEnd:
                case IR.InfiniteQEnd:
                    uint len = re.ir[pc].data;
                    if(app.data.length == dataLenOld)
                    {
                        pc += IRL!(IR.InfiniteEnd);
                        break;
                    }
                    dataLenOld = app.data.length;
                    if(app.data.length < limit && rand(3) > 0)
                        pc = pc - len;
                    else
                        pc = pc + IRL!(IR.InfiniteEnd);
                    break;
                case IR.GroupStart, IR.GroupEnd:
                    pc += IRL!(IR.GroupStart);
                    break;
                case IR.Bol, IR.Wordboundary, IR.Notwordboundary:
                case IR.LookaheadStart, IR.NeglookaheadStart, IR.LookbehindStart, IR.NeglookbehindStart:
                default:
                    return;
            }
        }
    }

    @property Char[] front()
    {
        return app.data;
    }

    @property empty(){  return false; }

    void popFront()
    {
        app.shrinkTo(0);
        compose();
    }
}

/++
    A $(D StaticRegex) is $(D Regex) object that contains specially
    generated machine code to speed up matching.
    Implicitly convertible to normal $(D Regex),
    however doing so will result in losing this additional capability.
+/
public struct StaticRegex(Char)
{
private:
    alias Matcher = BacktrackingMatcher!(true);
    alias MatchFn = bool function(ref Matcher!Char) @trusted;
    MatchFn nativeFn;
public:
    Regex!Char _regex;
    alias _regex this;
    this(Regex!Char re, MatchFn fn)
    {
        _regex = re;
        nativeFn = fn;

    }

}

//utility for shiftOr, returns a minimum number of bytes to test in a Char
uint effectiveSize(Char)()
{
    static if(is(Char == char))
        return 1;
    else static if(is(Char == wchar))
        return 2;
    else static if(is(Char == dchar))
        return 3;
    else
        static assert(0);
}

/*
    Kickstart engine using ShiftOr algorithm,
    a bit parallel technique for inexact string searching.
*/
struct ShiftOr(Char)
{
private:
    uint[] table;
    uint fChar;
    uint n_length;
    enum charSize =  effectiveSize!Char();
    //maximum number of chars in CodepointSet to process
    enum uint charsetThreshold = 32_000;
    static struct ShiftThread
    {
        uint[] tab;
        uint mask;
        uint idx;
        uint pc, counter, hops;
        this(uint newPc, uint newCounter, uint[] table)
        {
            pc = newPc;
            counter = newCounter;
            mask = 1;
            idx = 0;
            hops = 0;
            tab = table;
        }

        void setMask(uint idx, uint mask)
        {
            tab[idx] |= mask;
        }

        void setInvMask(uint idx, uint mask)
        {
            tab[idx] &= ~mask;
        }

        void set(alias setBits = setInvMask)(dchar ch)
        {
            static if(charSize == 3)
            {
                uint val = ch, tmask = mask;
                setBits(val&0xFF, tmask);
                tmask <<= 1;
                val >>= 8;
                setBits(val&0xFF, tmask);
                tmask <<= 1;
                val >>= 8;
                assert(val <= 0x10);
                setBits(val, tmask);
                tmask <<= 1;
            }
            else
            {
                Char[dchar.sizeof/Char.sizeof] buf;
                uint tmask = mask;
                size_t total = encode(buf, ch);
                for(size_t i = 0; i < total; i++, tmask<<=1)
                {
                    static if(charSize == 1)
                        setBits(buf[i], tmask);
                    else static if(charSize == 2)
                    {
                        setBits(buf[i]&0xFF, tmask);
                        tmask <<= 1;
                        setBits(buf[i]>>8, tmask);
                    }
                }
            }
        }
        void add(dchar ch){ return set!setInvMask(ch); }
        void advance(uint s)
        {
            mask <<= s;
            idx += s;
        }
        @property bool full(){    return !mask; }
    }

    static ShiftThread fork(ShiftThread t, uint newPc, uint newCounter)
    {
        ShiftThread nt = t;
        nt.pc = newPc;
        nt.counter = newCounter;
        return nt;
    }

    @trusted static ShiftThread fetch(ref ShiftThread[] worklist)
    {
        auto t = worklist[$-1];
        worklist.length -= 1;
        if(!__ctfe)
            cast(void)worklist.assumeSafeAppend();
        return t;
    }

    static uint charLen(uint ch)
    {
        assert(ch <= 0x10FFFF);
        return codeLength!Char(cast(dchar)ch)*charSize;
    }

public:
    @trusted this(ref Regex!Char re, uint[] memory)
    {
        assert(memory.length == 256);
        fChar = uint.max;
    L_FindChar:
        for(size_t i = 0;;)
        {
            switch(re.ir[i].code)
            {
                case IR.Char:
                    fChar = re.ir[i].data;
                    static if(charSize != 3)
                    {
                        Char[dchar.sizeof/Char.sizeof] buf;
                        encode(buf, fChar);
                        fChar = buf[0];
                    }
                    fChar = fChar & 0xFF;
                    break L_FindChar;
                case IR.GroupStart, IR.GroupEnd:
                    i += IRL!(IR.GroupStart);
                    break;
                case IR.Bol, IR.Wordboundary, IR.Notwordboundary:
                    i += IRL!(IR.Bol);
                    break;
                default:
                    break L_FindChar;
            }
        }
        table = memory;
        table[] =  uint.max;
        ShiftThread[] trs;
        ShiftThread t = ShiftThread(0, 0, table);
        //locate first fixed char if any
        n_length = 32;
        for(;;)
        {
        L_Eval_Thread:
            for(;;)
            {
                switch(re.ir[t.pc].code)
                {
                case IR.Char:
                    uint s = charLen(re.ir[t.pc].data);
                    if(t.idx+s > n_length)
                        goto L_StopThread;
                    t.add(re.ir[t.pc].data);
                    t.advance(s);
                    t.pc += IRL!(IR.Char);
                    break;
                case IR.OrChar://assumes IRL!(OrChar) == 1
                    uint len = re.ir[t.pc].sequence;
                    uint end = t.pc + len;
                    uint[Bytecode.maxSequence] s;
                    uint numS;
                    for(uint i = 0; i < len; i++)
                    {
                        auto x = charLen(re.ir[t.pc+i].data);
                        if(countUntil(s[0..numS], x) < 0)
                           s[numS++] = x;
                    }
                    for(uint i = t.pc; i < end; i++)
                    {
                        t.add(re.ir[i].data);
                    }
                    for(uint i = 0; i < numS; i++)
                    {
                        auto tx = fork(t, t.pc + len, t.counter);
                        if(tx.idx + s[i] <= n_length)
                        {
                            tx.advance(s[i]);
                            trs ~= tx;
                        }
                    }
                    if(!trs.empty)
                        t = fetch(trs);
                    else
                        goto L_StopThread;
                    break;
                case IR.CodepointSet:
                case IR.Trie:
                    auto set = re.charsets[re.ir[t.pc].data];
                    uint[4] s;
                    uint numS;
                    static if(charSize == 3)
                    {
                        s[0] = charSize;
                        numS = 1;
                    }
                    else
                    {

                        static if(charSize == 1)
                            static immutable codeBounds = [0x0, 0x7F, 0x80, 0x7FF, 0x800, 0xFFFF, 0x10000, 0x10FFFF];
                        else //== 2
                            static immutable codeBounds = [0x0, 0xFFFF, 0x10000, 0x10FFFF];
                        uint[] arr = new uint[set.byInterval.length * 2];
                        size_t ofs = 0;
                        foreach(ival; set.byInterval)
                        {
                            arr[ofs++] = ival.a;
                            arr[ofs++] = ival.b;
                        }
                        auto srange = assumeSorted!"a <= b"(arr);
                        for(uint i = 0; i < codeBounds.length/2; i++)
                        {
                            auto start = srange.lowerBound(codeBounds[2*i]).length;
                            auto end = srange.lowerBound(codeBounds[2*i+1]).length;
                            if(end > start || (end == start && (end & 1)))
                               s[numS++] = (i+1)*charSize;
                        }
                    }
                    if(numS == 0 || t.idx + s[numS-1] > n_length)
                        goto L_StopThread;
                    auto  chars = set.length;
                    if(chars > charsetThreshold)
                        goto L_StopThread;
                    foreach(ch; set.byCodepoint)
                    {
                        //avoid surrogate pairs
                        if(0xD800 <= ch && ch <= 0xDFFF)
                            continue;
                        t.add(ch);
                    }
                    for(uint i = 0; i < numS; i++)
                    {
                        auto tx =  fork(t, t.pc + IRL!(IR.CodepointSet), t.counter);
                        tx.advance(s[i]);
                        trs ~= tx;
                    }
                    if(!trs.empty)
                        t = fetch(trs);
                    else
                        goto L_StopThread;
                    break;
                case IR.Any:
                    goto L_StopThread;

                case IR.GotoEndOr:
                    t.pc += IRL!(IR.GotoEndOr)+re.ir[t.pc].data;
                    assert(re.ir[t.pc].code == IR.OrEnd);
                    goto case;
                case IR.OrEnd:
                    t.pc += IRL!(IR.OrEnd);
                    break;
                case IR.OrStart:
                    t.pc += IRL!(IR.OrStart);
                    goto case;
                case IR.Option:
                    uint next = t.pc + re.ir[t.pc].data + IRL!(IR.Option);
                    //queue next Option
                    if(re.ir[next].code == IR.Option)
                    {
                        trs ~= fork(t, next, t.counter);
                    }
                    t.pc += IRL!(IR.Option);
                    break;
                case IR.RepeatStart:case IR.RepeatQStart:
                    t.pc += IRL!(IR.RepeatStart)+re.ir[t.pc].data;
                    goto case IR.RepeatEnd;
                case IR.RepeatEnd:
                case IR.RepeatQEnd:
                    uint len = re.ir[t.pc].data;
                    uint step = re.ir[t.pc+2].raw;
                    uint min = re.ir[t.pc+3].raw;
                    if(t.counter < min)
                    {
                        t.counter += step;
                        t.pc -= len;
                        break;
                    }
                    uint max = re.ir[t.pc+4].raw;
                    if(t.counter < max)
                    {
                        trs ~= fork(t, t.pc - len, t.counter + step);
                        t.counter = t.counter%step;
                        t.pc += IRL!(IR.RepeatEnd);
                    }
                    else
                    {
                        t.counter = t.counter%step;
                        t.pc += IRL!(IR.RepeatEnd);
                    }
                    break;
                case IR.InfiniteStart, IR.InfiniteQStart:
                    t.pc += re.ir[t.pc].data + IRL!(IR.InfiniteStart);
                    goto case IR.InfiniteEnd; //both Q and non-Q
                case IR.InfiniteEnd:
                case IR.InfiniteQEnd:
                    uint len = re.ir[t.pc].data;
                    uint pc1, pc2; //branches to take in priority order
                    if(++t.hops == 32)
                        goto L_StopThread;
                    pc1 = t.pc + IRL!(IR.InfiniteEnd);
                    pc2 = t.pc - len;
                    trs ~= fork(t, pc2, t.counter);
                    t.pc = pc1;
                    break;
                case IR.GroupStart, IR.GroupEnd:
                    t.pc += IRL!(IR.GroupStart);
                    break;
                case IR.Bol, IR.Wordboundary, IR.Notwordboundary:
                    t.pc += IRL!(IR.Bol);
                    break;
                case IR.LookaheadStart, IR.NeglookaheadStart, IR.LookbehindStart, IR.NeglookbehindStart:
                    t.pc += IRL!(IR.LookaheadStart) + IRL!(IR.LookaheadEnd) + re.ir[t.pc].data;
                    break;
                default:
                L_StopThread:
                    assert(re.ir[t.pc].code >= 0x80, text(re.ir[t.pc].code));
                    debug (fred_search) writeln("ShiftOr stumbled on ",re.ir[t.pc].mnemonic);
                    n_length = min(t.idx, n_length);
                    break L_Eval_Thread;
                }
            }
            if(trs.empty)
                break;
            t = fetch(trs);
        }
        debug(std_regex_search)
        {
            writeln("Min length: ", n_length);
        }
    }

    @property bool empty() const {  return n_length == 0; }

    @property uint length() const{ return n_length/charSize; }

    // lookup compatible bit pattern in haystack, return starting index
    // has a useful trait: if supplied with valid UTF indexes,
    // returns only valid UTF indexes
    // (that given the haystack in question is valid UTF string)
    @trusted size_t search(const(Char)[] haystack, size_t idx)
    {//@BUG: apparently assumes little endian machines
        assert(!empty);
        auto p = cast(const(ubyte)*)(haystack.ptr+idx);
        uint state = uint.max;
        uint limit = 1u<<(n_length - 1u);
        debug(std_regex_search) writefln("Limit: %32b",limit);
        if(fChar != uint.max)
        {
            const(ubyte)* end = cast(ubyte*)(haystack.ptr + haystack.length);
            const orginalAlign = cast(size_t)p & (Char.sizeof-1);
            while(p != end)
            {
                if(!~state)
                {//speed up seeking first matching place
                    for(;;)
                    {
                        assert(p <= end, text(p," vs ", end));
                        p = cast(ubyte*)memchr(p, fChar, end - p);
                        if(!p)
                            return haystack.length;
                        if((cast(size_t)p & (Char.sizeof-1)) == orginalAlign)
                            break;
                        if(++p == end)
                            return haystack.length;
                    }
                    state = ~1u;
                    assert((cast(size_t)p & (Char.sizeof-1)) == orginalAlign);
                    static if(charSize == 3)
                    {
                        state = (state<<1) | table[p[1]];
                        state = (state<<1) | table[p[2]];
                        p += 4;
                    }
                    else
                        p++;
                    //first char is tested, see if that's all
                    if(!(state & limit))
                        return (p-cast(ubyte*)haystack.ptr)/Char.sizeof
                            -length;
                }
                else
                {//have some bits/states for possible matches,
                 //use the usual shift-or cycle
                    static if(charSize == 3)
                    {
                        state = (state<<1) | table[p[0]];
                        state = (state<<1) | table[p[1]];
                        state = (state<<1) | table[p[2]];
                        p += 4;
                    }
                    else
                    {
                        state = (state<<1) | table[p[0]];
                        p++;
                    }
                    if(!(state & limit))
                        return (p-cast(ubyte*)haystack.ptr)/Char.sizeof
                            -length;
                }
                debug(std_regex_search) writefln("State: %32b", state);
            }
        }
        else
        {
            //normal path, partially unrolled for char/wchar
            static if(charSize == 3)
            {
                const(ubyte)* end = cast(ubyte*)(haystack.ptr + haystack.length);
                while(p != end)
                {
                    state = (state<<1) | table[p[0]];
                    state = (state<<1) | table[p[1]];
                    state = (state<<1) | table[p[2]];
                    p += 4;
                    if(!(state & limit))//division rounds down for dchar
                        return (p-cast(ubyte*)haystack.ptr)/Char.sizeof
                        -length;
                }
            }
            else
            {
                auto len = cast(ubyte*)(haystack.ptr + haystack.length) - p;
                size_t i  = 0;
                if(len & 1)
                {
                    state = (state<<1) | table[p[i++]];
                    if(!(state & limit))
                        return idx+i/Char.sizeof-length;
                }
                while(i < len)
                {
                    state = (state<<1) | table[p[i++]];
                    if(!(state & limit))
                        return idx+i/Char.sizeof
                            -length;
                    state = (state<<1) | table[p[i++]];
                    if(!(state & limit))
                        return idx+i/Char.sizeof
                            -length;
                    debug(std_regex_search) writefln("State: %32b", state);
                }
            }
        }
        return haystack.length;
    }

    @system debug static void dump(uint[] table)
    {//@@@BUG@@@ writef(ln) is @system
        import std.stdio;
        for(size_t i = 0; i < table.length; i += 4)
        {
            writefln("%32b %32b %32b %32b",table[i], table[i+1], table[i+2], table[i+3]);
        }
    }
}

unittest
{

    @trusted void test_fixed(alias Kick)()
    {
        foreach(i, v; TypeTuple!(char, wchar, dchar))
        {
            alias Char = v;
            alias String = immutable(v)[];
            auto r = regex(to!String(`abc$`));
            auto kick = Kick!Char(r, new uint[256]);
            assert(kick.length == 3, text(Kick.stringof," ",v.stringof, " == ", kick.length));
            auto r2 = regex(to!String(`(abc){2}a+`));
            kick = Kick!Char(r2, new uint[256]);
            assert(kick.length == 7, text(Kick.stringof,v.stringof," == ", kick.length));
            auto r3 = regex(to!String(`\b(a{2}b{3}){2,4}`));
            kick = Kick!Char(r3, new uint[256]);
            assert(kick.length == 10, text(Kick.stringof,v.stringof," == ", kick.length));
            auto r4 = regex(to!String(`\ba{2}c\bxyz`));
            kick = Kick!Char(r4, new uint[256]);
            assert(kick.length == 6, text(Kick.stringof,v.stringof, " == ", kick.length));
            auto r5 = regex(to!String(`\ba{2}c\b`));
            kick = Kick!Char(r5, new uint[256]);
            size_t x = kick.search("aabaacaa", 0);
            assert(x == 3, text(Kick.stringof,v.stringof," == ", kick.length));
            x = kick.search("aabaacaa", x+1);
            assert(x == 8, text(Kick.stringof,v.stringof," == ", kick.length));
        }
    }
    @trusted void test_flex(alias Kick)()
    {
        foreach(i, v;TypeTuple!(char, wchar, dchar))
        {
            alias Char = v;
            alias String = immutable(v)[];
            auto r = regex(to!String(`abc[a-z]`));
            auto kick = Kick!Char(r, new uint[256]);
            auto x = kick.search(to!String("abbabca"), 0);
            assert(x == 3, text("real x is ", x, " ",v.stringof));

            auto r2 = regex(to!String(`(ax|bd|cdy)`));
            String s2 = to!String("abdcdyabax");
            kick = Kick!Char(r2, new uint[256]);
            x = kick.search(s2, 0);
            assert(x == 1, text("real x is ", x));
            x = kick.search(s2, x+1);
            assert(x == 3, text("real x is ", x));
            x = kick.search(s2, x+1);
            assert(x == 8, text("real x is ", x));
            auto rdot = regex(to!String(`...`));
            kick = Kick!Char(rdot, new uint[256]);
            assert(kick.length == 0);
            auto rN = regex(to!String(`a(b+|c+)x`));
            kick = Kick!Char(rN, new uint[256]);
            assert(kick.length == 3);
            assert(kick.search("ababx",0) == 2);
            assert(kick.search("abaacba",0) == 3);//expected inexact

        }
    }
    test_fixed!(ShiftOr)();
    test_flex!(ShiftOr)();
}

alias Kickstart = ShiftOr;

//Simple UTF-string abstraction compatible with stream interface
struct Input(Char)
    if(is(Char :dchar))
{
    alias DataIndex = size_t;
    enum { isLoopback = false };
    alias String = const(Char)[];
    String _origin;
    size_t _index;

    //constructs Input object out of plain string
    this(String input, size_t idx = 0)
    {
        _origin = input;
        _index = idx;
    }

    //codepoint at current stream position
    bool nextChar(ref dchar res, ref size_t pos)
    {
        pos = _index;
        if(_index == _origin.length)
            return false;
        res = std.utf.decode(_origin, _index);
        return true;
    }
    @property bool atEnd(){
        return _index == _origin.length;
    }
    bool search(Kickstart)(ref Kickstart kick, ref dchar res, ref size_t pos)
    {
        size_t idx = kick.search(_origin, _index);
        _index = idx;
        return nextChar(res, pos);
    }

    //index of at End position
    @property size_t lastIndex(){   return _origin.length; }

    //support for backtracker engine, might not be present
    void reset(size_t index){   _index = index;  }

    String opSlice(size_t start, size_t end){   return _origin[start..end]; }

    struct BackLooper
    {
        alias DataIndex = size_t;
        enum { isLoopback = true };
        String _origin;
        size_t _index;
        this(Input input, size_t index)
        {
            _origin = input._origin;
            _index = index;
        }
        @trusted bool nextChar(ref dchar res,ref size_t pos)
        {
            pos = _index;
            if(_index == 0)
                return false;

            res = _origin[0.._index].back;
            _index -= std.utf.strideBack(_origin, _index);

            return true;
        }
        @property atEnd(){ return _index == 0 || _index == std.utf.strideBack(_origin, _index); }
        auto loopBack(size_t index){   return Input(_origin, index); }

        //support for backtracker engine, might not be present
        //void reset(size_t index){   _index = index ? index-std.utf.strideBack(_origin, index) : 0;  }
        void reset(size_t index){   _index = index;  }

        String opSlice(size_t start, size_t end){   return _origin[end..start]; }
        //index of at End position
        @property size_t lastIndex(){   return 0; }
    }
    auto loopBack(size_t index){   return BackLooper(this, index); }
}

//both helperd below are internal, on its own are quite "explosive"

//unsafe, no initialization of elements
@system T[] mallocArray(T)(size_t len)
{
    return (cast(T*)malloc(len * T.sizeof))[0 .. len];
}

//very unsafe, no initialization
@system T[] arrayInChunk(T)(size_t len, ref void[] chunk)
{
    auto ret = (cast(T*)chunk.ptr)[0..len];
    chunk = chunk[len * T.sizeof .. $];
    return ret;
}

/+
    BacktrackingMatcher implements backtracking scheme of matching
    regular expressions.
+/
template BacktrackingMatcher(bool CTregex)
{
    @trusted struct BacktrackingMatcher(Char, Stream = Input!Char)
        if(is(Char : dchar))
    {
        alias DataIndex = Stream.DataIndex;
        struct State
        {//top bit in pc is set if saved along with matches
            DataIndex index;
            uint pc, counter, infiniteNesting;
        }
        static assert(State.sizeof % size_t.sizeof == 0);
        enum stateSize = State.sizeof / size_t.sizeof;
        enum initialStack = 1<<11; // items in a block of segmented stack
        alias const(Char)[] String;
        alias RegEx = Regex!Char;
        alias MatchFn = bool function (ref BacktrackingMatcher!(Char, Stream));
        RegEx re;      //regex program
        static if(CTregex)
            MatchFn nativeFn; //native code for that program
        //Stream state
        Stream s;
        DataIndex index;
        dchar front;
        bool exhausted;
        //backtracking machine state
        uint pc, counter;
        DataIndex lastState = 0;    //top of state stack
        DataIndex[] trackers;
        static if(!CTregex)
            uint infiniteNesting;
        size_t[] memory;
        //local slice of matches, global for backref
        Group!DataIndex[] matches, backrefed;

        static if(__traits(hasMember,Stream, "search"))
        {
            enum kicked = true;
        }
        else
            enum kicked = false;

        static size_t initialMemory(const ref RegEx re)
        {
            return (re.ngroup+1)*DataIndex.sizeof //trackers
                + stackSize(re)*size_t.sizeof;
        }

        static size_t stackSize(const ref RegEx re)
        {
            return initialStack*(stateSize + re.ngroup*(Group!DataIndex).sizeof/size_t.sizeof)+1;
        }

        @property bool atStart(){ return index == 0; }

        @property bool atEnd(){ return index == s.lastIndex && s.atEnd; }

        void next()
        {
            if(!s.nextChar(front, index))
                index = s.lastIndex;
        }

        void search()
        {
            static if(kicked)
            {
                if(!s.search(re.kickstart, front, index))
                {
                    index = s.lastIndex;
                }
            }
            else
                next();
        }

        //
        void newStack()
        {
            auto chunk = mallocArray!(size_t)(stackSize(re));
            chunk[0] = cast(size_t)(memory.ptr);
            memory = chunk[1..$];
        }

        void initExternalMemory(void[] memBlock)
        {
            trackers = arrayInChunk!(DataIndex)(re.ngroup+1, memBlock);
            memory = cast(size_t[])memBlock;
            memory[0] = 0; //hidden pointer
            memory = memory[1..$];
        }

        void initialize(ref RegEx program, Stream stream, void[] memBlock)
        {
            re = program;
            s = stream;
            exhausted = false;
            initExternalMemory(memBlock);
            backrefed = null;
        }

        auto dupTo(void[] memory)
        {
            typeof(this) tmp = this;
            tmp.initExternalMemory(memory);
            return tmp;
        }

        this(ref RegEx program, Stream stream, void[] memBlock, dchar ch, DataIndex idx)
        {
            initialize(program, stream, memBlock);
            front = ch;
            index = idx;
        }

        this(ref RegEx program, Stream stream, void[] memBlock)
        {
            initialize(program, stream, memBlock);
            next();
        }

        auto fwdMatcher(ref BacktrackingMatcher matcher, void[] memBlock)
        {
            alias BackMatcherTempl = .BacktrackingMatcher!(CTregex);
            alias BackMatcher = BackMatcherTempl!(Char, Stream);
            auto fwdMatcher = BackMatcher(matcher.re, s, memBlock, front, index);
            return fwdMatcher;
        }

        auto bwdMatcher(ref BacktrackingMatcher matcher, void[] memBlock)
        {
            alias BackMatcherTempl = .BacktrackingMatcher!(CTregex);
            alias BackMatcher = BackMatcherTempl!(Char, typeof(s.loopBack(index)));
            auto fwdMatcher =
                BackMatcher(matcher.re, s.loopBack(index), memBlock);
            return fwdMatcher;
        }

        //
        bool matchFinalize()
        {
            size_t start = index;
            if(matchImpl())
            {//stream is updated here
                matches[0].begin = start;
                matches[0].end = index;
                if(!(re.flags & RegexOption.global) || atEnd)
                    exhausted = true;
                if(start == index)//empty match advances input
                    next();
                return true;
            }
            else
                return false;
        }

        //lookup next match, fill matches with indices into input
        bool match(Group!DataIndex matches[])
        {
            debug(std_regex_matcher)
            {
                writeln("------------------------------------------");
            }
            if(exhausted) //all matches collected
                return false;
            this.matches = matches;
            if(re.flags & RegexInfo.oneShot)
            {
                exhausted = true;
                DataIndex start = index;
                auto m = matchImpl();
                if(m)
                {
                    matches[0].begin = start;
                    matches[0].end = index;
                }
                return m;
            }
            static if(kicked)
            {
                if(!re.kickstart.empty)
                {
                    for(;;)
                    {

                        if(matchFinalize())
                            return true;
                        else
                        {
                            if(atEnd)
                                break;
                            search();
                            if(atEnd)
                            {
                                exhausted = true;
                                return matchFinalize();
                            }
                        }
                    }
                    exhausted = true;
                    return false; //early return
                }
            }
            //no search available - skip a char at a time
            for(;;)
            {
                if(matchFinalize())
                    return true;
                else
                {
                    if(atEnd)
                        break;
                    next();
                    if(atEnd)
                    {
                        exhausted = true;
                        return matchFinalize();
                    }
                }
            }
            exhausted = true;
            return false;
        }

        /+
            match subexpression against input,
            results are stored in matches
        +/
        bool matchImpl()
        {
            static if(CTregex && is(typeof(nativeFn(this))))
            {
                    debug(std_regex_ctr) writeln("using C-T matcher");
                return nativeFn(this);
            }
            else
            {
                pc = 0;
                counter = 0;
                lastState = 0;
                infiniteNesting = -1;//intentional
                auto start = s._index;
                debug(std_regex_matcher)
                    writeln("Try match starting at ", s[index..s.lastIndex]);
                for(;;)
                {
                    debug(std_regex_matcher)
                        writefln("PC: %s\tCNT: %s\t%s \tfront: %s src: %s",
                            pc, counter, disassemble(re.ir, pc, re.dict),
                            front, s._index);
                    switch(re.ir[pc].code)
                    {
                    case IR.OrChar://assumes IRL!(OrChar) == 1
                        if(atEnd)
                            goto L_backtrack;
                        uint len = re.ir[pc].sequence;
                        uint end = pc + len;
                        if(re.ir[pc].data != front && re.ir[pc+1].data != front)
                        {
                            for(pc = pc+2; pc < end; pc++)
                                if(re.ir[pc].data == front)
                                    break;
                            if(pc == end)
                                goto L_backtrack;
                        }
                        pc = end;
                        next();
                        break;
                    case IR.Char:
                        if(atEnd || front != re.ir[pc].data)
                            goto L_backtrack;
                        pc += IRL!(IR.Char);
                        next();
                    break;
                    case IR.Any:
                        if(atEnd || (!(re.flags & RegexOption.singleline)
                                && (front == '\r' || front == '\n')))
                            goto L_backtrack;
                        pc += IRL!(IR.Any);
                        next();
                        break;
                    case IR.CodepointSet:
                        if(atEnd || !re.charsets[re.ir[pc].data].scanFor(front))
                            goto L_backtrack;
                        next();
                        pc += IRL!(IR.CodepointSet);
                        break;
                    case IR.Trie:
                        if(atEnd || !re.tries[re.ir[pc].data][front])
                            goto L_backtrack;
                        next();
                        pc += IRL!(IR.Trie);
                        break;
                    case IR.Wordboundary:
                        dchar back;
                        DataIndex bi;
                        //at start & end of input
                        if(atStart && wordTrie[front])
                        {
                            pc += IRL!(IR.Wordboundary);
                            break;
                        }
                        else if(atEnd && s.loopBack(index).nextChar(back, bi)
                                && wordTrie[back])
                        {
                            pc += IRL!(IR.Wordboundary);
                            break;
                        }
                        else if(s.loopBack(index).nextChar(back, bi))
                        {
                            bool af = wordTrie[front];
                            bool ab = wordTrie[back];
                            if(af ^ ab)
                            {
                                pc += IRL!(IR.Wordboundary);
                                break;
                            }
                        }
                        goto L_backtrack;
                    case IR.Notwordboundary:
                        dchar back;
                        DataIndex bi;
                        //at start & end of input
                        if(atStart && wordTrie[front])
                            goto L_backtrack;
                        else if(atEnd && s.loopBack(index).nextChar(back, bi)
                                && wordTrie[back])
                            goto L_backtrack;
                        else if(s.loopBack(index).nextChar(back, bi))
                        {
                            bool af = wordTrie[front];
                            bool ab = wordTrie[back];
                            if(af ^ ab)
                                goto L_backtrack;
                        }
                        pc += IRL!(IR.Wordboundary);
                        break;
                    case IR.Bol:
                        dchar back;
                        DataIndex bi;
                        if(atStart)
                            pc += IRL!(IR.Bol);
                        else if((re.flags & RegexOption.multiline)
                            && s.loopBack(index).nextChar(back,bi)
                            && endOfLine(back, front == '\n'))
                        {
                            pc += IRL!(IR.Bol);
                        }
                        else
                            goto L_backtrack;
                        break;
                    case IR.Eol:
                        dchar back;
                        DataIndex bi;
                        debug(std_regex_matcher) writefln("EOL (front 0x%x) %s", front, s[index..s.lastIndex]);
                        //no matching inside \r\n
                        if(atEnd || ((re.flags & RegexOption.multiline)
                            && endOfLine(front, s.loopBack(index).nextChar(back,bi)
                                && back == '\r')))
                        {
                            pc += IRL!(IR.Eol);
                        }
                        else
                            goto L_backtrack;
                        break;
                    case IR.InfiniteStart, IR.InfiniteQStart:
                        trackers[infiniteNesting+1] = index;
                        pc += re.ir[pc].data + IRL!(IR.InfiniteStart);
                        //now pc is at end IR.Infininite(Q)End
                        uint len = re.ir[pc].data;
                        int test;
                        if(re.ir[pc].code == IR.InfiniteEnd)
                        {
                            test = quickTestFwd(pc+IRL!(IR.InfiniteEnd), front, re);
                            if(test >= 0)
                                pushState(pc+IRL!(IR.InfiniteEnd), counter);
                            infiniteNesting++;
                            pc -= len;
                        }
                        else
                        {
                            test = quickTestFwd(pc - len, front, re);
                            if(test >= 0)
                            {
                                infiniteNesting++;
                                pushState(pc - len, counter);
                                infiniteNesting--;
                            }
                            pc += IRL!(IR.InfiniteEnd);
                        }
                        break;
                    case IR.RepeatStart, IR.RepeatQStart:
                        pc += re.ir[pc].data + IRL!(IR.RepeatStart);
                        break;
                    case IR.RepeatEnd:
                    case IR.RepeatQEnd:
                        //len, step, min, max
                        uint len = re.ir[pc].data;
                        uint step =  re.ir[pc+2].raw;
                        uint min = re.ir[pc+3].raw;
                        uint max = re.ir[pc+4].raw;
                        if(counter < min)
                        {
                            counter += step;
                            pc -= len;
                        }
                        else if(counter < max)
                        {
                            if(re.ir[pc].code == IR.RepeatEnd)
                            {
                                pushState(pc + IRL!(IR.RepeatEnd), counter%step);
                                counter += step;
                                pc -= len;
                            }
                            else
                            {
                                pushState(pc - len, counter + step);
                                counter = counter%step;
                                pc += IRL!(IR.RepeatEnd);
                            }
                        }
                        else
                        {
                            counter = counter%step;
                            pc += IRL!(IR.RepeatEnd);
                        }
                        break;
                    case IR.InfiniteEnd:
                    case IR.InfiniteQEnd:
                        uint len = re.ir[pc].data;
                        debug(std_regex_matcher) writeln("Infinited nesting:", infiniteNesting);
                        assert(infiniteNesting < trackers.length);

                        if(trackers[infiniteNesting] == index)
                        {//source not consumed
                            pc += IRL!(IR.InfiniteEnd);
                            infiniteNesting--;
                            break;
                        }
                        else
                            trackers[infiniteNesting] = index;
                        int test;
                        if(re.ir[pc].code == IR.InfiniteEnd)
                        {
                            test = quickTestFwd(pc+IRL!(IR.InfiniteEnd), front, re);
                            if(test >= 0)
                            {
                                infiniteNesting--;
                                pushState(pc + IRL!(IR.InfiniteEnd), counter);
                                infiniteNesting++;
                            }
                            pc -= len;
                        }
                        else
                        {
                            test = quickTestFwd(pc-len, front, re);
                            if(test >= 0)
                                pushState(pc-len, counter);
                            pc += IRL!(IR.InfiniteEnd);
                            infiniteNesting--;
                        }
                        break;
                    case IR.OrEnd:
                        pc += IRL!(IR.OrEnd);
                        break;
                    case IR.OrStart:
                        pc += IRL!(IR.OrStart);
                        goto case;
                    case IR.Option:
                        uint len = re.ir[pc].data;
                        if(re.ir[pc+len].code == IR.GotoEndOr)//not a last one
                        {
                            pushState(pc + len + IRL!(IR.Option), counter); //remember 2nd branch
                        }
                        pc += IRL!(IR.Option);
                        break;
                    case IR.GotoEndOr:
                        pc = pc + re.ir[pc].data + IRL!(IR.GotoEndOr);
                        break;
                    case IR.GroupStart:
                        uint n = re.ir[pc].data;
                        matches[n].begin = index;
                        debug(std_regex_matcher)  writefln("IR group #%u starts at %u", n, index);
                        pc += IRL!(IR.GroupStart);
                        break;
                    case IR.GroupEnd:
                        uint n = re.ir[pc].data;
                        matches[n].end = index;
                        debug(std_regex_matcher) writefln("IR group #%u ends at %u", n, index);
                        pc += IRL!(IR.GroupEnd);
                        break;
                    case IR.LookaheadStart:
                    case IR.NeglookaheadStart:
                        uint len = re.ir[pc].data;
                        auto save = index;
                        uint ms = re.ir[pc+1].raw, me = re.ir[pc+2].raw;
                        auto mem = malloc(initialMemory(re))[0..initialMemory(re)];
                        scope(exit) free(mem.ptr);
                        static if(Stream.isLoopback)
                        {
                            auto matcher = bwdMatcher(this, mem);
                        }
                        else
                        {
                            auto matcher = fwdMatcher(this, mem);
                        }
                        matcher.matches = matches[ms .. me];
                        matcher.backrefed = backrefed.empty ? matches : backrefed;
                        matcher.re.ir = re.ir[pc+IRL!(IR.LookaheadStart) .. pc+IRL!(IR.LookaheadStart)+len+IRL!(IR.LookaheadEnd)];
                        bool match = matcher.matchImpl() ^ (re.ir[pc].code == IR.NeglookaheadStart);
                        s.reset(save);
                        next();
                        if(!match)
                            goto L_backtrack;
                        else
                        {
                            pc += IRL!(IR.LookaheadStart)+len+IRL!(IR.LookaheadEnd);
                        }
                        break;
                    case IR.LookbehindStart:
                    case IR.NeglookbehindStart:
                        uint len = re.ir[pc].data;
                        uint ms = re.ir[pc+1].raw, me = re.ir[pc+2].raw;
                        auto mem = malloc(initialMemory(re))[0..initialMemory(re)];
                        scope(exit) free(mem.ptr);
                        static if(Stream.isLoopback)
                        {
                            alias Matcher = BacktrackingMatcher!(Char, Stream);
                            auto matcher = Matcher(re, s, mem, front, index);
                        }
                        else
                        {
                            alias Matcher = BacktrackingMatcher!(Char, typeof(s.loopBack(index)));
                            auto matcher = Matcher(re, s.loopBack(index), mem);
                        }
                        matcher.matches = matches[ms .. me];
                        matcher.re.ir = re.ir[pc + IRL!(IR.LookbehindStart) .. pc + IRL!(IR.LookbehindStart) + len + IRL!(IR.LookbehindEnd)];
                        matcher.backrefed  = backrefed.empty ? matches : backrefed;
                        bool match = matcher.matchImpl() ^ (re.ir[pc].code == IR.NeglookbehindStart);
                        if(!match)
                            goto L_backtrack;
                        else
                        {
                            pc += IRL!(IR.LookbehindStart)+len+IRL!(IR.LookbehindEnd);
                        }
                        break;
                    case IR.Backref:
                        uint n = re.ir[pc].data;
                        auto referenced = re.ir[pc].localRef
                                ? s[matches[n].begin .. matches[n].end]
                                : s[backrefed[n].begin .. backrefed[n].end];
                        while(!atEnd && !referenced.empty && front == referenced.front)
                        {
                            next();
                            referenced.popFront();
                        }
                        if(referenced.empty)
                            pc++;
                        else
                            goto L_backtrack;
                        break;
                        case IR.Nop:
                        pc += IRL!(IR.Nop);
                        break;
                    case IR.LookaheadEnd:
                    case IR.NeglookaheadEnd:
                    case IR.LookbehindEnd:
                    case IR.NeglookbehindEnd:
                    case IR.End:
                        return true;
                    default:
                        debug printBytecode(re.ir[0..$]);
                        assert(0);
                    L_backtrack:
                        if(!popState())
                        {
                            s.reset(start);
                            return false;
                        }
                    }
                }
            }
            assert(0);
        }

        @property size_t stackAvail()
        {
            return memory.length - lastState;
        }

        bool prevStack()
        {
            size_t* prev = memory.ptr-1;
            prev = cast(size_t*)*prev;//take out hidden pointer
            if(!prev)
                return false;
            free(memory.ptr);//last segment is freed in RegexMatch
            immutable size = initialStack*(stateSize + 2*re.ngroup);
            memory = prev[0..size];
            lastState = size;
            return true;
        }

        void stackPush(T)(T val)
            if(!isDynamicArray!T)
        {
            *cast(T*)&memory[lastState] = val;
            enum delta = (T.sizeof+size_t.sizeof/2)/size_t.sizeof;
            lastState += delta;
            debug(std_regex_matcher) writeln("push element SP= ", lastState);
        }

        void stackPush(T)(T[] val)
        {
            static assert(T.sizeof % size_t.sizeof == 0);
            (cast(T*)&memory[lastState])[0..val.length]
                = val[0..$];
            lastState += val.length*(T.sizeof/size_t.sizeof);
            debug(std_regex_matcher) writeln("push array SP= ", lastState);
        }

        void stackPop(T)(ref T val)
            if(!isDynamicArray!T)
        {
            enum delta = (T.sizeof+size_t.sizeof/2)/size_t.sizeof;
            lastState -= delta;
            val = *cast(T*)&memory[lastState];
            debug(std_regex_matcher) writeln("pop element SP= ", lastState);
        }

        void stackPop(T)(T[] val)
        {
            stackPop(val);  // call ref version
        }
        void stackPop(T)(ref T[] val)
        {
            lastState -= val.length*(T.sizeof/size_t.sizeof);
            val[0..$] = (cast(T*)&memory[lastState])[0..val.length];
            debug(std_regex_matcher) writeln("pop array SP= ", lastState);
        }

        static if(!CTregex)
        {
            //helper function, saves engine state
            void pushState(uint pc, uint counter)
            {
                if(stateSize + trackers.length + matches.length > stackAvail)
                {
                    newStack();
                    lastState = 0;
                }
                *cast(State*)&memory[lastState] =
                    State(index, pc, counter, infiniteNesting);
                lastState += stateSize;
                memory[lastState .. lastState + 2 * matches.length] = (cast(size_t[])matches)[];
                lastState += 2*matches.length;
                if(trackers.length)
                {
                    memory[lastState .. lastState + trackers.length] = trackers[];
                    lastState += trackers.length;
                }
                debug(std_regex_matcher)
                    writefln("Saved(pc=%s) front: %s src: %s",
                        pc, front, s[index..s.lastIndex]);
            }

            //helper function, restores engine state
            bool popState()
            {
                if(!lastState)
                    return prevStack();
                if (trackers.length)
                {
                    lastState -= trackers.length;
                    trackers[] = memory[lastState .. lastState + trackers.length];
                }
                lastState -= 2*matches.length;
                auto pm = cast(size_t[])matches;
                pm[] = memory[lastState .. lastState + 2 * matches.length];
                lastState -= stateSize;
                State* state = cast(State*)&memory[lastState];
                index = state.index;
                pc = state.pc;
                counter = state.counter;
                infiniteNesting = state.infiniteNesting;
                debug(std_regex_matcher)
                {
                    writefln("Restored matches", front, s[index .. s.lastIndex]);
                    foreach(i, m; matches)
                        writefln("Sub(%d) : %s..%s", i, m.begin, m.end);
                }
                s.reset(index);
                next();
                debug(std_regex_matcher)
                    writefln("Backtracked (pc=%s) front: %s src: %s",
                        pc, front, s[index..s.lastIndex]);
                return true;
            }
                        }
                        }
                        }

//very shitty string formatter, $$ replaced with next argument converted to string
@trusted string ctSub( U...)(string format, U args)
{
    bool seenDollar;
    foreach(i, ch; format)
    {
        if(ch == '$')
        {
            if(seenDollar)
            {
                static if(args.length > 0)
                {
                    return  format[0 .. i - 1] ~ to!string(args[0])
                        ~ ctSub(format[i + 1 .. $], args[1 .. $]);
                }
                else
                    assert(0);
            }
            else
                seenDollar = true;
        }
        else
            seenDollar = false;

    }
    return format;
}

//generate code for TypeTuple(S, S+1, S+2, ... E)
@system string ctGenSeq(int S, int E)
{
    string s = "alias Sequence = TypeTuple!(";
    if(S < E)
        s ~= to!string(S);
    for(int i = S+1; i < E;i++)
    {
        s ~= ", ";
        s ~= to!string(i);
    }
    return s ~");";
}

//alias to TypeTuple(S, S+1, S+2, ... E)
template Sequence(int S, int E)
{
    mixin(ctGenSeq(S,E));
}

struct CtContext
{
    //dirty flags
    bool counter, infNesting;
    // to make a unique advancement counter per nesting level of loops
    int curInfLoop, nInfLoops;
    //to mark the portion of matches to save
    int match, total_matches;
    int reserved;


    //state of codegenerator
    struct CtState
    {
        string code;
        int addr;
    }

    this(Char)(Regex!Char re)
    {
        match = 1;
        reserved = 1; //first match is skipped
        total_matches = re.ngroup;
    }

    CtContext lookaround(uint s, uint e)
    {
        CtContext ct;
        ct.total_matches = e - s;
        ct.match = 1;
        return ct;
    }

    //restore state having current context
    string restoreCode()
    {
        string text;
        //stack is checked in L_backtrack
        text ~= counter
            ? "
                    stackPop(counter);"
            : "
                    counter = 0;";
        if(infNesting)
        {
            text ~= ctSub(`
                    stackPop(trackers[0..$$]);
                    `, curInfLoop + 1);
        }
        if(match < total_matches)
        {
            text ~= ctSub("
                    stackPop(matches[$$..$$]);", reserved, match);
            text ~= ctSub("
                    matches[$$..$] = typeof(matches[0]).init;", match);
        }
        else
            text ~= ctSub("
                    stackPop(matches[$$..$]);", reserved);
        return text;
    }

    //save state having current context
    string saveCode(uint pc, string count_expr="counter")
    {
        string text = ctSub("
                    if(stackAvail < $$*(Group!(DataIndex)).sizeof/size_t.sizeof + trackers.length + $$)
                    {
                        newStack();
                        lastState = 0;
                    }", match - reserved, cast(int)counter + 2);
        if(match < total_matches)
            text ~= ctSub("
                    stackPush(matches[$$..$$]);", reserved, match);
        else
            text ~= ctSub("
                    stackPush(matches[$$..$]);", reserved);
        if(infNesting)
        {
            text ~= ctSub(`
                    stackPush(trackers[0..$$]);
                    `, curInfLoop + 1);
        }
        text ~= counter ? ctSub("
                    stackPush($$);", count_expr) : "";
        text ~= ctSub("
                    stackPush(index); stackPush($$); \n", pc);
        return text;
    }

    //
    CtState ctGenBlock(Bytecode[] ir, int addr)
    {
        CtState result;
        result.addr = addr;
        while(!ir.empty)
        {
            auto n = ctGenGroup(ir, result.addr);
            result.code ~= n.code;
            result.addr = n.addr;
        }
        return result;
    }

    //
    CtState ctGenGroup(ref Bytecode[] ir, int addr)
    {
        auto bailOut = "goto L_backtrack;";
        auto nextInstr = ctSub("goto case $$;", addr+1);
        CtState r;
        assert(!ir.empty);
        switch(ir[0].code)
        {
        case IR.InfiniteStart, IR.InfiniteQStart, IR.RepeatStart, IR.RepeatQStart:
            bool infLoop =
                ir[0].code == IR.InfiniteStart || ir[0].code == IR.InfiniteQStart;
            infNesting = infNesting || infLoop;
            if(infLoop)
            {
                curInfLoop++;
                nInfLoops = max(nInfLoops, curInfLoop+1);
            }
            counter = counter ||
                ir[0].code == IR.RepeatStart || ir[0].code == IR.RepeatQStart;
            uint len = ir[0].data;
            auto nir = ir[ir[0].length .. ir[0].length+len];
            r = ctGenBlock(nir, addr+1);
            if(infLoop)
                curInfLoop--;
            //start/end codegen
            //r.addr is at last test+ jump of loop, addr+1 is body of loop
            nir = ir[ir[0].length + len .. $];
            r.code = ctGenFixupCode(ir[0..ir[0].length], addr, r.addr) ~ r.code;
            r.code ~= ctGenFixupCode(nir, r.addr, addr+1);
            r.addr += 2;   //account end instruction + restore state
            ir = nir;
            break;
        case IR.OrStart:
            uint len = ir[0].data;
            auto nir = ir[ir[0].length .. ir[0].length+len];
            r = ctGenAlternation(nir, addr);
            ir = ir[ir[0].length + len .. $];
            assert(ir[0].code == IR.OrEnd);
            ir = ir[ir[0].length..$];
            break;
        case IR.LookaheadStart:
        case IR.NeglookaheadStart:
        case IR.LookbehindStart:
        case IR.NeglookbehindStart:
            uint len = ir[0].data;
            bool behind = ir[0].code == IR.LookbehindStart || ir[0].code == IR.NeglookbehindStart;
            bool negative = ir[0].code == IR.NeglookaheadStart || ir[0].code == IR.NeglookbehindStart;
            string fwdType = "typeof(fwdMatcher(matcher, []))";
            string bwdType = "typeof(bwdMatcher(matcher, []))";
            string fwdCreate = "fwdMatcher(matcher, mem)";
            string bwdCreate = "bwdMatcher(matcher, mem)";
            uint start = IRL!(IR.LookbehindStart);
            uint end = IRL!(IR.LookbehindStart)+len+IRL!(IR.LookaheadEnd);
            CtContext context = lookaround(ir[1].raw, ir[2].raw); //split off new context
            auto slice = ir[start .. end];
            r.code ~= ctSub(`
            case $$: //fake lookaround "atom"
                    static if(typeof(matcher.s).isLoopback)
                        alias Lookaround = $$;
                    else
                        alias Lookaround = $$;
                    static bool matcher_$$(ref Lookaround matcher) @trusted
                    {
                        //(neg)lookaround piece start
                        $$
                        //(neg)lookaround piece ends
                    }
                    auto save = index;
                    auto mem = malloc(initialMemory(re))[0..initialMemory(re)];
                    scope(exit) free(mem.ptr);
                    static if(typeof(matcher.s).isLoopback)
                        auto lookaround = $$;
                    else
                        auto lookaround = $$;
                    lookaround.matches = matches[$$..$$];
                    lookaround.backrefed = backrefed.empty ? matches : backrefed;
                    lookaround.nativeFn = &matcher_$$; //hookup closure's binary code
                    bool match = $$;
                    s.reset(save);
                    next();
                    if(match)
                        $$
                    else
                        $$`, addr,
                        behind ? fwdType : bwdType, behind ? bwdType : fwdType,
                        addr, context.ctGenRegEx(slice),
                        behind ? fwdCreate : bwdCreate, behind ? bwdCreate : fwdCreate,
                        ir[1].raw, ir[2].raw, //start - end of matches slice
                        addr,
                        negative ? "!lookaround.matchImpl()" : "lookaround.matchImpl()",
                        nextInstr, bailOut);
            ir = ir[end .. $];
            r.addr = addr + 1;
            break;
        case IR.LookaheadEnd: case IR.NeglookaheadEnd:
        case IR.LookbehindEnd: case IR.NeglookbehindEnd:
            ir = ir[IRL!(IR.LookaheadEnd) .. $];
            r.addr = addr;
            break;
        default:
            assert(ir[0].isAtom,  text(ir[0].mnemonic));
            r = ctGenAtom(ir, addr);
        }
        return r;
    }

    //generate source for bytecode contained  in OrStart ... OrEnd
    CtState ctGenAlternation(Bytecode[] ir, int addr)
    {
        CtState[] pieces;
        CtState r;
        enum optL = IRL!(IR.Option);
        for(;;)
        {
            assert(ir[0].code == IR.Option);
            auto len = ir[0].data;
            if(optL+len < ir.length  && ir[optL+len].code == IR.Option)//not a last option
            {
                auto nir = ir[optL .. optL+len-IRL!(IR.GotoEndOr)];
                r = ctGenBlock(nir, addr+2);//space for Option + restore state
                //r.addr+1 to account GotoEndOr  at end of branch
                r.code = ctGenFixupCode(ir[0 .. ir[0].length], addr, r.addr+1) ~ r.code;
                addr = r.addr+1;//leave space for GotoEndOr
                pieces ~= r;
                ir = ir[optL + len .. $];
            }
            else
            {
                pieces ~= ctGenBlock(ir[optL..$], addr);
                addr = pieces[$-1].addr;
                break;
            }
        }
        r = pieces[0];
        for(uint i = 1; i < pieces.length; i++)
        {
            r.code ~= ctSub(`
                case $$:
                    goto case $$; `, pieces[i-1].addr, addr);
            r.code ~= pieces[i].code;
        }
        r.addr = addr;
        return r;
    }

    // generate fixup code for instruction in ir,
    // fixup means it has an alternative way for control flow
    string ctGenFixupCode(Bytecode[] ir, int addr, int fixup)
    {
        return ctGenFixupCode(ir, addr, fixup); // call ref Bytecode[] version
    }
    string ctGenFixupCode(ref Bytecode[] ir, int addr, int fixup)
    {
        string r;
        string testCode;
        r = ctSub(`
                case $$: debug(std_regex_matcher) writeln("#$$");`,
                    addr, addr);
        switch(ir[0].code)
        {
        case IR.InfiniteStart, IR.InfiniteQStart:
            r ~= ctSub( `
                    trackers[$$] = DataIndex.max;
                    goto case $$;`, curInfLoop, fixup);
            ir = ir[ir[0].length..$];
            break;
        case IR.InfiniteEnd:
            testCode = ctQuickTest(ir[IRL!(IR.InfiniteEnd) .. $],addr + 1);
            r ~= ctSub( `
                    if(trackers[$$] == index)
                    {//source not consumed
                        goto case $$;
                    }
                    trackers[$$] = index;

                    $$
                    {
                        $$
                    }
                    goto case $$;
                case $$: //restore state and go out of loop
                    $$
                    goto case;`, curInfLoop, addr+2,
                    curInfLoop, testCode, saveCode(addr+1),
                    fixup, addr+1, restoreCode());
            ir = ir[ir[0].length..$];
            break;
        case IR.InfiniteQEnd:
            testCode = ctQuickTest(ir[IRL!(IR.InfiniteEnd) .. $],addr + 1);
            auto altCode = testCode.length ? ctSub("else goto case $$;", fixup) : "";
            r ~= ctSub( `
                    if(trackers[$$] == index)
                    {//source not consumed
                        goto case $$;
                    }
                    trackers[$$] = index;

                    $$
                    {
                        $$
                        goto case $$;
                    }
                    $$
                case $$://restore state and go inside loop
                    $$
                    goto case $$;`, curInfLoop, addr+2,
                    curInfLoop, testCode, saveCode(addr+1),
                    addr+2, altCode, addr+1, restoreCode(), fixup);
            ir = ir[ir[0].length..$];
            break;
        case IR.RepeatStart, IR.RepeatQStart:
            r ~= ctSub( `
                    goto case $$;`, fixup);
            ir = ir[ir[0].length..$];
            break;
         case IR.RepeatEnd, IR.RepeatQEnd:
            //len, step, min, max
            uint len = ir[0].data;
            uint step = ir[2].raw;
            uint min = ir[3].raw;
            uint max = ir[4].raw;
            r ~= ctSub(`
                    if(counter < $$)
                    {
                        debug(std_regex_matcher) writeln("RepeatEnd min case pc=", $$);
                        counter += $$;
                        goto case $$;
                    }`,  min, addr, step, fixup);
            if(ir[0].code == IR.RepeatEnd)
            {
                string counter_expr = ctSub("counter % $$", step);
                r ~= ctSub(`
                    else if(counter < $$)
                    {
                            $$
                            counter += $$;
                            goto case $$;
                    }`, max, saveCode(addr+1, counter_expr), step, fixup);
            }
            else
            {
                string counter_expr = ctSub("counter % $$", step);
                r ~= ctSub(`
                    else if(counter < $$)
                    {
                        $$
                        counter = counter % $$;
                        goto case $$;
                    }`, max, saveCode(addr+1,counter_expr), step, addr+2);
            }
            r ~= ctSub(`
                    else
                    {
                        counter = counter % $$;
                        goto case $$;
                    }
                case $$: //restore state
                    $$
                    goto case $$;`, step, addr+2, addr+1, restoreCode(),
                    ir[0].code == IR.RepeatEnd ? addr+2 : fixup );
            ir = ir[ir[0].length..$];
            break;
        case IR.Option:
            r ~= ctSub( `
                {
                    $$
                }
                goto case $$;
            case $$://restore thunk to go to the next group
                $$
                goto case $$;`, saveCode(addr+1), addr+2,
                    addr+1, restoreCode(), fixup);
                ir = ir[ir[0].length..$];
            break;
        default:
            assert(0, text(ir[0].mnemonic));
        }
        return r;
    }


    string ctQuickTest(Bytecode[] ir, int id)
    {
        uint pc = 0;
        while(pc < ir.length && ir[pc].isAtom)
        {
            if(ir[pc].code == IR.GroupStart || ir[pc].code == IR.GroupEnd)
            {
                pc++;
            }
            else if(ir[pc].code == IR.Backref)
                break;
            else
            {
                auto code = ctAtomCode(ir[pc..$], -1);
                return ctSub(`
                    int test_$$()
                    {
                        $$ //$$
                    }
                    if(test_$$() >= 0)`, id, code.ptr ? code : "return 0;",
                        ir[pc].mnemonic, id);
            }
        }
        return "";
    }

    //process & generate source for simple bytecodes at front of ir using address addr
    CtState ctGenAtom(ref Bytecode[] ir, int addr)
    {
        CtState result;
        result.code = ctAtomCode(ir, addr);
        ir.popFrontN(ir[0].code == IR.OrChar ? ir[0].sequence : ir[0].length);
        result.addr = addr + 1;
        return result;
    }

    //D code for atom at ir using address addr, addr < 0 means quickTest
    string ctAtomCode(Bytecode[] ir, int addr)
    {
        string code;
        string bailOut, nextInstr;
        if(addr < 0)
        {
            bailOut = "return -1;";
            nextInstr = "return 0;";
        }
        else
        {
            bailOut = "goto L_backtrack;";
            nextInstr = ctSub("goto case $$;", addr+1);
            code ~=  ctSub( `
                 case $$: debug(std_regex_matcher) writeln("#$$");
                    `, addr, addr);
        }
        switch(ir[0].code)
        {
        case IR.OrChar://assumes IRL!(OrChar) == 1
            code ~=  ctSub(`
                    if(atEnd)
                        $$`, bailOut);
            uint len = ir[0].sequence;
            for(uint i = 0; i < len; i++)
            {
                code ~= ctSub( `
                    if(front == $$)
                    {
                        $$
                        $$
                    }`,   ir[i].data, addr >= 0 ? "next();" :"", nextInstr);
            }
            code ~= ctSub( `
                $$`, bailOut);
            break;
        case IR.Char:
            code ~= ctSub( `
                    if(atEnd || front != $$)
                        $$
                    $$
                    $$`, ir[0].data, bailOut, addr >= 0 ? "next();" :"", nextInstr);
            break;
        case IR.Any:
            code ~= ctSub( `
                    if(atEnd || (!(re.flags & RegexOption.singleline)
                                && (front == '\r' || front == '\n')))
                        $$
                    $$
                    $$`, bailOut, addr >= 0 ? "next();" :"",nextInstr);
            break;
        case IR.CodepointSet:
            code ~= ctSub( `
                    if(atEnd || !re.charsets[$$].scanFor(front))
                        $$
                    $$
                $$`, ir[0].data, bailOut, addr >= 0 ? "next();" :"", nextInstr);
            break;
        case IR.Trie:
            code ~= ctSub( `
                    if(atEnd || !re.tries[$$][front])
                        $$
                    $$
                $$`, ir[0].data, bailOut, addr >= 0 ? "next();" :"", nextInstr);
            break;
        case IR.Wordboundary:
            code ~= ctSub( `
                    dchar back;
                    DataIndex bi;
                    if(atStart && wordTrie[front])
                    {
                        $$
                    }
                    else if(atEnd && s.loopBack(index).nextChar(back, bi)
                            && wordTrie[back])
                    {
                        $$
                    }
                    else if(s.loopBack(index).nextChar(back, bi))
                    {
                        bool af = wordTrie[front];
                        bool ab = wordTrie[back];
                        if(af ^ ab)
                        {
                            $$
                        }
                    }
                    $$`, nextInstr, nextInstr, nextInstr, bailOut);
            break;
        case IR.Notwordboundary:
            code ~= ctSub( `
                    dchar back;
                    DataIndex bi;
                    //at start & end of input
                    if(atStart && wordTrie[front])
                        $$
                    else if(atEnd && s.loopBack(index).nextChar(back, bi)
                            && wordTrie[back])
                        $$
                    else if(s.loopBack(index).nextChar(back, bi))
                    {
                        bool af = wordTrie[front];
                        bool ab = wordTrie[back];
                        if(af ^ ab)
                            $$
                    }
                    $$`, bailOut, bailOut, bailOut, nextInstr);

            break;
        case IR.Bol:
            code ~= ctSub(`
                    dchar back;
                    DataIndex bi;
                    if(atStart || ((re.flags & RegexOption.multiline)
                        && s.loopBack(index).nextChar(back,bi)
                        && endOfLine(back, front == '\n')))
                    {
                        debug(std_regex_matcher) writeln("BOL matched");
                        $$
                    }
                    else
                        $$`, nextInstr, bailOut);

            break;
        case IR.Eol:
            code ~= ctSub(`
                    dchar back;
                    DataIndex bi;
                    debug(std_regex_matcher) writefln("EOL (front 0x%x) %s", front, s[index..s.lastIndex]);
                    //no matching inside \r\n
                    if(atEnd || ((re.flags & RegexOption.multiline)
                            && endOfLine(front, s.loopBack(index).nextChar(back,bi)
                             && back == '\r')))
                    {
                        debug(std_regex_matcher) writeln("EOL matched");
                        $$
                    }
                    else
                        $$`, nextInstr, bailOut);

            break;
        case IR.GroupStart:
            code ~= ctSub(`
                    matches[$$].begin = index;
                    $$`, ir[0].data, nextInstr);
            match = ir[0].data+1;
            break;
        case IR.GroupEnd:
            code ~= ctSub(`
                    matches[$$].end = index;
                    $$`, ir[0].data, nextInstr);
            break;
        case IR.Backref:
            string mStr = "auto referenced = ";
            mStr ~= ir[0].localRef
                ? ctSub("s[matches[$$].begin .. matches[$$].end];",
                    ir[0].data, ir[0].data)
                : ctSub("s[backrefed[$$].begin .. backrefed[$$].end];",
                    ir[0].data, ir[0].data);
            code ~= ctSub( `
                    $$
                    while(!atEnd && !referenced.empty && front == referenced.front)
                    {
                        next();
                        referenced.popFront();
                    }
                    if(referenced.empty)
                        $$
                    else
                        $$`, mStr, nextInstr, bailOut);
            break;
        case IR.Nop:
        case IR.End:
            break;
        default:
            assert(0, text(ir[0].mnemonic, " is not supported yet"));
        }
        return code;
    }

    //generate D code for the whole regex
    public string ctGenRegEx(Bytecode[] ir)
    {
        auto bdy = ctGenBlock(ir, 0);
        auto r = `
            with(matcher)
            {
            pc = 0;
            counter = 0;
            lastState = 0;
            auto start = s._index;`;
        r ~= `
            goto StartLoop;
            debug(std_regex_matcher) writeln("Try CT matching  starting at ",s[index..s.lastIndex]);
        L_backtrack:
            if(lastState || prevStack())
            {
                stackPop(pc);
                stackPop(index);
                s.reset(index);
                next();
            }
            else
            {
                s.reset(start);
                return false;
            }
        StartLoop:
            switch(pc)
            {
        `;
        r ~= bdy.code;
        r ~= ctSub(`
                case $$: break;`,bdy.addr);
        r ~= `
            default:
                assert(0);
            }
            return true;
            }
        `;
        return r;
    }

}

string ctGenRegExCode(Char)(Regex!Char re)
{
    auto context = CtContext(re);
    return context.ctGenRegEx(re.ir);
}

//State of VM thread
struct Thread(DataIndex)
{
    Thread* next;    //intrusive linked list
    uint pc;
    uint counter;    //loop counter
    uint uopCounter; //counts micro operations inside one macro instruction (e.g. BackRef)
    Group!DataIndex[1] matches;
}

//head-tail singly-linked list
struct ThreadList(DataIndex)
{
    Thread!DataIndex* tip = null, toe = null;
    //add new thread to the start of list
    void insertFront(Thread!DataIndex* t)
    {
        if(tip)
        {
            t.next = tip;
            tip = t;
        }
        else
        {
            t.next = null;
            tip = toe = t;
        }
    }
    //add new thread to the end of list
    void insertBack(Thread!DataIndex* t)
    {
        if(toe)
        {
            toe.next = t;
            toe = t;
        }
        else
            tip = toe = t;
        toe.next = null;
    }
    //move head element out of list
    Thread!DataIndex* fetch()
    {
        auto t = tip;
        if(tip == toe)
            tip = toe = null;
        else
            tip = tip.next;
        return t;
    }
    //non-destructive iteration of ThreadList
    struct ThreadRange
    {
        const(Thread!DataIndex)* ct;
        this(ThreadList tlist){ ct = tlist.tip; }
        @property bool empty(){ return ct is null; }
        @property const(Thread!DataIndex)* front(){ return ct; }
        @property popFront()
        {
            assert(ct);
            ct = ct.next;
        }
    }
    @property bool empty()
    {
        return tip == null;
    }
    ThreadRange opSlice()
    {
        return ThreadRange(this);
    }
}

//direction parameter for thompson one-shot match evaluator
enum OneShot { Fwd, Bwd };

/+
   Thomspon matcher does all matching in lockstep,
   never looking at the same char twice
+/
@trusted struct ThompsonMatcher(Char, Stream = Input!Char)
    if(is(Char : dchar))
{
    alias DataIndex = Stream.DataIndex;
    Thread!DataIndex* freelist;
    ThreadList!DataIndex clist, nlist;
    DataIndex[] merge;
    Group!DataIndex[] backrefed;
    Regex!Char re;           //regex program
    Stream s;
    dchar front;
    DataIndex index;
    DataIndex genCounter;    //merge trace counter, goes up on every dchar
    size_t[size_t] subCounters; //a table of gen counter per sub-engine: PC -> counter
    size_t threadSize;
    bool matched;
    bool exhausted;
    static if(__traits(hasMember,Stream, "search"))
    {
        enum kicked = true;
    }
    else
        enum kicked = false;

    static size_t getThreadSize(const ref Regex!Char re)
    {
        return re.ngroup
            ? (Thread!DataIndex).sizeof + (re.ngroup-1)*(Group!DataIndex).sizeof
            : (Thread!DataIndex).sizeof - (Group!DataIndex).sizeof;
    }

    static size_t initialMemory(const ref Regex!Char re)
    {
        return getThreadSize(re)*re.threadCount + re.hotspotTableSize*size_t.sizeof;
    }

    //true if it's start of input
    @property bool atStart(){   return index == 0; }

    //true if it's end of input
    @property bool atEnd(){  return index == s.lastIndex && s.atEnd; }

    bool next()
    {
        if(!s.nextChar(front, index))
        {
            index =  s.lastIndex;
            return false;
        }
        return true;
    }

    static if(kicked)
    {
        bool search()
        {

            if(!s.search(re.kickstart, front, index))
            {
                index = s.lastIndex;
                return false;
            }
            return true;
        }
    }

    void initExternalMemory(void[] memory)
    {
        threadSize = getThreadSize(re);
        prepareFreeList(re.threadCount, memory);
        if(re.hotspotTableSize)
        {
            merge = arrayInChunk!(DataIndex)(re.hotspotTableSize, memory);
            merge[] = 0;
        }
    }

    this()(Regex!Char program, Stream stream, void[] memory)
    {
        re = program;
        s = stream;
        initExternalMemory(memory);
        genCounter = 0;
    }

    this(S)(ref ThompsonMatcher!(Char,S) matcher, Bytecode[] piece, Stream stream)
    {
        s = stream;
        re = matcher.re;
        re.ir = piece;
        threadSize = matcher.threadSize;
        merge = matcher.merge;
        freelist = matcher.freelist;
        front = matcher.front;
        index = matcher.index;
    }

    auto fwdMatcher()(Bytecode[] piece, size_t counter)
    {
        auto m = ThompsonMatcher!(Char, Stream)(this, piece, s);
        m.genCounter = counter;
        return m;
    }

    auto bwdMatcher()(Bytecode[] piece, size_t counter)
    {
        alias BackLooper = typeof(s.loopBack(index));
        auto m = ThompsonMatcher!(Char, BackLooper)(this, piece, s.loopBack(index));
        m.genCounter = counter;
        m.next();
        return m;
    }

    auto dupTo(void[] memory)
    {
        typeof(this) tmp = this;//bitblit
        tmp.initExternalMemory(memory);
        tmp.genCounter = 0;
        return tmp;
    }

    enum MatchResult{
        NoMatch,
        PartialMatch,
        Match,
    }

    bool match(Group!DataIndex[] matches)
    {
        debug(std_regex_matcher)
            writeln("------------------------------------------");
        if(exhausted)
        {
            return false;
        }
        if(re.flags & RegexInfo.oneShot)
        {
            next();
            exhausted = true;
            return matchOneShot(matches)==MatchResult.Match;
        }
        static if(kicked)
            if(!re.kickstart.empty)
                return matchImpl!(true)(matches);
        return matchImpl!(false)(matches);
    }

    //match the input and fill matches
    bool matchImpl(bool withSearch)(Group!DataIndex[] matches)
    {
        if(!matched && clist.empty)
        {
           static if(withSearch)
                search();
           else
                next();
        }
        else//char in question is  fetched in prev call to match
        {
            matched = false;
        }

        if(!atEnd)//if no char
            for(;;)
            {
                genCounter++;
                debug(std_regex_matcher)
                {
                    writefln("Threaded matching threads at  %s", s[index..s.lastIndex]);
                    foreach(t; clist[])
                    {
                        assert(t);
                        writef("pc=%s ",t.pc);
                        write(t.matches);
                        writeln();
                    }
                }
                for(Thread!DataIndex* t = clist.fetch(); t; t = clist.fetch())
                {
                    eval!true(t, matches);
                }
                if(!matched)//if we already have match no need to push the engine
                    eval!true(createStart(index), matches);//new thread staring at this position
                else if(nlist.empty)
                {
                    debug(std_regex_matcher) writeln("Stopped  matching before consuming full input");
                    break;//not a partial match for sure
                }
                clist = nlist;
                nlist = (ThreadList!DataIndex).init;
                if(clist.tip is null)
                {
                    static if(withSearch)
                    {
                        if(!search())
                            break;
                    }
                    else
                    {
                        if(!next())
                            break;
                    }
                }
                else if(!next())
                {
                    if (!atEnd) return false;
                    exhausted = true;
                    break;
                }
            }

        genCounter++; //increment also on each end
        debug(std_regex_matcher) writefln("Threaded matching threads at end");
        //try out all zero-width posibilities
        for(Thread!DataIndex* t = clist.fetch(); t; t = clist.fetch())
        {
            eval!false(t, matches);
        }
        if(!matched)
            eval!false(createStart(index), matches);//new thread starting at end of input
        if(matched)
        {//in case NFA found match along the way
         //and last possible longer alternative ultimately failed
            s.reset(matches[0].end);//reset to last successful match
            next();//and reload front character
            //--- here the exact state of stream was restored ---
            exhausted = atEnd || !(re.flags & RegexOption.global);
            //+ empty match advances the input
            if(!exhausted && matches[0].begin == matches[0].end)
                next();
        }
        return matched;
    }

    /+
        handle succesful threads
    +/
    void finish(const(Thread!DataIndex)* t, Group!DataIndex[] matches)
    {
        matches.ptr[0..re.ngroup] = t.matches.ptr[0..re.ngroup];
        debug(std_regex_matcher)
        {
            writef("FOUND pc=%s prog_len=%s",
                    t.pc, re.ir.length);
            if(!matches.empty)
                writefln(": %s..%s", matches[0].begin, matches[0].end);
            foreach(v; matches)
                writefln("%d .. %d", v.begin, v.end);
        }
        matched = true;
    }

    /+
        match thread against codepoint, cutting trough all 0-width instructions
        and taking care of control flow, then add it to nlist
    +/
    void eval(bool withInput)(Thread!DataIndex* t, Group!DataIndex[] matches)
    {
        ThreadList!DataIndex worklist;
        debug(std_regex_matcher) writeln("---- Evaluating thread");
        for(;;)
        {
            debug(std_regex_matcher)
            {
                writef("\tpc=%s [", t.pc);
                foreach(x; worklist[])
                    writef(" %s ", x.pc);
                writeln("]");
            }
            switch(re.ir[t.pc].code)
            {
            case IR.End:
                finish(t, matches);
                matches[0].end = index; //fix endpoint of the whole match
                recycle(t);
                //cut off low priority threads
                recycle(clist);
                recycle(worklist);
                debug(std_regex_matcher) writeln("Finished thread ", matches);
                return;
            case IR.Wordboundary:
                dchar back;
                DataIndex bi;
                //at start & end of input
                if(atStart && wordTrie[front])
                {
                    t.pc += IRL!(IR.Wordboundary);
                    break;
                }
                else if(atEnd && s.loopBack(index).nextChar(back, bi)
                        && wordTrie[back])
                {
                    t.pc += IRL!(IR.Wordboundary);
                    break;
                }
                else if(s.loopBack(index).nextChar(back, bi))
                {
                    bool af = wordTrie[front];
                    bool ab = wordTrie[back];
                    if(af ^ ab)
                    {
                        t.pc += IRL!(IR.Wordboundary);
                        break;
                    }
                }
                recycle(t);
                t = worklist.fetch();
                if(!t)
                    return;
                break;
            case IR.Notwordboundary:
                dchar back;
                DataIndex bi;
                //at start & end of input
                if(atStart && wordTrie[front])
                {
                    recycle(t);
                    t = worklist.fetch();
                    if(!t)
                        return;
                    break;
                }
                else if(atEnd && s.loopBack(index).nextChar(back, bi)
                        && wordTrie[back])
                {
                    recycle(t);
                    t = worklist.fetch();
                    if(!t)
                        return;
                    break;
                }
                else if(s.loopBack(index).nextChar(back, bi))
                {
                    bool af = wordTrie[front];
                    bool ab = wordTrie[back]  != 0;
                    if(af ^ ab)
                    {
                        recycle(t);
                        t = worklist.fetch();
                        if(!t)
                            return;
                        break;
                    }
                }
                t.pc += IRL!(IR.Wordboundary);
                break;
            case IR.Bol:
                dchar back;
                DataIndex bi;
                if(atStart
                    ||( (re.flags & RegexOption.multiline)
                    && s.loopBack(index).nextChar(back,bi)
                    && startOfLine(back, front == '\n')))
                {
                    t.pc += IRL!(IR.Bol);
                }
                else
                {
                    recycle(t);
                    t = worklist.fetch();
                    if(!t)
                        return;
                }
                break;
            case IR.Eol:
                debug(std_regex_matcher) writefln("EOL (front 0x%x) %s",  front, s[index..s.lastIndex]);
                dchar back;
                DataIndex bi;
                //no matching inside \r\n
                if(atEnd || ((re.flags & RegexOption.multiline)
                    && endOfLine(front, s.loopBack(index).nextChar(back, bi)
                        && back == '\r')))
                {
                    t.pc += IRL!(IR.Eol);
                }
                else
                {
                    recycle(t);
                    t = worklist.fetch();
                    if(!t)
                        return;
                }
                break;
            case IR.InfiniteStart, IR.InfiniteQStart:
                t.pc += re.ir[t.pc].data + IRL!(IR.InfiniteStart);
                goto case IR.InfiniteEnd; //both Q and non-Q
            case IR.RepeatStart, IR.RepeatQStart:
                t.pc += re.ir[t.pc].data + IRL!(IR.RepeatStart);
                goto case IR.RepeatEnd; //both Q and non-Q
            case IR.RepeatEnd:
            case IR.RepeatQEnd:
                //len, step, min, max
                uint len = re.ir[t.pc].data;
                uint step =  re.ir[t.pc+2].raw;
                uint min = re.ir[t.pc+3].raw;
                if(t.counter < min)
                {
                    t.counter += step;
                    t.pc -= len;
                    break;
                }
                if(merge[re.ir[t.pc + 1].raw+t.counter] < genCounter)
                {
                    debug(std_regex_matcher) writefln("A thread(pc=%s) passed there : %s ; GenCounter=%s mergetab=%s",
                                    t.pc, index, genCounter, merge[re.ir[t.pc + 1].raw+t.counter] );
                    merge[re.ir[t.pc + 1].raw+t.counter] = genCounter;
                }
                else
                {
                    debug(std_regex_matcher) writefln("A thread(pc=%s) got merged there : %s ; GenCounter=%s mergetab=%s",
                                    t.pc, index, genCounter, merge[re.ir[t.pc + 1].raw+t.counter] );
                    recycle(t);
                    t = worklist.fetch();
                    if(!t)
                        return;
                    break;
                }
                uint max = re.ir[t.pc+4].raw;
                if(t.counter < max)
                {
                    if(re.ir[t.pc].code == IR.RepeatEnd)
                    {
                        //queue out-of-loop thread
                        worklist.insertFront(fork(t, t.pc + IRL!(IR.RepeatEnd),  t.counter % step));
                        t.counter += step;
                        t.pc -= len;
                    }
                    else
                    {
                        //queue into-loop thread
                        worklist.insertFront(fork(t, t.pc - len,  t.counter + step));
                        t.counter %= step;
                        t.pc += IRL!(IR.RepeatEnd);
                    }
                }
                else
                {
                    t.counter %= step;
                    t.pc += IRL!(IR.RepeatEnd);
                }
                break;
            case IR.InfiniteEnd:
            case IR.InfiniteQEnd:
                if(merge[re.ir[t.pc + 1].raw+t.counter] < genCounter)
                {
                    debug(std_regex_matcher) writefln("A thread(pc=%s) passed there : %s ; GenCounter=%s mergetab=%s",
                                    t.pc, index, genCounter, merge[re.ir[t.pc + 1].raw+t.counter] );
                    merge[re.ir[t.pc + 1].raw+t.counter] = genCounter;
                }
                else
                {
                    debug(std_regex_matcher) writefln("A thread(pc=%s) got merged there : %s ; GenCounter=%s mergetab=%s",
                                    t.pc, index, genCounter, merge[re.ir[t.pc + 1].raw+t.counter] );
                    recycle(t);
                    t = worklist.fetch();
                    if(!t)
                        return;
                    break;
                }
                uint len = re.ir[t.pc].data;
                uint pc1, pc2; //branches to take in priority order
                if(re.ir[t.pc].code == IR.InfiniteEnd)
                {
                    pc1 = t.pc - len;
                    pc2 = t.pc + IRL!(IR.InfiniteEnd);
                }
                else
                {
                    pc1 = t.pc + IRL!(IR.InfiniteEnd);
                    pc2 = t.pc - len;
                }
                static if(withInput)
                {
                    int test = quickTestFwd(pc1, front, re);
                    if(test >= 0)
                    {
                        worklist.insertFront(fork(t, pc2, t.counter));
                        t.pc = pc1;
                    }
                    else
                        t.pc = pc2;
                }
                else
                {
                    worklist.insertFront(fork(t, pc2, t.counter));
                    t.pc = pc1;
                }
                break;
            case IR.OrEnd:
                if(merge[re.ir[t.pc + 1].raw+t.counter] < genCounter)
                {
                    debug(std_regex_matcher) writefln("A thread(pc=%s) passed there : %s ; GenCounter=%s mergetab=%s",
                                    t.pc, s[index .. s.lastIndex], genCounter, merge[re.ir[t.pc + 1].raw + t.counter] );
                    merge[re.ir[t.pc + 1].raw+t.counter] = genCounter;
                    t.pc += IRL!(IR.OrEnd);
                }
                else
                {
                    debug(std_regex_matcher) writefln("A thread(pc=%s) got merged there : %s ; GenCounter=%s mergetab=%s",
                                    t.pc, s[index .. s.lastIndex], genCounter, merge[re.ir[t.pc + 1].raw + t.counter] );
                    recycle(t);
                    t = worklist.fetch();
                    if(!t)
                        return;
                }
                break;
            case IR.OrStart:
                t.pc += IRL!(IR.OrStart);
                goto case;
            case IR.Option:
                uint next = t.pc + re.ir[t.pc].data + IRL!(IR.Option);
                //queue next Option
                if(re.ir[next].code == IR.Option)
                {
                    worklist.insertFront(fork(t, next, t.counter));
                }
                t.pc += IRL!(IR.Option);
                break;
            case IR.GotoEndOr:
                t.pc = t.pc + re.ir[t.pc].data + IRL!(IR.GotoEndOr);
                goto case IR.OrEnd;
            case IR.GroupStart:
                uint n = re.ir[t.pc].data;
                t.matches.ptr[n].begin = index;
                t.pc += IRL!(IR.GroupStart);
                break;
            case IR.GroupEnd:
                uint n = re.ir[t.pc].data;
                t.matches.ptr[n].end = index;
                t.pc += IRL!(IR.GroupEnd);
                break;
            case IR.Backref:
                uint n = re.ir[t.pc].data;
                Group!DataIndex* source = re.ir[t.pc].localRef ? t.matches.ptr : backrefed.ptr;
                assert(source);
                if(source[n].begin == source[n].end)//zero-width Backref!
                {
                    t.pc += IRL!(IR.Backref);
                }
                else static if(withInput)
                {
                    size_t idx = source[n].begin + t.uopCounter;
                    size_t end = source[n].end;
                    if(s[idx..end].front == front)
                    {
                        t.uopCounter += std.utf.stride(s[idx..end], 0);
                        if(t.uopCounter + source[n].begin == source[n].end)
                        {//last codepoint
                            t.pc += IRL!(IR.Backref);
                            t.uopCounter = 0;
                        }
                        nlist.insertBack(t);
                    }
                    else
                        recycle(t);
                    t = worklist.fetch();
                    if(!t)
                        return;
                    break;
                }
                else
                {
                    recycle(t);
                    t = worklist.fetch();
                    if(!t)
                        return;
                    break;
                }
                break;
            case IR.LookbehindStart:
            case IR.NeglookbehindStart:
                uint len = re.ir[t.pc].data;
                uint ms = re.ir[t.pc + 1].raw, me = re.ir[t.pc + 2].raw;
                uint end = t.pc + len + IRL!(IR.LookbehindEnd) + IRL!(IR.LookbehindStart);
                bool positive = re.ir[t.pc].code == IR.LookbehindStart;
                static if(Stream.isLoopback)
                    auto matcher = fwdMatcher(re.ir[t.pc .. end], subCounters.get(t.pc, 0));
                else
                    auto matcher = bwdMatcher(re.ir[t.pc .. end], subCounters.get(t.pc, 0));
                matcher.re.ngroup = me - ms;
                matcher.backrefed = backrefed.empty ? t.matches : backrefed;
                //backMatch
                auto mRes = matcher.matchOneShot(t.matches.ptr[ms .. me], IRL!(IR.LookbehindStart));
                freelist = matcher.freelist;
                subCounters[t.pc] = matcher.genCounter;
                if((mRes == MatchResult.Match) ^ positive)
                {
                    recycle(t);
                    t = worklist.fetch();
                    if(!t)
                        return;
                    break;
                }
                else
                    t.pc = end;
                break;
            case IR.LookaheadStart:
            case IR.NeglookaheadStart:
                auto save = index;
                uint len = re.ir[t.pc].data;
                uint ms = re.ir[t.pc+1].raw, me = re.ir[t.pc+2].raw;
                uint end = t.pc+len+IRL!(IR.LookaheadEnd)+IRL!(IR.LookaheadStart);
                bool positive = re.ir[t.pc].code == IR.LookaheadStart;
                static if(Stream.isLoopback)
                    auto matcher = bwdMatcher(re.ir[t.pc .. end], subCounters.get(t.pc, 0));
                else
                    auto matcher = fwdMatcher(re.ir[t.pc .. end], subCounters.get(t.pc, 0));
                matcher.re.ngroup = me - ms;
                matcher.backrefed = backrefed.empty ? t.matches : backrefed;
                auto mRes = matcher.matchOneShot(t.matches.ptr[ms .. me], IRL!(IR.LookaheadStart));
                freelist = matcher.freelist;
                subCounters[t.pc] = matcher.genCounter;
                s.reset(index);
                next();
                if((mRes == MatchResult.Match) ^ positive)
                {
                    recycle(t);
                    t = worklist.fetch();
                    if(!t)
                        return;
                    break;
                }
                else
                    t.pc = end;
                break;
            case IR.LookaheadEnd:
            case IR.NeglookaheadEnd:
            case IR.LookbehindEnd:
            case IR.NeglookbehindEnd:
                finish(t, matches.ptr[0 .. re.ngroup]);
                recycle(t);
                //cut off low priority threads
                recycle(clist);
                recycle(worklist);
                return;
            case IR.Nop:
                t.pc += IRL!(IR.Nop);
                break;

                static if(withInput)
                {
            case IR.OrChar:
                      uint len = re.ir[t.pc].sequence;
                      uint end = t.pc + len;
                      static assert(IRL!(IR.OrChar) == 1);
                      for(; t.pc < end; t.pc++)
                          if(re.ir[t.pc].data == front)
                              break;
                      if(t.pc != end)
                      {
                          t.pc = end;
                          nlist.insertBack(t);
                      }
                      else
                          recycle(t);
                      t = worklist.fetch();
                      if(!t)
                          return;
                      break;
            case IR.Char:
                      if(front == re.ir[t.pc].data)
                      {
                          t.pc += IRL!(IR.Char);
                          nlist.insertBack(t);
                      }
                      else
                          recycle(t);
                      t = worklist.fetch();
                      if(!t)
                          return;
                      break;
            case IR.Any:
                      t.pc += IRL!(IR.Any);
                      if(!(re.flags & RegexOption.singleline)
                              && (front == '\r' || front == '\n'))
                          recycle(t);
                      else
                          nlist.insertBack(t);
                      t = worklist.fetch();
                      if(!t)
                          return;
                      break;
            case IR.CodepointSet:
                      if(re.charsets[re.ir[t.pc].data].scanFor(front))
                      {
                          t.pc += IRL!(IR.CodepointSet);
                          nlist.insertBack(t);
                      }
                      else
                      {
                          recycle(t);
                      }
                      t = worklist.fetch();
                      if(!t)
                          return;
                      break;
            case IR.Trie:
                      if(re.tries[re.ir[t.pc].data][front])
                      {
                          t.pc += IRL!(IR.Trie);
                          nlist.insertBack(t);
                      }
                      else
                      {
                          recycle(t);
                      }
                      t = worklist.fetch();
                      if(!t)
                          return;
                      break;
                  default:
                      assert(0, "Unrecognized instruction " ~ re.ir[t.pc].mnemonic);
                }
                else
                {
                    default:
                        recycle(t);
                        t = worklist.fetch();
                        if(!t)
                            return;
                }
            }
        }

    }
    enum uint RestartPc = uint.max;
    //match the input, evaluating IR without searching
    MatchResult matchOneShot(Group!DataIndex[] matches, uint startPc = 0)
    {
        debug(std_regex_matcher)
        {
            writefln("---------------single shot match ----------------- ");
        }
        alias evalFn = eval;
        assert(clist == (ThreadList!DataIndex).init || startPc == RestartPc); // incorrect after a partial match
        assert(nlist == (ThreadList!DataIndex).init || startPc == RestartPc);
        if(!atEnd)//if no char
        {
            debug(std_regex_matcher)
            {
                writefln("-- Threaded matching threads at  %s",  s[index..s.lastIndex]);
            }
            if(startPc!=RestartPc)
            {
                auto startT = createStart(index, startPc);
                genCounter++;
                evalFn!true(startT, matches);
            }
            for(;;)
            {
                debug(std_regex_matcher) writeln("\n-- Started iteration of main cycle");
                genCounter++;
                debug(std_regex_matcher)
                {
                    foreach(t; clist[])
                    {
                        assert(t);
                    }
                }
                for(Thread!DataIndex* t = clist.fetch(); t; t = clist.fetch())
                {
                    evalFn!true(t, matches);
                }
                if(nlist.empty)
                {
                    debug(std_regex_matcher) writeln("Stopped  matching before consuming full input");
                    break;//not a partial match for sure
                }
                clist = nlist;
                nlist = (ThreadList!DataIndex).init;
                if(!next())
                {
                    if (!atEnd) return MatchResult.PartialMatch;
                    break;
                }
                debug(std_regex_matcher) writeln("-- Ended iteration of main cycle\n");
            }
        }
        genCounter++; //increment also on each end
        debug(std_regex_matcher) writefln("-- Matching threads at end");
        //try out all zero-width posibilities
        for(Thread!DataIndex* t = clist.fetch(); t; t = clist.fetch())
        {
            evalFn!false(t, matches);
        }
        if(!matched)
            evalFn!false(createStart(index, startPc), matches);

        return (matched?MatchResult.Match:MatchResult.NoMatch);
    }

    //get a dirty recycled Thread
    Thread!DataIndex* allocate()
    {
        assert(freelist, "not enough preallocated memory");
        Thread!DataIndex* t = freelist;
        freelist = freelist.next;
        return t;
    }

    //link memory into a free list of Threads
    void prepareFreeList(size_t size, ref void[] memory)
    {
        void[] mem = memory[0 .. threadSize*size];
        memory = memory[threadSize * size .. $];
        freelist = cast(Thread!DataIndex*)&mem[0];
        size_t i;
        for(i = threadSize; i < threadSize*size; i += threadSize)
            (cast(Thread!DataIndex*)&mem[i-threadSize]).next = cast(Thread!DataIndex*)&mem[i];
        (cast(Thread!DataIndex*)&mem[i-threadSize]).next = null;
    }

    //dispose a thread
    void recycle(Thread!DataIndex* t)
    {
        t.next = freelist;
        freelist = t;
    }

    //dispose list of threads
    void recycle(ref ThreadList!DataIndex list)
    {
        auto t = list.tip;
        while(t)
        {
            auto next = t.next;
            recycle(t);
            t = next;
        }
        list = list.init;
    }

    //creates a copy of master thread with given pc
    Thread!DataIndex* fork(Thread!DataIndex* master, uint pc, uint counter)
    {
        auto t = allocate();
        t.matches.ptr[0..re.ngroup] = master.matches.ptr[0..re.ngroup];
        t.pc = pc;
        t.counter = counter;
        t.uopCounter = 0;
        return t;
    }

    //creates a start thread
    Thread!DataIndex* createStart(DataIndex index, uint pc = 0)
    {
        auto t = allocate();
        t.matches.ptr[0..re.ngroup] = (Group!DataIndex).init;
        t.matches[0].begin = index;
        t.pc = pc;
        t.counter = 0;
        t.uopCounter = 0;
        return t;
    }
}

/++
    $(D Captures) object contains submatches captured during a call
    to $(D match) or iteration over $(D RegexMatch) range.

    First element of range is the whole match.
+/
@trusted public struct Captures(R, DIndex = size_t)
    if(isSomeString!R)
{//@trusted because of union inside
    alias DataIndex = DIndex;
    alias String = R;
private:
    R _input;
    bool _empty;
    enum smallString = 3;
    union
    {
        Group!DataIndex[] big_matches;
        Group!DataIndex[smallString] small_matches;
    }
    uint _f, _b;
    uint _ngroup;
    NamedGroup[] _names;

    this()(R input, uint ngroups, NamedGroup[] named)
    {
        _input = input;
        _ngroup = ngroups;
        _names = named;
        newMatches();
        _b = _ngroup;
        _f = 0;
    }

    this(alias Engine)(ref RegexMatch!(R,Engine) rmatch)
    {
        _input = rmatch._input;
        _ngroup = rmatch._engine.re.ngroup;
        _names = rmatch._engine.re.dict;
        newMatches();
        _b = _ngroup;
        _f = 0;
    }

    @property Group!DataIndex[] matches()
    {
       return _ngroup > smallString ? big_matches : small_matches[0 .. _ngroup];
    }

    void newMatches()
    {
        if(_ngroup > smallString)
            big_matches = new Group!DataIndex[_ngroup];
    }

public:
    ///Slice of input prior to the match.
    @property R pre()
    {
        return _empty ? _input[] : _input[0 .. matches[0].begin];
    }

    ///Slice of input immediately after the match.
    @property R post()
    {
        return _empty ? _input[] : _input[matches[0].end .. $];
    }

    ///Slice of matched portion of input.
    @property R hit()
    {
        assert(!_empty);
        return _input[matches[0].begin .. matches[0].end];
    }

    ///Range interface.
    @property R front()
    {
        assert(!empty);
        return _input[matches[_f].begin .. matches[_f].end];
    }

    ///ditto
    @property R back()
    {
        assert(!empty);
        return _input[matches[_b - 1].begin .. matches[_b - 1].end];
    }

    ///ditto
    void popFront()
    {
        assert(!empty);
        ++_f;
    }

    ///ditto
    void popBack()
    {
        assert(!empty);
        --_b;
    }

    ///ditto
    @property bool empty() const { return _empty || _f >= _b; }

    ///ditto
    R opIndex()(size_t i) /*const*/ //@@@BUG@@@
    {
        assert(_f + i < _b,text("requested submatch number ", i," is out of range"));
        assert(matches[_f + i].begin <= matches[_f + i].end,
            text("wrong match: ", matches[_f + i].begin, "..", matches[_f + i].end));
        return _input[matches[_f + i].begin .. matches[_f + i].end];
    }

    /++
        Explicit cast to bool.
        Useful as a shorthand for !(x.empty) in if and assert statements.

        ---
        import std.regex;

        assert(!matchFirst("nothing", "something"));
        ---
    +/

    @safe bool opCast(T:bool)() const nothrow { return !empty; }

    /++
        Lookup named submatch.

        ---
        import std.regex;
        import std.range;

        auto c = matchFirst("a = 42;", regex(`(?P<var>\w+)\s*=\s*(?P<value>\d+);`));
        assert(c["var"] == "a");
        assert(c["value"] == "42");
        popFrontN(c, 2);
        //named groups are unaffected by range primitives
        assert(c["var"] =="a");
        assert(c.front == "42");
        ----
    +/
    R opIndex(String)(String i) /*const*/ //@@@BUG@@@
        if(isSomeString!String)
    {
        size_t index = lookupNamedGroup(_names, i);
        return _input[matches[index].begin .. matches[index].end];
    }

    ///Number of matches in this object.
    @property size_t length() const { return _empty ? 0 : _b - _f;  }

    ///A hook for compatibility with original std.regex.
    @property ref captures(){ return this; }
}

///
unittest
{
    auto c = matchFirst("@abc#", regex(`(\w)(\w)(\w)`));
    assert(c.pre == "@"); // Part of input preceding match
    assert(c.post == "#"); // Immediately after match
    assert(c.hit == c[0] && c.hit == "abc"); // The whole match
    assert(c[2] == "b");
    assert(c.front == "abc");
    c.popFront();
    assert(c.front == "a");
    assert(c.back == "c");
    c.popBack();
    assert(c.back == "b");
    popFrontN(c, 2);
    assert(c.empty);

    assert(!matchFirst("nothing", "something"));
}

/++
    A regex engine state, as returned by $(D match) family of functions.

    Effectively it's a forward range of Captures!R, produced
    by lazily searching for matches in a given input.

    $(D alias Engine) specifies an engine type to use during matching,
    and is automatically deduced in a call to $(D match)/$(D bmatch).
+/
@trusted public struct RegexMatch(R, alias Engine = ThompsonMatcher)
    if(isSomeString!R)
{
private:
    alias Char = BasicElementOf!R;
    alias EngineType = Engine!Char;
    EngineType _engine;
    R _input;
    Captures!(R,EngineType.DataIndex) _captures;
    void[] _memory;//is ref-counted

    this(RegEx)(R input, RegEx prog)
    {
        _input = input;
        immutable size = EngineType.initialMemory(prog)+size_t.sizeof;
        _memory = (enforce(malloc(size))[0..size]);
        scope(failure) free(_memory.ptr);
        *cast(size_t*)_memory.ptr = 1;
        _engine = EngineType(prog, Input!Char(input), _memory[size_t.sizeof..$]);
        static if(is(RegEx == StaticRegex!(BasicElementOf!R)))
            _engine.nativeFn = prog.nativeFn;
        _captures = Captures!(R,EngineType.DataIndex)(this);
        _captures._empty = !_engine.match(_captures.matches);
        debug(std_regex_allocation) writefln("RefCount (ctor): %x %d", _memory.ptr, counter);
    }

    @property ref size_t counter(){ return *cast(size_t*)_memory.ptr; }
public:
    this(this)
    {
        if(_memory.ptr)
        {
            ++counter;
            debug(std_regex_allocation) writefln("RefCount (postblit): %x %d",
                _memory.ptr, *cast(size_t*)_memory.ptr);
        }
    }

    ~this()
    {
        if(_memory.ptr && --*cast(size_t*)_memory.ptr == 0)
        {
            debug(std_regex_allocation) writefln("RefCount (dtor): %x %d",
                _memory.ptr, *cast(size_t*)_memory.ptr);
            free(cast(void*)_memory.ptr);
        }
    }

    ///Shorthands for front.pre, front.post, front.hit.
    @property R pre()
    {
        return _captures.pre;
    }

    ///ditto
    @property R post()
    {
        return _captures.post;
    }

    ///ditto
    @property R hit()
    {
        return _captures.hit;
    }

    /++
        Functionality for processing subsequent matches of global regexes via range interface:
        ---
        import std.regex;
        auto m = matchAll("Hello, world!", regex(`\w+`));
        assert(m.front.hit == "Hello");
        m.popFront();
        assert(m.front.hit == "world");
        m.popFront();
        assert(m.empty);
        ---
    +/
    @property auto front()
    {
        return _captures;
    }

    ///ditto
    void popFront()
    {

        if(counter != 1)
        {//do cow magic first
            counter--;//we abandon this reference
            immutable size = EngineType.initialMemory(_engine.re)+size_t.sizeof;
            _memory = (enforce(malloc(size))[0..size]);
            _engine = _engine.dupTo(_memory[size_t.sizeof..size]);
            counter = 1;//points to new chunk
        }
        //previous _captures can have escaped references from Capture object
        _captures.newMatches();
        _captures._empty = !_engine.match(_captures.matches);
    }

    ///ditto
    auto save(){ return this; }

    ///Test if this match object is empty.
    @property bool empty(){ return _captures._empty; }

    ///Same as !(x.empty), provided for its convenience  in conditional statements.
    T opCast(T:bool)(){ return !empty; }

    /// Same as .front, provided for compatibility with original std.regex.
    @property auto captures(){ return _captures; }

}

private @trusted auto matchOnce(alias Engine, RegEx, R)(R input, RegEx re)
{
    alias Char = BasicElementOf!R;
    alias EngineType = Engine!Char;

    size_t size = EngineType.initialMemory(re);
    void[] memory = enforce(malloc(size))[0..size];
    scope(exit) free(memory.ptr);
    auto captures = Captures!(R, EngineType.DataIndex)(input, re.ngroup, re.dict);
    auto engine = EngineType(re, Input!Char(input), memory);
    static if(is(RegEx == StaticRegex!(BasicElementOf!R)))
        engine.nativeFn = re.nativeFn;
    captures._empty = !engine.match(captures.matches);
    return captures;
}

private auto matchMany(alias Engine, RegEx, R)(R input, RegEx re)
{
    re.flags |= RegexOption.global;
    return RegexMatch!(R, Engine)(input, re);
}

unittest
{
    //sanity checks for new API
    auto re = regex("abc");
    assert(!"abc".matchOnce!(ThompsonMatcher)(re).empty);
    assert("abc".matchOnce!(ThompsonMatcher)(re)[0] == "abc");
}
/++
    Compile regular expression pattern for the later execution.
    Returns: $(D Regex) object that works on inputs having
    the same character width as $(D pattern).

    Params:
    pattern = Regular expression
    flags = The _attributes (g, i, m and x accepted)

    Throws: $(D RegexException) if there were any errors during compilation.
+/
@trusted public auto regex(S)(S pattern, const(char)[] flags="")
    if(isSomeString!(S))
{
    enum cacheSize = 8; //TODO: invent nice interface to control regex caching
    if(__ctfe)
        return regexImpl(pattern, flags);
    return memoize!(regexImpl!S, cacheSize)(pattern, flags);
}

public auto regexImpl(S)(S pattern, const(char)[] flags="")
    if(isSomeString!(S))
{
    auto parser = Parser!(Unqual!(typeof(pattern)))(pattern, flags);
    auto r = parser.program;
    return r;
}


template ctRegexImpl(alias pattern, string flags=[])
{
    enum r = regex(pattern, flags);
    alias Char = BasicElementOf!(typeof(pattern));
    enum source = ctGenRegExCode(r);
    alias Matcher = BacktrackingMatcher!(true);
    @trusted bool func(ref Matcher!Char matcher)
    {
        debug(std_regex_ctr) pragma(msg, source);
        mixin(source);
    }
    enum nr = StaticRegex!Char(r, &func);
}

/++
    Compile regular expression using CTFE
    and generate optimized native machine code for matching it.

    Returns: StaticRegex object for faster matching.

    Params:
    pattern = Regular expression
    flags = The _attributes (g, i, m and x accepted)
+/
public enum ctRegex(alias pattern, alias flags=[]) = ctRegexImpl!(pattern, flags).nr;

enum isRegexFor(RegEx, R) = is(RegEx == Regex!(BasicElementOf!R))
     || is(RegEx == StaticRegex!(BasicElementOf!R));

/++
    Start matching $(D input) to regex pattern $(D re),
    using Thompson NFA matching scheme.

    The use of this function is $(RED discouraged) - use either of
    $(LREF matchAll) or $(LREF matchFirst).

    Delegating  the kind of operation
    to "g" flag is soon to be phased out along with the
    ability to choose the exact matching scheme. The choice of
    matching scheme to use depends highly on the pattern kind and
    can done automatically on case by case basis.

    Returns: a $(D RegexMatch) object holding engine state after first match.
+/

public auto match(R, RegEx)(R input, RegEx re)
    if(isSomeString!R && is(RegEx == Regex!(BasicElementOf!R)))
{
    return RegexMatch!(Unqual!(typeof(input)),ThompsonMatcher)(input, re);
}

///ditto
public auto match(R, String)(R input, String re)
    if(isSomeString!R && isSomeString!String)
{
    return RegexMatch!(Unqual!(typeof(input)),ThompsonMatcher)(input, regex(re));
}

public auto match(R, RegEx)(R input, RegEx re)
    if(isSomeString!R && is(RegEx == StaticRegex!(BasicElementOf!R)))
{
    return RegexMatch!(Unqual!(typeof(input)),BacktrackingMatcher!true)(input, re);
}

/++
    Find the first (leftmost) slice of the $(D input) that
    matches the pattern $(D re). This function picks the most suitable
    regular expression engine depending on the pattern properties.

    $(D re) parameter can be one of three types:
    $(UL
      $(LI Plain string, in which case it's compiled to bytecode before matching. )
      $(LI Regex!char (wchar/dchar) that contains a pattern in the form of
        compiled  bytecode. )
      $(LI StaticRegex!char (wchar/dchar) that contains a pattern in the form of
        compiled native machine code. )
    )

    Returns:
    $(LREF Captures) containing the extent of a match together with all submatches
    if there was a match, otherwise an empty $(LREF Captures) object.
+/
public auto matchFirst(R, RegEx)(R input, RegEx re)
    if(isSomeString!R && is(RegEx == Regex!(BasicElementOf!R)))
{
    return matchOnce!ThompsonMatcher(input, re);
}

///ditto
public auto matchFirst(R, String)(R input, String re)
    if(isSomeString!R && isSomeString!String)
{
    return matchOnce!ThompsonMatcher(input, regex(re));
}

public auto matchFirst(R, RegEx)(R input, RegEx re)
    if(isSomeString!R && is(RegEx == StaticRegex!(BasicElementOf!R)))
{
    return matchOnce!(BacktrackingMatcher!true)(input, re);
}

/++
    Initiate a search for all non-overlapping matches to the pattern $(D re)
    in the given $(D input). The result is a lazy range of matches generated
    as they are encountered in the input going left to right.

    This function picks the most suitable regular expression engine
    depending on the pattern properties.

    $(D re) parameter can be one of three types:
    $(UL
      $(LI Plain string, in which case it's compiled to bytecode before matching. )
      $(LI Regex!char (wchar/dchar) that contains a pattern in the form of
        compiled  bytecode. )
      $(LI StaticRegex!char (wchar/dchar) that contains a pattern in the form of
        compiled native machine code. )
    )

    Returns:
    $(LREF RegexMatch) object that represents matcher state
    after the first match was found or an empty one if not present.
+/
public auto matchAll(R, RegEx)(R input, RegEx re)
    if(isSomeString!R && is(RegEx == Regex!(BasicElementOf!R)))
{
    return matchMany!ThompsonMatcher(input, re);
}

///ditto
public auto matchAll(R, String)(R input, String re)
    if(isSomeString!R && isSomeString!String)
{
    return matchMany!ThompsonMatcher(input, regex(re));
}

public auto matchAll(R, RegEx)(R input, RegEx re)
    if(isSomeString!R && is(RegEx == StaticRegex!(BasicElementOf!R)))
{
    return matchMany!(BacktrackingMatcher!true)(input, re);
}

// another set of tests just to cover the new API
@system unittest
{
    foreach(String; TypeTuple!(string, wstring, const(dchar)[]))
    {
        auto str1 = "blah-bleh".to!String();
        auto pat1 = "bl[ae]h".to!String();
        auto mf = matchFirst(str1, pat1);
        assert(mf.equal(["blah".to!String()]));
        auto mAll = matchAll(str1, pat1);
        assert(mAll.equal!((a,b) => a.equal(b))
            ([["blah".to!String()], ["bleh".to!String()]]));

        auto str2 = "1/03/12 - 3/03/12".to!String();
        auto pat2 = regex(r"(\d+)/(\d+)/(\d+)".to!String());
        auto mf2 = matchFirst(str2, pat2);
        assert(mf2.equal(["1/03/12", "1", "03", "12"].map!(to!String)()));
        auto mAll2 = matchAll(str2, pat2);
        assert(mAll2.front.equal(mf2));
        mAll2.popFront();
        assert(mAll2.front.equal(["3/03/12", "3", "03", "12"].map!(to!String)()));
        mf2.popFrontN(3);
        assert(mf2.equal(["12".to!String()]));

        auto ctPat = ctRegex!(`(?P<Quot>\d+)/(?P<Denom>\d+)`.to!String());
        auto str = "2 + 34/56 - 6/1".to!String();
        auto cmf = matchFirst(str, ctPat);
        assert(cmf.equal(["34/56", "34", "56"].map!(to!String)()));
        assert(cmf["Quot"] == "34".to!String());
        assert(cmf["Denom"] == "56".to!String());

        auto cmAll = matchAll(str, ctPat);
        assert(cmAll.front.equal(cmf));
        cmAll.popFront();
        assert(cmAll.front.equal(["6/1", "6", "1"].map!(to!String)()));
    }
}

/++
    Start matching of $(D input) to regex pattern $(D re),
    using traditional $(LUCKY backtracking) matching scheme.

    The use of this function is $(RED discouraged) - use either of
    $(LREF matchAll) or $(LREF matchFirst).

    Delegating  the kind of operation
    to "g" flag is soon to be phased out along with the
    ability to choose the exact matching scheme. The choice of
    matching scheme to use depends highly on the pattern kind and
    can done automatically on case by case basis.

    Returns: a $(D RegexMatch) object holding engine
    state after first match.

+/
public auto bmatch(R, RegEx)(R input, RegEx re)
    if(isSomeString!R && is(RegEx == Regex!(BasicElementOf!R)))
{
    return RegexMatch!(Unqual!(typeof(input)), BacktrackingMatcher!false)(input, re);
}

///ditto
public auto bmatch(R, String)(R input, String re)
    if(isSomeString!R && isSomeString!String)
{
    return RegexMatch!(Unqual!(typeof(input)), BacktrackingMatcher!false)(input, regex(re));
}

public auto bmatch(R, RegEx)(R input, RegEx re)
    if(isSomeString!R && is(RegEx == StaticRegex!(BasicElementOf!R)))
{
    return RegexMatch!(Unqual!(typeof(input)),BacktrackingMatcher!true)(input, re);
}


enum isReplaceFunctor(alias fun, R) =
    __traits(compiles, (Captures!R c) { fun(c); });

// the lowest level - just stuff replacements into the sink
private @trusted void replaceCapturesInto(alias output, Sink, R, T)
        (ref Sink sink, R input, T captures)
    if(isOutputRange!(Sink, dchar) && isSomeString!R)
{
    sink.put(captures.pre);
    // a hack to get around bogus errors, should be simply output(captures, sink)
    // "is a nested function and cannot be accessed from"
    static if(isReplaceFunctor!(output, R))
        sink.put(output(captures)); //"mutator" type of function
    else
        output(captures, sink); //"output" type of function
    sink.put(captures.post);
}

// ditto for a range of captures
private void replaceMatchesInto(alias output, Sink, R, T)
        (ref Sink sink, R input, T matches)
    if(isOutputRange!(Sink, dchar) && isSomeString!R)
{
    size_t offset = 0;
    foreach(cap; matches)
    {
        sink.put(cap.pre[offset .. $]);
        // same hack, see replaceCapturesInto
        static if(isReplaceFunctor!(output, R))
            sink.put(output(cap)); //"mutator" type of function
        else
            output(cap, sink); //"output" type of function
        offset = cap.pre.length + cap.hit.length;
    }
    sink.put(input[offset .. $]);
}

//  a general skeleton of replaceFirst
private R replaceFirstWith(alias output, R, RegEx)(R input, RegEx re)
    if(isSomeString!R && isRegexFor!(RegEx, R))
{
    auto data = matchFirst(input, re);
    if(data.empty)
        return input;
    auto app = appender!(R)();
    replaceCapturesInto!output(app, input, data);
    return app.data;
}

// ditto for replaceAll
// the method parameter allows old API to ride on the back of the new one
private R replaceAllWith(alias output,
        alias method=matchAll, R, RegEx)(R input, RegEx re)
    if(isSomeString!R && isRegexFor!(RegEx, R))
{
    auto matches = method(input, re); //inout(C)[] fails
    if(matches.empty)
        return input;
    auto app = appender!(R)();
    replaceMatchesInto!output(app, input, matches);
    return app.data;
}

/++
    Construct a new string from $(D input) by replacing the first match with
    a string generated from it according to the $(D format) specifier.

    To replace all matches use $(LREF replaceAll).

    Params:
    input = string to search
    re = compiled regular expression to use
    format = format string to generate replacements from,
    see $(S_LINK Replace format string, the format string).

    Returns:
    A string of the same type with the first match (if any) replaced.
    If no match is found returns the input string itself.

    Example:
    ---
    assert(replaceFirst("noon", regex("n"), "[$&]") == "[n]oon");
    ---
+/
public R replaceFirst(R, C, RegEx)(R input, RegEx re, const(C)[] format)
    if(isSomeString!R && is(C : dchar) && isRegexFor!(RegEx, R))
{
    return replaceFirstWith!((m, sink) => replaceFmt(format, m, sink))(input, re);
}

/++
    This is a general replacement tool that construct a new string by replacing
    matches of pattern $(D re) in the $(D input). Unlike the other overload
    there is no format string instead captures are passed to
    to a user-defined functor $(D fun) that returns a new string
    to use as replacement.

    This version replaces the first match in $(D input),
    see $(LREF replaceAll) to replace the all of the matches.

    Returns:
    A new string of the same type as $(D input) with all matches
    replaced by return values of $(D fun). If no matches found
    returns the $(D input) itself.

    Example:
    ---
    string list = "#21 out of 46";
    string newList = replaceFirst!(cap => to!string(to!int(cap.hit)+1))
        (list, regex(`[0-9]+`));
    assert(newList == "#22 out of 46");
    ---
+/
public R replaceFirst(alias fun, R, RegEx)(R input, RegEx re)
  if(isSomeString!R && isRegexFor!(RegEx, R))
{
    return replaceFirstWith!((m, sink) => sink.put(fun(m)))(input, re);
}

/++
    A variation on $(LREF replaceFirst) that instead of allocating a new string
    on each call outputs the result piece-wise to the $(D sink). In particular
    this enables efficient construction of a final output incrementally.

    Like in $(LREF replaceFirst) family of functions there is an overload
    for the substitution guided by the $(D format) string
    and the one with the user defined callback.

    Example:
    ---
    import std.array;
    string m1 = "first message\n";
    string m2 = "second message\n";
    auto result = appender!string();
    replaceFirstInto(result, m1, regex(`([a-z]+) message`), "$1");
    //equivalent of the above with user-defined callback
    replaceFirstInto!(cap=>cap[1])(result, m2, regex(`([a-z]+) message`));
    assert(result.data == "first\nsecond\n");
    ---
+/
public @trusted void replaceFirstInto(Sink, R, C, RegEx)
        (ref Sink sink, R input, RegEx re, const(C)[] format)
    if(isOutputRange!(Sink, dchar) && isSomeString!R
        && is(C : dchar) && isRegexFor!(RegEx, R))
    {
    replaceCapturesInto!((m, sink) => replaceFmt(format, m, sink))
        (sink, input, matchFirst(input, re));
    }

///ditto
public @trusted void replaceFirstInto(alias fun, Sink, R, RegEx)
    (Sink sink, R input, RegEx re)
    if(isOutputRange!(Sink, dchar) && isSomeString!R && isRegexFor!(RegEx, R))
{
    replaceCapturesInto!fun(sink, input, matchFirst(input, re));
}

//examples for replaceFirst
@system unittest
{
    string list = "#21 out of 46";
    string newList = replaceFirst!(cap => to!string(to!int(cap.hit)+1))
        (list, regex(`[0-9]+`));
    assert(newList == "#22 out of 46");
    import std.array;
    string m1 = "first message\n";
    string m2 = "second message\n";
    auto result = appender!string();
    replaceFirstInto(result, m1, regex(`([a-z]+) message`), "$1");
    //equivalent of the above with user-defined callback
    replaceFirstInto!(cap=>cap[1])(result, m2, regex(`([a-z]+) message`));
    assert(result.data == "first\nsecond\n");
}

/++
    Construct a new string from $(D input) by replacing all of the
    fragments that match a pattern $(D re) with a string generated
    from the match according to the $(D format) specifier.

    To replace only the first match use $(LREF replaceFirst).

    Params:
    input = string to search
    re = compiled regular expression to use
    format = format string to generate replacements from,
    see $(S_LINK Replace format string, the format string).

    Returns:
    A string of the same type as $(D input) with the all
    of the matches (if any) replaced.
    If no match is found returns the input string itself.

    Example:
    ---
    // Comify a number
    auto com = regex(r"(?<=\d)(?=(\d\d\d)+\b)","g");
    assert(replaceAll("12000 + 42100 = 54100", com, ",") == "12,000 + 42,100 = 54,100");
    ---
+/
public @trusted R replaceAll(R, C, RegEx)(R input, RegEx re, const(C)[] format)
    if(isSomeString!R && is(C : dchar) && isRegexFor!(RegEx, R))
{
    return replaceAllWith!((m, sink) => replaceFmt(format, m, sink))(input, re);
}

/++
    This is a general replacement tool that construct a new string by replacing
    matches of pattern $(D re) in the $(D input). Unlike the other overload
    there is no format string instead captures are passed to
    to a user-defined functor $(D fun) that returns a new string
    to use as replacement.

    This version replaces all of the matches found in $(D input),
    see $(LREF replaceFirst) to replace the first match only.

    Returns:
    A new string of the same type as $(D input) with all matches
    replaced by return values of $(D fun). If no matches found
    returns the $(D input) itself.

    Params:
    input = string to search
    re = compiled regular expression
    fun = delegate to use

    Example:
    Capitalize the letters 'a' and 'r':
    ---
    string baz(Captures!(string) m)
    {
        return std.string.toUpper(m.hit);
    }
    auto s = replaceAll!(baz)("Strap a rocket engine on a chicken.",
            regex("[ar]"));
    assert(s == "StRAp A Rocket engine on A chicken.");
    ---
+/
public @trusted R replaceAll(alias fun, R, RegEx)(R input, RegEx re)
    if(isSomeString!R && isRegexFor!(RegEx, R))
{
    return replaceAllWith!((m, sink) => sink.put(fun(m)))(input, re);
}

/++
    A variation on $(LREF replaceAll) that instead of allocating a new string
    on each call outputs the result piece-wise to the $(D sink). In particular
    this enables efficient construction of a final output incrementally.

    As with $(LREF replaceAll) there are 2 overloads - one with a format string,
    the other one with a user defined functor.

    Example:
    ---
    //swap all 3 letter words and bring it back
    string text = "How are you doing?";
    auto sink = appender!(char[])();
    replaceAllInto!(cap => retro(cap[0]))(sink, text, regex(`\b\w{3}\b`));
    auto swapped = sink.data.dup; // make a copy explicitly
    assert(swapped == "woH era uoy doing?");
    sink.clear();
    replaceAllInto!(cap => retro(cap[0]))(sink, swapped, regex(`\b\w{3}\b`));
    assert(sink.data == text);
    ---
+/
public @trusted void replaceAllInto(Sink, R, C, RegEx)
        (Sink sink, R input, RegEx re, const(C)[] format)
    if(isOutputRange!(Sink, dchar) && isSomeString!R
        && is(C : dchar) && isRegexFor!(RegEx, R))
    {
    replaceMatchesInto!((m, sink) => replaceFmt(format, m, sink))
        (sink, input, matchAll(input, re));
    }

///ditto
public @trusted void replaceAllInto(alias fun, Sink, R, RegEx)
        (Sink sink, R input, RegEx re)
    if(isOutputRange!(Sink, dchar) && isSomeString!R && isRegexFor!(RegEx, R))
{
    replaceMatchesInto!fun(sink, input, matchAll(input, re));
}

// a bit of examples
@system unittest
{
    //swap all 3 letter words and bring it back
    string text = "How are you doing?";
    auto sink = appender!(char[])();
    replaceAllInto!(cap => retro(cap[0]))(sink, text, regex(`\b\w{3}\b`));
    auto swapped = sink.data.dup; // make a copy explicitly
    assert(swapped == "woH era uoy doing?");
    sink.clear();
    replaceAllInto!(cap => retro(cap[0]))(sink, swapped, regex(`\b\w{3}\b`));
    assert(sink.data == text);
}

// exercise all of the replace APIs
@system unittest
{
    // try and check first/all simple substitution
    foreach(S; TypeTuple!(string, wstring, dstring, char[], wchar[], dchar[]))
    {
        S s1 = "curt trial".to!S();
        S s2 = "round dome".to!S();
        S t1F = "court trial".to!S();
        S t2F = "hound dome".to!S();
        S t1A = "court trial".to!S();
        S t2A = "hound home".to!S();
        auto re1 = regex("curt".to!S());
        auto re2 = regex("[dr]o".to!S());

        assert(replaceFirst(s1, re1, "court") == t1F);
        assert(replaceFirst(s2, re2, "ho") == t2F);
        assert(replaceAll(s1, re1, "court") == t1A);
        assert(replaceAll(s2, re2, "ho") == t2A);

        auto rep1 = replaceFirst!(cap => cap[0][0]~"o".to!S()~cap[0][1..$])(s1, re1);
        assert(rep1 == t1F);
        assert(replaceFirst!(cap => "ho".to!S())(s2, re2) == t2F);
        auto rep1A = replaceAll!(cap => cap[0][0]~"o".to!S()~cap[0][1..$])(s1, re1);
        assert(rep1A == t1A);
        assert(replaceAll!(cap => "ho".to!S())(s2, re2) == t2A);

        auto sink = appender!S();
        replaceFirstInto(sink, s1, re1, "court");
        assert(sink.data == t1F);
        replaceFirstInto(sink, s2, re2, "ho");
        assert(sink.data == t1F~t2F);
        replaceAllInto(sink, s1, re1, "court");
        assert(sink.data == t1F~t2F~t1A);
        replaceAllInto(sink, s2, re2, "ho");
        assert(sink.data == t1F~t2F~t1A~t2A);
    }
}

/++
    Old API for replacement, operation depends on flags of pattern $(D re).
    With "g" flag it performs the equivalent of $(LREF replaceAll) otherwise it
    works the same as $(LREF replaceFirst).

    The use of this function is $(RED discouraged), please use $(LREF replaceAll)
    or $(LREF replaceFirst) explicitly.
+/
public R replace(alias scheme = match, R, C, RegEx)(R input, RegEx re, const(C)[] format)
    if(isSomeString!R && isRegexFor!(RegEx, R))
{
    return replaceAllWith!((m, sink) => replaceFmt(format, m, sink), match)(input, re);
}

///ditto
public R replace(alias fun, R, RegEx)(R input, RegEx re)
    if(isSomeString!R && isRegexFor!(RegEx, R))
{
    return replaceAllWith!(fun, match)(input, re);
}

//produce replacement string from format using captures for substitution
private void replaceFmt(R, Capt, OutR)
    (R format, Capt captures, OutR sink, bool ignoreBadSubs = false)
    if(isOutputRange!(OutR, ElementEncodingType!R[]) &&
        isOutputRange!(OutR, ElementEncodingType!(Capt.String)[]))
{
    enum State { Normal, Dollar }
    auto state = State.Normal;
    size_t offset;
L_Replace_Loop:
    while(!format.empty)
        final switch(state)
        {
        case State.Normal:
            for(offset = 0; offset < format.length; offset++)//no decoding
            {
                if(format[offset] == '$')
                {
                    state = State.Dollar;
                    sink.put(format[0 .. offset]);
                    format = format[offset+1 .. $];//ditto
                    continue L_Replace_Loop;
                }
            }
            sink.put(format[0 .. offset]);
            format = format[offset .. $];
            break;
        case State.Dollar:
            if(std.ascii.isDigit(format[0]))
            {
                uint digit = parse!uint(format);
                enforce(ignoreBadSubs || digit < captures.length, text("invalid submatch number ", digit));
                if(digit < captures.length)
                    sink.put(captures[digit]);
            }
            else if(format[0] == '{')
            {
                auto x = find!(a => !std.ascii.isAlpha(a))(format[1..$]);
                enforce(!x.empty && x[0] == '}', "no matching '}' in replacement format");
                auto name = format[1 .. $ - x.length];
                format = x[1..$];
                enforce(!name.empty, "invalid name in ${...} replacement format");
                sink.put(captures[name]);
            }
            else if(format[0] == '&')
            {
                sink.put(captures[0]);
                format = format[1 .. $];
            }
            else if(format[0] == '`')
            {
                sink.put(captures.pre);
                format = format[1 .. $];
            }
            else if(format[0] == '\'')
            {
                sink.put(captures.post);
                format = format[1 .. $];
            }
            else if(format[0] == '$')
            {
                sink.put(format[0 .. 1]);
                format = format[1 .. $];
            }
            state = State.Normal;
            break;
        }
    enforce(state == State.Normal, "invalid format string in regex replace");
}

/++
Range that splits a string using a regular expression as a
separator.

Example:
----
auto s1 = ", abc, de,  fg, hi, ";
assert(equal(splitter(s1, regex(", *")),
    ["", "abc", "de", "fg", "hi", ""]));
----
+/
public struct Splitter(Range, alias RegEx = Regex)
    if(isSomeString!Range && isRegexFor!(RegEx, Range))
{
private:
    Range _input;
    size_t _offset;
    alias Rx = typeof(match(Range.init,RegEx.init));
    Rx _match;

    @trusted this(Range input, RegEx separator)
    {//@@@BUG@@@ generated opAssign of RegexMatch is not @trusted
        _input = input;
        separator.flags |= RegexOption.global;
        if (_input.empty)
        {
            //there is nothing to match at all, make _offset > 0
            _offset = 1;
        }
        else
        {
            _match = Rx(_input, separator);
        }
    }

public:
    auto ref opSlice()
    {
        return this.save;
    }

    ///Forward range primitives.
    @property Range front()
    {
        assert(!empty && _offset <= _match.pre.length
                && _match.pre.length <= _input.length);
        return _input[_offset .. min($, _match.pre.length)];
    }

    ///ditto
    @property bool empty()
    {
        return _offset > _input.length;
    }

    ///ditto
    void popFront()
    {
        assert(!empty);
        if (_match.empty)
        {
            //No more separators, work is done here
            _offset = _input.length + 1;
        }
        else
        {
            //skip past the separator
            _offset = _match.pre.length + _match.hit.length;
            _match.popFront();
        }
    }

    ///ditto
    @property auto save()
    {
        return this;
    }
}

/**
    A helper function, creates a $(D Splitter) on range $(D r) separated by regex $(D pat).
    Captured subexpressions have no effect on the resulting range.
*/
public Splitter!(Range, RegEx) splitter(Range, RegEx)(Range r, RegEx pat)
    if(is(BasicElementOf!Range : dchar) && isRegexFor!(RegEx, Range))
{
    return Splitter!(Range, RegEx)(r, pat);
}

///An eager version of $(D splitter) that creates an array with splitted slices of $(D input).
public @trusted String[] split(String, RegEx)(String input, RegEx rx)
    if(isSomeString!String  && isRegexFor!(RegEx, String))
{
    auto a = appender!(String[])();
    foreach(e; splitter(input, rx))
        a.put(e);
    return a.data;
}

///Exception object thrown in case of errors during regex compilation.
public class RegexException : Exception
{
    ///
    @trusted this(string msg, string file = __FILE__, size_t line = __LINE__)
    {//@@@BUG@@@ Exception constructor is not @safe
        super(msg, file, line);
    }
}

//--------------------- TEST SUITE ---------------------------------
version(unittest)
{
@system:

unittest
{//sanity checks
    regex("(a|b)*");
    regex(`(?:([0-9A-F]+)\.\.([0-9A-F]+)|([0-9A-F]+))\s*;\s*(.*)\s*#`);
    regex("abc|edf|ighrg");
    auto r1 = regex("abc");
    auto r2 = regex("(gylba)");
    assert(match("abcdef", r1).hit == "abc");
    assert(!match("wida",r2));
    assert(bmatch("abcdef", r1).hit == "abc");
    assert(!bmatch("wida", r2));
    assert(match("abc", "abc".dup));
    assert(bmatch("abc", "abc".dup));
    Regex!char rc;
    assert(rc.empty);
    rc = regex("test");
    assert(!rc.empty);
}

/* The test vectors in this file are altered from Henry Spencer's regexp
   test code. His copyright notice is:

        Copyright (c) 1986 by University of Toronto.
        Written by Henry Spencer.  Not derived from licensed software.

        Permission is granted to anyone to use this software for any
        purpose on any computer system, and to redistribute it freely,
        subject to the following restrictions:

        1. The author is not responsible for the consequences of use of
                this software, no matter how awful, even if they arise
                from defects in it.

        2. The origin of this software must not be misrepresented, either
                by explicit claim or by omission.

        3. Altered versions must be plainly marked as such, and must not
                be misrepresented as being the original software.


 */

unittest
{
    struct TestVectors
    {
        string pattern;
        string input;
        string result;
        string format;
        string replace;
        string flags;
    }

    enum TestVectors tv[] = [
        TestVectors(  "a\\b",       "a",  "y",    "$&",    "a" ),
        TestVectors(  "(a)b\\1",   "abaab","y",    "$&",    "aba" ),
        TestVectors(  "()b\\1",     "aaab", "y",    "$&",    "b" ),
        TestVectors(  "abc",       "abc",  "y",    "$&",    "abc" ),
        TestVectors(  "abc",       "xbc",  "n",    "-",    "-" ),
        TestVectors(  "abc",       "axc",  "n",    "-",    "-" ),
        TestVectors(  "abc",       "abx",  "n",    "-",    "-" ),
        TestVectors(  "abc",       "xabcy","y",    "$&",    "abc" ),
        TestVectors(  "abc",       "ababc","y",    "$&",    "abc" ),
        TestVectors(  "ab*c",      "abc",  "y",    "$&",    "abc" ),
        TestVectors(  "ab*bc",     "abc",  "y",    "$&",    "abc" ),
        TestVectors(  "ab*bc",     "abbc", "y",    "$&",    "abbc" ),
        TestVectors(  "ab*bc",     "abbbbc","y",   "$&",    "abbbbc" ),
        TestVectors(  "ab+bc",     "abbc", "y",    "$&",    "abbc" ),
        TestVectors(  "ab+bc",     "abc",  "n",    "-",    "-" ),
        TestVectors(  "ab+bc",     "abq",  "n",    "-",    "-" ),
        TestVectors(  "ab+bc",     "abbbbc","y",   "$&",    "abbbbc" ),
        TestVectors(  "ab?bc",     "abbc", "y",    "$&",    "abbc" ),
        TestVectors(  "ab?bc",     "abc",  "y",    "$&",    "abc" ),
        TestVectors(  "ab?bc",     "abbbbc","n",   "-",    "-" ),
        TestVectors(  "ab?c",      "abc",  "y",    "$&",    "abc" ),
        TestVectors(  "^abc$",     "abc",  "y",    "$&",    "abc" ),
        TestVectors(  "^abc$",     "abcc", "n",    "-",    "-" ),
        TestVectors(  "^abc",      "abcc", "y",    "$&",    "abc" ),
        TestVectors(  "^abc$",     "aabc", "n",    "-",    "-" ),
        TestVectors(  "abc$",      "aabc", "y",    "$&",    "abc" ),
        TestVectors(  "^",         "abc",  "y",    "$&",    "" ),
        TestVectors(  "$",         "abc",  "y",    "$&",    "" ),
        TestVectors(  "a.c",       "abc",  "y",    "$&",    "abc" ),
        TestVectors(  "a.c",       "axc",  "y",    "$&",    "axc" ),
        TestVectors(  "a.*c",      "axyzc","y",    "$&",    "axyzc" ),
        TestVectors(  "a.*c",      "axyzd","n",    "-",    "-" ),
        TestVectors(  "a[bc]d",    "abc",  "n",    "-",    "-" ),
        TestVectors(  "a[bc]d",    "abd",  "y",    "$&",    "abd" ),
        TestVectors(  "a[b-d]e",   "abd",  "n",    "-",    "-" ),
        TestVectors(  "a[b-d]e",   "ace",  "y",    "$&",    "ace" ),
        TestVectors(  "a[b-d]",    "aac",  "y",    "$&",    "ac" ),
        TestVectors(  "a[-b]",     "a-",   "y",    "$&",    "a-" ),
        TestVectors(  "a[b-]",     "a-",   "y",    "$&",    "a-" ),
        TestVectors(  "a[b-a]",    "-",    "c",    "-",    "-" ),
        TestVectors(  "a[]b",      "-",    "c",    "-",    "-" ),
        TestVectors(  "a[",        "-",    "c",    "-",    "-" ),
        TestVectors(  "a]",        "a]",   "y",    "$&",    "a]" ),
        TestVectors(  "a[\\]]b",     "a]b",  "y",  "$&",    "a]b" ),
        TestVectors(  "a[^bc]d",   "aed",  "y",    "$&",    "aed" ),
        TestVectors(  "a[^bc]d",   "abd",  "n",    "-",    "-" ),
        TestVectors(  "a[^-b]c",   "adc",  "y",    "$&",    "adc" ),
        TestVectors(  "a[^-b]c",   "a-c",  "n",    "-",    "-" ),
        TestVectors(  "a[^\\]b]c",   "adc",  "y",  "$&",    "adc" ),
        TestVectors(  "ab|cd",     "abc",  "y",    "$&",    "ab" ),
        TestVectors(  "ab|cd",     "abcd", "y",    "$&",    "ab" ),
        TestVectors(  "()ef",      "def",  "y",    "$&-$1",        "ef-" ),
        TestVectors(  "()*",       "-",    "y",    "-",    "-" ),
        TestVectors(  "*a",        "-",    "c",    "-",    "-" ),
        TestVectors(  "^*",        "-",    "y",    "-",    "-" ),
        TestVectors(  "$*",        "-",    "y",    "-",    "-" ),
        TestVectors(  "(*)b",      "-",    "c",    "-",    "-" ),
        TestVectors(  "$b",        "b",    "n",    "-",    "-" ),
        TestVectors(  "a\\",       "-",    "c",    "-",    "-" ),
        TestVectors(  "a\\(b",     "a(b",  "y",    "$&-$1",        "a(b-" ),
        TestVectors(  "a\\(*b",    "ab",   "y",    "$&",    "ab" ),
        TestVectors(  "a\\(*b",    "a((b", "y",    "$&",    "a((b" ),
        TestVectors(  "a\\\\b",    "a\\b", "y",    "$&",    "a\\b" ),
        TestVectors(  "abc)",      "-",    "c",    "-",    "-" ),
        TestVectors(  "(abc",      "-",    "c",    "-",    "-" ),
        TestVectors(  "((a))",     "abc",  "y",    "$&-$1-$2",    "a-a-a" ),
        TestVectors(  "(a)b(c)",   "abc",  "y",    "$&-$1-$2",    "abc-a-c" ),
        TestVectors(  "a+b+c",     "aabbabc","y",  "$&",    "abc" ),
        TestVectors(  "a**",       "-",    "c",    "-",    "-" ),
        TestVectors(  "a*?a",      "aa",   "y",    "$&",    "a" ),
        TestVectors(  "(a*)*",     "aaa",  "y",    "-",    "-" ),
        TestVectors(  "(a*)+",     "aaa",  "y",    "-",    "-" ),
        TestVectors(  "(a|)*",     "-",    "y",    "-",    "-" ),
        TestVectors(  "(a*|b)*",   "aabb", "y",    "-",    "-" ),
        TestVectors(  "(a|b)*",    "ab",   "y",    "$&-$1",        "ab-b" ),
        TestVectors(  "(a+|b)*",   "ab",   "y",    "$&-$1",        "ab-b" ),
        TestVectors(  "(a+|b)+",   "ab",   "y",    "$&-$1",        "ab-b" ),
        TestVectors(  "(a+|b)?",   "ab",   "y",    "$&-$1",        "a-a" ),
        TestVectors(  "[^ab]*",    "cde",  "y",    "$&",    "cde" ),
        TestVectors(  "(^)*",      "-",    "y",    "-",    "-" ),
        TestVectors(  "(ab|)*",    "-",    "y",    "-",    "-" ),
        TestVectors(  ")(",        "-",    "c",    "-",    "-" ),
        TestVectors(  "",  "abc",  "y",    "$&",    "" ),
        TestVectors(  "abc",       "",     "n",    "-",    "-" ),
        TestVectors(  "a*",        "",     "y",    "$&",    "" ),
        TestVectors(  "([abc])*d", "abbbcd",       "y",    "$&-$1",        "abbbcd-c" ),
        TestVectors(  "([abc])*bcd", "abcd",       "y",    "$&-$1",        "abcd-a" ),
        TestVectors(  "a|b|c|d|e", "e",    "y",    "$&",    "e" ),
        TestVectors(  "(a|b|c|d|e)f", "ef",        "y",    "$&-$1",        "ef-e" ),
        TestVectors(  "((a*|b))*", "aabb", "y",    "-",    "-" ),
        TestVectors(  "abcd*efg",  "abcdefg",      "y",    "$&",    "abcdefg" ),
        TestVectors(  "ab*",       "xabyabbbz",    "y",    "$&",    "ab" ),
        TestVectors(  "ab*",       "xayabbbz",     "y",    "$&",    "a" ),
        TestVectors(  "(ab|cd)e",  "abcde",        "y",    "$&-$1",        "cde-cd" ),
        TestVectors(  "[abhgefdc]ij",      "hij",  "y",    "$&",    "hij" ),
        TestVectors(  "^(ab|cd)e", "abcde",        "n",    "x$1y",        "xy" ),
        TestVectors(  "(abc|)ef",  "abcdef",       "y",    "$&-$1",        "ef-" ),
        TestVectors(  "(a|b)c*d",  "abcd",         "y",    "$&-$1",        "bcd-b" ),
        TestVectors(  "(ab|ab*)bc",        "abc",  "y",    "$&-$1",        "abc-a" ),
        TestVectors(  "a([bc]*)c*",        "abc",  "y",    "$&-$1",        "abc-bc" ),
        TestVectors(  "a([bc]*)(c*d)",     "abcd", "y",    "$&-$1-$2",    "abcd-bc-d" ),
        TestVectors(  "a([bc]+)(c*d)",     "abcd", "y",    "$&-$1-$2",    "abcd-bc-d" ),
        TestVectors(  "a([bc]*)(c+d)",     "abcd", "y",    "$&-$1-$2",    "abcd-b-cd" ),
        TestVectors(  "a[bcd]*dcdcde",     "adcdcde",      "y",    "$&",    "adcdcde" ),
        TestVectors(  "a[bcd]+dcdcde",     "adcdcde",      "n",    "-",    "-" ),
        TestVectors(  "(ab|a)b*c", "abc",           "y",    "$&-$1",        "abc-ab" ),
        TestVectors(  "((a)(b)c)(d)",      "abcd",  "y",    "$1-$2-$3-$4",      "abc-a-b-d" ),
        TestVectors(  "[a-zA-Z_][a-zA-Z0-9_]*",    "alpha",        "y",    "$&",    "alpha" ),
        TestVectors(  "^a(bc+|b[eh])g|.h$",        "abh",  "y",    "$&-$1",        "bh-" ),
        TestVectors(  "(bc+d$|ef*g.|h?i(j|k))",    "effgz",        "y",    "$&-$1-$2",    "effgz-effgz-" ),
        TestVectors(  "(bc+d$|ef*g.|h?i(j|k))",    "ij",   "y",    "$&-$1-$2",    "ij-ij-j" ),
        TestVectors(  "(bc+d$|ef*g.|h?i(j|k))",    "effg", "n",    "-",    "-" ),
        TestVectors(  "(bc+d$|ef*g.|h?i(j|k))",    "bcdd", "n",    "-",    "-" ),
        TestVectors(  "(bc+d$|ef*g.|h?i(j|k))",    "reffgz",       "y",    "$&-$1-$2",    "effgz-effgz-" ),
        TestVectors(  "(((((((((a)))))))))",       "a",    "y",    "$&",    "a" ),
        TestVectors(  "multiple words of text",    "uh-uh",        "n",    "-",    "-" ),
        TestVectors(  "multiple words",    "multiple words, yeah", "y",    "$&",    "multiple words" ),
        TestVectors(  "(.*)c(.*)", "abcde",                "y",    "$&-$1-$2",    "abcde-ab-de" ),
        TestVectors(  "\\((.*), (.*)\\)",  "(a, b)",       "y",    "($2, $1)",   "(b, a)" ),
        TestVectors(  "abcd",      "abcd",                   "y",    "$&-&-$$$&",  "abcd-&-$abcd" ),
        TestVectors(  "a(bc)d",    "abcd",                 "y",    "$1-$$1-$$$1",    "bc-$1-$bc" ),
        TestVectors(  "[k]",                       "ab",   "n",    "-",    "-" ),
        TestVectors(  "[ -~]*",                    "abc",  "y",    "$&",    "abc" ),
        TestVectors(  "[ -~ -~]*",                 "abc",  "y",    "$&",    "abc" ),
        TestVectors(  "[ -~ -~ -~]*",              "abc",  "y",    "$&",    "abc" ),
        TestVectors(  "[ -~ -~ -~ -~]*",           "abc",  "y",    "$&",    "abc" ),
        TestVectors(  "[ -~ -~ -~ -~ -~]*",        "abc",  "y",    "$&",    "abc" ),
        TestVectors(  "[ -~ -~ -~ -~ -~ -~]*",     "abc",  "y",    "$&",    "abc" ),
        TestVectors(  "[ -~ -~ -~ -~ -~ -~ -~]*",  "abc",  "y",    "$&",    "abc" ),
        TestVectors(  "a{2}",      "candy",                "n",    "",     "" ),
        TestVectors(  "a{2}",      "caandy",               "y",    "$&",    "aa" ),
        TestVectors(  "a{2}",      "caaandy",              "y",    "$&",    "aa" ),
        TestVectors(  "a{2,}",     "candy",                "n",    "",     "" ),
        TestVectors(  "a{2,}",     "caandy",               "y",    "$&",    "aa" ),
        TestVectors(  "a{2,}",     "caaaaaandy",           "y",    "$&",    "aaaaaa" ),
        TestVectors(  "a{1,3}",    "cndy",                 "n",    "",     "" ),
        TestVectors(  "a{1,3}",    "candy",                "y",    "$&",    "a" ),
        TestVectors(  "a{1,3}",    "caandy",               "y",    "$&",    "aa" ),
        TestVectors(  "a{1,3}",    "caaaaaandy",           "y",    "$&",    "aaa" ),
        TestVectors(  "e?le?",     "angel",                "y",    "$&",    "el" ),
        TestVectors(  "e?le?",     "angle",                "y",    "$&",    "le" ),
        TestVectors(  "\\bn\\w",   "noonday",              "y",    "$&",    "no" ),
        TestVectors(  "\\wy\\b",   "possibly yesterday",   "y",    "$&",    "ly" ),
        TestVectors(  "\\w\\Bn",   "noonday",              "y",    "$&",    "on" ),
        TestVectors(  "y\\B\\w",   "possibly yesterday",   "y",    "$&",    "ye" ),
        TestVectors(  "\\cJ",      "abc\ndef",             "y",    "$&",    "\n" ),
        TestVectors(  "\\d",       "B2 is",                "y",    "$&",    "2" ),
        TestVectors(  "\\D",       "B2 is",                "y",    "$&",    "B" ),
        TestVectors(  "\\s\\w*",   "foo bar",              "y",    "$&",    " bar" ),
        TestVectors(  "\\S\\w*",   "foo bar",              "y",    "$&",    "foo" ),
        TestVectors(  "abc",       "ababc",                "y",    "$&",    "abc" ),
        TestVectors(  "apple(,)\\sorange\\1",      "apple, orange, cherry, peach", "y", "$&", "apple, orange," ),
        TestVectors(  "(\\w+)\\s(\\w+)",           "John Smith", "y", "$2, $1", "Smith, John" ),
        TestVectors(  "\\n\\f\\r\\t\\v",           "abc\n\f\r\t\vdef", "y", "$&", "\n\f\r\t\v" ),
        TestVectors(  ".*c",       "abcde",                        "y",    "$&",    "abc" ),
        TestVectors(  "^\\w+((;|=)\\w+)+$", "some=host=tld",    "y", "$&-$1-$2", "some=host=tld-=tld-=" ),
        TestVectors(  "^\\w+((\\.|-)\\w+)+$", "some.host.tld",    "y", "$&-$1-$2", "some.host.tld-.tld-." ),
        TestVectors(  "q(a|b)*q",  "xxqababqyy",                "y",    "$&-$1",        "qababq-b" ),
        TestVectors(  "^(a)(b){0,1}(c*)",   "abcc", "y", "$1 $2 $3", "a b cc" ),
        TestVectors(  "^(a)((b){0,1})(c*)", "abcc", "y", "$1 $2 $3", "a b b" ),
        TestVectors(  "^(a)(b)?(c*)",       "abcc", "y", "$1 $2 $3", "a b cc" ),
        TestVectors(  "^(a)((b)?)(c*)",     "abcc", "y", "$1 $2 $3", "a b b" ),
        TestVectors(  "^(a)(b){0,1}(c*)",   "acc",  "y", "$1 $2 $3", "a  cc" ),
        TestVectors(  "^(a)((b){0,1})(c*)", "acc",  "y", "$1 $2 $3", "a  " ),
        TestVectors(  "^(a)(b)?(c*)",       "acc",  "y", "$1 $2 $3", "a  cc" ),
        TestVectors(  "^(a)((b)?)(c*)",     "acc",  "y", "$1 $2 $3", "a  " ),
        TestVectors(  "(?:ab){3}",       "_abababc","y", "$&-$1",    "ababab-" ),
        TestVectors(  "(?:a(?:x)?)+",    "aaxaxx",  "y", "$&-$1-$2", "aaxax--" ),
        TestVectors(  `\W\w\W`,         "aa b!ca",  "y", "$&",       " b!"),
//more repetitions:
        TestVectors(  "(?:a{2,4}b{1,3}){1,2}",  "aaabaaaabbb", "y", "$&", "aaabaaaabbb" ),
        TestVectors(  "(?:a{2,4}b{1,3}){1,2}?", "aaabaaaabbb", "y", "$&", "aaab" ),
//groups:
        TestVectors(  "(abc)|(edf)|(xyz)",     "xyz",             "y",   "$1-$2-$3","--xyz"),
        TestVectors(  "(?P<q>\\d+)/(?P<d>\\d+)",     "2/3",       "y",     "${d}/${q}",    "3/2"),
//set operations:
        TestVectors(  "[a-z--d-f]",                  " dfa",      "y",   "$&",     "a"),
        TestVectors(  "[abc[pq--acq]]{2}",           "bqpaca",    "y",   "$&",     "pa"),
        TestVectors(  "[a-z9&&abc0-9]{3}",           "z90a0abc",  "y",   "$&",     "abc"),
        TestVectors(  "[0-9a-f~~0-5a-z]{2}",         "g0a58x",    "y",   "$&",     "8x"),
        TestVectors(  "[abc[pq]xyz[rs]]{4}",         "cqxr",      "y",   "$&",     "cqxr"),
        TestVectors(  "[abcdf--[ab&&[bcd]][acd]]",   "abcdefgh",  "y",   "$&",     "f"),
//unicode blocks & properties:
        TestVectors(  `\P{Inlatin1suppl ement}`, "\u00c2!", "y", "$&", "!"),
        TestVectors(  `\p{InLatin-1 Supplement}\p{in-mathematical-operators}\P{Inlatin1suppl ement}`, "\u00c2\u2200\u00c3\u2203.", "y", "$&", "\u00c3\u2203."),
        TestVectors(  `[-+*/\p{in-mathematical-operators}]{2}`,    "a+\u2212",    "y",    "$&",    "+\u2212"),
        TestVectors(  `\p{Ll}+`,                      "XabcD",    "y",  "$&",      "abc"),
        TestVectors(  `\p{Lu}+`,                      "абвГДЕ",   "y",  "$&",      "ГДЕ"),
        TestVectors(  `^\p{Currency Symbol}\p{Sc}`,   "$₤",       "y",  "$&",      "$₤"),
        TestVectors(  `\p{Common}\p{Thai}`,           "!ฆ",       "y",  "$&",      "!ฆ"),
        TestVectors(  `[\d\s]*\D`,  "12 \t3\U00001680\u0F20_2",   "y",  "$&", "12 \t3\U00001680\u0F20_"),
        TestVectors(  `[c-wф]фф`, "ффф", "y", "$&", "ффф"),
//case insensitive:
        TestVectors(   `^abcdEf$`,           "AbCdEF",              "y",   "$&", "AbCdEF",      "i"),
        TestVectors(   `Русский язык`,    "рУсскИй ЯзЫк",           "y",   "$&", "рУсскИй ЯзЫк",     "i"),
        TestVectors(   `ⒶⒷⓒ` ,        "ⓐⓑⒸ",                   "y",   "$&", "ⓐⓑⒸ",      "i"),
        TestVectors(   "\U00010400{2}",  "\U00010428\U00010400 ",   "y",   "$&", "\U00010428\U00010400", "i"),
        TestVectors(   `[adzУ-Я]{4}`,    "DzюЯ",                   "y",   "$&", "DzюЯ", "i"),
        TestVectors(   `\p{L}\p{Lu}{10}`, "абвгдеЖЗИКЛ",            "y",   "$&", "абвгдеЖЗИКЛ", "i"),
        TestVectors(   `(?:Dåb){3}`,  "DåbDÅBdÅb",                  "y",   "$&", "DåbDÅBdÅb", "i"),
//escapes:
        TestVectors(    `\u0041\u005a\U00000065\u0001`,         "AZe\u0001",       "y",   "$&", "AZe\u0001"),
        TestVectors(    `\u`,               "",   "c",   "-",  "-"),
        TestVectors(    `\U`,               "",   "c",   "-",  "-"),
        TestVectors(    `\u003`,            "",   "c",   "-",  "-"),
        TestVectors(    `[\x00-\x7f]{4}`,        "\x00\x09ab",   "y", "$&", "\x00\x09ab"),
        TestVectors(    `[\cJ\cK\cA-\cD]{3}\cQ`, "\x01\x0B\x0A\x11", "y", "$&", "\x01\x0B\x0A\x11"),
        TestVectors(    `\r\n\v\t\f\\`,     "\r\n\v\t\f\\",   "y",   "$&", "\r\n\v\t\f\\"),
        TestVectors(    `[\u0003\u0001]{2}`,  "\u0001\u0003",         "y",   "$&", "\u0001\u0003"),
        TestVectors(    `^[\u0020-\u0080\u0001\n-\r]{8}`,  "abc\u0001\v\f\r\n",  "y",   "$&", "abc\u0001\v\f\r\n"),
        TestVectors(    `\w+\S\w+`, "ab7!44c",  "y", "$&", "ab7!44c"),
        TestVectors(    `\b\w+\b`,  " abde4 ",  "y", "$&", "abde4"),
        TestVectors(    `\b\w+\b`,  " abde4",   "y", "$&", "abde4"),
        TestVectors(    `\b\w+\b`,  "abde4 ",   "y", "$&", "abde4"),
        TestVectors(    `\pL\pS`,   "a\u02DA",  "y", "$&", "a\u02DA"),
        TestVectors(    `\pX`,      "",         "c", "-",  "-"),
// ^, $, \b, \B, multiline :
        TestVectors(    `\r.*?$`,    "abc\r\nxy", "y", "$&", "\r\nxy", "sm"),
        TestVectors(    `^a$^b$`,    "a\r\nb\n",  "n", "$&", "-", "m"),
        TestVectors(    `^a$\r\n^b$`,"a\r\nb\n",  "y", "$&", "a\r\nb", "m"),
        TestVectors(    `^$`,        "\r\n",      "y", "$&", "", "m"),
        TestVectors(    `^a$\nx$`,   "a\nx\u2028","y", "$&", "a\nx", "m"),
        TestVectors(    `^a$\nx$`,   "a\nx\u2029","y", "$&", "a\nx", "m"),
        TestVectors(    `^a$\nx$`,   "a\nx\u0085","y", "$&", "a\nx","m"),
        TestVectors(    `^x$`,       "\u2028x",   "y", "$&", "x", "m"),
        TestVectors(    `^x$`,       "\u2029x",   "y", "$&", "x", "m"),
        TestVectors(    `^x$`,       "\u0085x",   "y", "$&", "x", "m"),
        TestVectors(    `\b^.`,      "ab",        "y", "$&", "a"),
        TestVectors(    `\B^.`,      "ab",        "n", "-",  "-"),
        TestVectors(    `^ab\Bc\B`,  "\r\nabcd",  "y", "$&", "abc", "m"),
        TestVectors(    `^.*$`,      "12345678",  "y", "$&", "12345678"),

// luckily obtained regression on incremental matching in backtracker
        TestVectors(  `^(?:(?:([0-9A-F]+)\.\.([0-9A-F]+)|([0-9A-F]+))\s*;\s*([^ ]*)\s*#|# (?:\w|_)+=((?:\w|_)+))`,
            "0020  ; White_Space # ", "y", "$1-$2-$3", "--0020"),
//lookahead
        TestVectors(    "(foo.)(?=(bar))",     "foobar foodbar", "y", "$&-$1-$2", "food-food-bar" ),
        TestVectors(    `\b(\d+)[a-z](?=\1)`,  "123a123",        "y", "$&-$1", "123a-123" ),
        TestVectors(    `\$(?!\d{3})\w+`,      "$123 $abc",      "y", "$&", "$abc"),
        TestVectors(    `(abc)(?=(ed(f))\3)`,    "abcedff",      "y", "-", "-"),
        TestVectors(    `\b[A-Za-z0-9.]+(?=(@(?!gmail)))`, "a@gmail,x@com",  "y", "$&-$1", "x-@"),
        TestVectors(    `x()(abc)(?=(d)(e)(f)\2)`,   "xabcdefabc", "y", "$&", "xabc"),
        TestVectors(    `x()(abc)(?=(d)(e)(f)()\3\4\5)`,   "xabcdefdef", "y", "$&", "xabc"),
//lookback
        TestVectors(    `(?<=(ab))\d`,    "12ba3ab4",    "y",   "$&-$1", "4-ab",  "i"),
        TestVectors(    `\w(?<!\d)\w`,   "123ab24",  "y",   "$&", "ab"),
        TestVectors(    `(?<=Dåb)x\w`,  "DåbDÅBxdÅb",  "y",   "$&", "xd", "i"),
        TestVectors(    `(?<=(ab*c))x`,   "abbbbcxac",  "y",   "$&-$1", "x-abbbbc"),
        TestVectors(    `(?<=(ab*?c))x`,   "abbbbcxac",  "y",   "$&-$1", "x-abbbbc"),
        TestVectors(    `(?<=(a.*?c))x`,   "ababbcxac",  "y",   "$&-$1", "x-abbc"),
        TestVectors(    `(?<=(a{2,4}b{1,3}))x`,   "yyaaaabx",  "y",   "$&-$1", "x-aaaab"),
        TestVectors(    `(?<=((?:a{2,4}b{1,3}){1,2}))x`,   "aabbbaaaabx",  "y",   "$&-$1", "x-aabbbaaaab"),
        TestVectors(    `(?<=((?:a{2,4}b{1,3}){1,2}?))x`,   "aabbbaaaabx",  "y",   "$&-$1", "x-aaaab"),
        TestVectors(    `(?<=(abc|def|aef))x`,    "abcx", "y",        "$&-$1",  "x-abc"),
        TestVectors(    `(?<=(abc|def|aef))x`,    "aefx", "y",        "$&-$1",  "x-aef"),
        TestVectors(    `(?<=(abc|dabc))(x)`,    "dabcx", "y",        "$&-$1-$2",  "x-abc-x"),
        TestVectors(    `(?<=(|abc))x`,        "dabcx", "y",        "$&-$1",  "x-"),
        TestVectors(    `(?<=((ab|da)*))x`,    "abdaabx", "y",        "$&-$2-$1",  "x-ab-abdaab"),
        TestVectors(    `a(?<=(ba(?<=(aba)(?<=aaba))))`, "aabaa", "y", "$&-$1-$2", "a-ba-aba"),
        TestVectors(    `.(?<!b).`,   "bax",  "y", "$&", "ax"),
        TestVectors(    `(?<=b(?<!ab)).`,   "abbx",  "y",  "$&", "x"),
        TestVectors(    `(?<=\.|[!?]+)X`,   "Hey?!X", "y", "$&", "X"),
        TestVectors(    `(?<=\.|[!?]+)a{3}`,   ".Nope.aaaX", "y", "$&", "aaa"),
//mixed lookaround
        TestVectors(   `a(?<=a(?=b))b`,    "ab", "y",      "$&", "ab"),
        TestVectors(   `a(?<=a(?!b))c`,    "ac", "y",      "$&", "ac"),
        ];
    string produceExpected(M,String)(auto ref M m, String fmt)
    {
        auto app = appender!(String)();
        replaceFmt(fmt, m.captures, app, true);
        return app.data;
    }
    void run_tests(alias matchFn)()
    {
        int i;
        foreach(Char; TypeTuple!( char, wchar, dchar))
        {
            alias String = immutable(Char)[];
            String produceExpected(M,Range)(auto ref M m, Range fmt)
            {
                auto app = appender!(String)();
                replaceFmt(fmt, m.captures, app, true);
                return app.data;
            }
            Regex!(Char) r;
            foreach(a, tvd; tv)
            {
                uint c = tvd.result[0];
                debug(std_regex_test) writeln(" Test #", a, " pattern: ", tvd.pattern, " with Char = ", Char.stringof);
                try
                {
                    i = 1;
                    r = regex(to!(String)(tvd.pattern), tvd.flags);
                }
                catch (RegexException e)
                {
                    i = 0;
                    debug(std_regex_test) writeln(e.msg);
                }

                assert((c == 'c') ? !i : i, "failed to compile pattern "~tvd.pattern);

                if(c != 'c')
                {
                    auto m = matchFn(to!(String)(tvd.input), r);
                    i = !m.empty;
                    assert((c == 'y') ? i : !i, text(matchFn.stringof ~": failed to match pattern #", a ,": ", tvd.pattern));
                    if(c == 'y')
                    {
                        auto result = produceExpected(m, to!(String)(tvd.format));
                        assert(result == to!String(tvd.replace),
                            text(matchFn.stringof ~": mismatch pattern #", a, ": ", tvd.pattern," expected: ",
                                    tvd.replace, " vs ", result));
                    }
                }
            }
        }
        debug(std_regex_test) writeln("!!! FReD bulk test done "~matchFn.stringof~" !!!");
    }


    void ct_tests()
    {
        version(std_regex_ct1)
        {
            pragma(msg, "Testing 1st part of ctRegex");
            alias Tests = Sequence!(0, 155);
        }
        else version(std_regex_ct2)
        {
            pragma(msg, "Testing 2nd part of ctRegex");
            alias Tests = Sequence!(155, 174);
        }
        //FIXME: #174-178 contains CTFE parser bug
        else version(std_regex_ct3)
        {
            pragma(msg, "Testing 3rd part of ctRegex");
            alias Tests = Sequence!(178, 220);
        }
        else version(std_regex_ct4)
        {
            pragma(msg, "Testing 4th part of ctRegex");
            alias Tests = Sequence!(220, tv.length);
        }
        else
            alias Tests = TypeTuple!(Sequence!(0, 30), Sequence!(235, tv.length-5));
        foreach(a, v; Tests)
        {
            enum tvd = tv[v];
            static if(tvd.result == "c")
            {
                static assert(!__traits(compiles, (){
                    enum r = regex(tvd.pattern, tvd.flags);
                }), "errornously compiles regex pattern: " ~ tvd.pattern);
            }
            else
            {
                //BUG: tv[v] is fine but tvd is not known at compile time?!
                auto r = ctRegex!(tv[v].pattern, tv[v].flags);
                auto nr = regex(tvd.pattern, tvd.flags);
                assert(equal(r.ir, nr.ir),
                    text("!C-T regex! failed to compile pattern #", a ,": ", tvd.pattern));
                auto m = match(tvd.input, r);
                auto c = tvd.result[0];
                bool ok = (c == 'y') ^ m.empty;
                assert(ok, text("ctRegex: failed to match pattern #",
                    a ,": ", tvd.pattern));
                if(c == 'y')
                {
                    import std.stdio;
                    auto result = produceExpected(m, tvd.format);
                    if(result != tvd.replace)
                        writeln("ctRegex mismatch pattern #", a, ": ", tvd.pattern," expected: ",
                                tvd.replace, " vs ", result);
                }
            }
        }
        debug(std_regex_test) writeln("!!! FReD C-T test done !!!");
    }

    ct_tests();
    run_tests!bmatch(); //backtracker
    run_tests!match(); //thompson VM
}

unittest
{
    // test parser optimization of identical character classes
    auto n = regex("[a-z]/[a-z]/[a-z]").charsets.length;
    assert(n == 1, text(n));
}

unittest
{
    auto cr = ctRegex!("abc");
    assert(bmatch("abc",cr).hit == "abc");
    auto cr2 = ctRegex!("ab*c");
    assert(bmatch("abbbbc",cr2).hit == "abbbbc");
    auto cr3 = ctRegex!("^abc$");
    assert(bmatch("abc",cr3).hit == "abc");
    auto cr4 = ctRegex!(`\b(a\B[a-z]b)\b`);
    assert(array(match("azb",cr4).captures) == ["azb", "azb"]);
    auto cr5 = ctRegex!("(?:a{2,4}b{1,3}){1,2}");
    assert(bmatch("aaabaaaabbb", cr5).hit == "aaabaaaabbb");
    auto cr6 = ctRegex!("(?:a{2,4}b{1,3}){1,2}?"w);
    assert(bmatch("aaabaaaabbb"w,  cr6).hit == "aaab"w);
    auto cr7 = ctRegex!(`\r.*?$`,"sm");
    assert(bmatch("abc\r\nxy",  cr7).hit == "\r\nxy");
    auto greed =  ctRegex!("<packet.*?/packet>");
    assert(bmatch("<packet>text</packet><packet>text</packet>", greed).hit
            == "<packet>text</packet>");
    auto cr8 = ctRegex!("^(a)(b)?(c*)");
    auto m8 = bmatch("abcc",cr8);
    assert(m8);
    assert(m8.captures[1] == "a");
    assert(m8.captures[2] == "b");
    assert(m8.captures[3] == "cc");
    auto cr9 = ctRegex!("q(a|b)*q");
    auto m9 = match("xxqababqyy",cr9);
    assert(m9);
    assert(equal(bmatch("xxqababqyy",cr9).captures, ["qababq", "b"]));

    auto rtr = regex("a|b|c");
    enum ctr = regex("a|b|c");
    assert(equal(rtr.ir,ctr.ir));
    //CTFE parser BUG is triggered by group
    //in the middle of alternation (at least not first and not last)
    enum testCT = regex(`abc|(edf)|xyz`);
    auto testRT = regex(`abc|(edf)|xyz`);
    assert(equal(testCT.ir,testRT.ir));
}

unittest
{
    enum cx = ctRegex!"(A|B|C)";
    auto mx = match("B",cx);
    assert(mx);
    assert(equal(mx.captures, [ "B", "B"]));
    enum cx2 = ctRegex!"(A|B)*";
    assert(match("BAAA",cx2));

    enum cx3 = ctRegex!("a{3,4}","i");
    auto mx3 = match("AaA",cx3);
    assert(mx3);
    assert(mx3.captures[0] == "AaA");
    enum cx4 = ctRegex!(`^a{3,4}?[a-zA-Z0-9~]{1,2}`,"i");
    auto mx4 = match("aaaabc", cx4);
    assert(mx4);
    assert(mx4.captures[0] == "aaaab");
    auto cr8 = ctRegex!("(a)(b)?(c*)");
    auto m8 = bmatch("abcc",cr8);
    assert(m8);
    assert(m8.captures[1] == "a");
    assert(m8.captures[2] == "b");
    assert(m8.captures[3] == "cc");
    auto cr9 = ctRegex!(".*$", "gm");
    auto m9 = match("First\rSecond", cr9);
    assert(m9);
    assert(equal(map!"a.hit"(m9), ["First", "", "Second"]));
}

unittest
{
//global matching
    void test_body(alias matchFn)()
    {
        string s = "a quick brown fox jumps over a lazy dog";
        auto r1 = regex("\\b[a-z]+\\b","g");
        string[] test;
        foreach(m; matchFn(s, r1))
            test ~= m.hit;
        assert(equal(test, [ "a", "quick", "brown", "fox", "jumps", "over", "a", "lazy", "dog"]));
        auto free_reg = regex(`

            abc
            \s+
            "
            (
                    [^"]+
                |   \\ "
            )+
            "
            z
        `, "x");
        auto m = match(`abc  "quoted string with \" inside"z`,free_reg);
        assert(m);
        string mails = " hey@you.com no@spam.net ";
        auto rm = regex(`@(?<=\S+@)\S+`,"g");
        assert(equal(map!"a[0]"(matchFn(mails, rm)), ["@you.com", "@spam.net"]));
        auto m2 = matchFn("First line\nSecond line",regex(".*$","gm"));
        assert(equal(map!"a[0]"(m2), ["First line", "", "Second line"]));
        auto m2a = matchFn("First line\nSecond line",regex(".+$","gm"));
        assert(equal(map!"a[0]"(m2a), ["First line", "Second line"]));
        auto m2b = matchFn("First line\nSecond line",regex(".+?$","gm"));
        assert(equal(map!"a[0]"(m2b), ["First line", "Second line"]));
        debug(std_regex_test) writeln("!!! FReD FLAGS test done "~matchFn.stringof~" !!!");
    }
    test_body!bmatch();
    test_body!match();
}

//tests for accumulated std.regex issues and other regressions
unittest
{
    void test_body(alias matchFn)()
    {
        //issue 5857
        //matching goes out of control if ... in (...){x} has .*/.+
        auto c = matchFn("axxxzayyyyyzd",regex("(a.*z){2}d")).captures;
        assert(c[0] == "axxxzayyyyyzd");
        assert(c[1] == "ayyyyyz");
        auto c2 = matchFn("axxxayyyyyd",regex("(a.*){2}d")).captures;
        assert(c2[0] == "axxxayyyyyd");
        assert(c2[1] == "ayyyyy");
        //issue 2108
        //greedy vs non-greedy
        auto nogreed = regex("<packet.*?/packet>");
        assert(matchFn("<packet>text</packet><packet>text</packet>", nogreed).hit
               == "<packet>text</packet>");
        auto greed =  regex("<packet.*/packet>");
        assert(matchFn("<packet>text</packet><packet>text</packet>", greed).hit
               == "<packet>text</packet><packet>text</packet>");
        //issue 4574
        //empty successful match still advances the input
        string[] pres, posts, hits;
        foreach(m; matchFn("abcabc", regex("","g"))) {
            pres ~= m.pre;
            posts ~= m.post;
            assert(m.hit.empty);

        }
        auto heads = [
            "abcabc",
            "abcab",
            "abca",
            "abc",
            "ab",
            "a",
            ""
        ];
        auto tails = [
            "abcabc",
             "bcabc",
              "cabc",
               "abc",
                "bc",
                 "c",
                  ""
        ];
        assert(pres == array(retro(heads)));
        assert(posts == tails);
        //issue 6076
        //regression on .*
        auto re = regex("c.*|d");
        auto m = matchFn("mm", re);
        assert(!m);
        debug(std_regex_test) writeln("!!! FReD REGRESSION test done "~matchFn.stringof~" !!!");
        auto rprealloc = regex(`((.){5}.{1,10}){5}`);
        auto arr = array(repeat('0',100));
        auto m2 = matchFn(arr, rprealloc);
        assert(m2);
        assert(collectException(
                regex(r"^(import|file|binary|config)\s+([^\(]+)\(?([^\)]*)\)?\s*$")
                ) is null);
        foreach(ch; [Escapables])
        {
            assert(match(to!string(ch),regex(`[\`~ch~`]`)));
            assert(!match(to!string(ch),regex(`[^\`~ch~`]`)));
            assert(match(to!string(ch),regex(`[\`~ch~`-\`~ch~`]`)));
        }
        //bugzilla 7718
        string strcmd = "./myApp.rb -os OSX -path \"/GIT/Ruby Apps/sec\" -conf 'notimer'";
        auto reStrCmd = regex (`(".*")|('.*')`, "g");
        assert(equal(map!"a[0]"(matchFn(strcmd, reStrCmd)),
                     [`"/GIT/Ruby Apps/sec"`, `'notimer'`]));
    }
    test_body!bmatch();
    test_body!match();
}

// tests for replace
unittest
{
    void test(alias matchFn)()
    {
        import std.string : toUpper;

        foreach(i, v; TypeTuple!(string, wstring, dstring))
        {
            auto baz(Cap)(Cap m)
            if (is(Cap == Captures!(Cap.String)))
            {
                return std.string.toUpper(m.hit);
            }
            alias String = v;
            assert(std.regex.replace!(matchFn)(to!String("ark rapacity"), regex(to!String("r")), to!String("c"))
                   == to!String("ack rapacity"));
            assert(std.regex.replace!(matchFn)(to!String("ark rapacity"), regex(to!String("r"), "g"), to!String("c"))
                   == to!String("ack capacity"));
            assert(std.regex.replace!(matchFn)(to!String("noon"), regex(to!String("^n")), to!String("[$&]"))
                   == to!String("[n]oon"));
            assert(std.regex.replace!(matchFn)(to!String("test1 test2"), regex(to!String(`\w+`),"g"), to!String("$`:$'"))
                   == to!String(": test2 test1 :"));
            auto s = std.regex.replace!(baz!(Captures!(String)))(to!String("Strap a rocket engine on a chicken."),
                    regex(to!String("[ar]"), "g"));
            assert(s == "StRAp A Rocket engine on A chicken.");
        }
        debug(std_regex_test) writeln("!!! Replace test done "~matchFn.stringof~"  !!!");
    }
    test!(bmatch)();
    test!(match)();
}

// tests for splitter
unittest
{
    auto s1 = ", abc, de,     fg, hi, ";
    auto sp1 = splitter(s1, regex(", *"));
    auto w1 = ["", "abc", "de", "fg", "hi", ""];
    assert(equal(sp1, w1));

    auto s2 = ", abc, de,  fg, hi";
    auto sp2 = splitter(s2, regex(", *"));
    auto w2 = ["", "abc", "de", "fg", "hi"];

    uint cnt;
    foreach(e; sp2) {
        assert(w2[cnt++] == e);
    }
    assert(equal(sp2, w2));
}

unittest
{
    char[] s1 = ", abc, de,  fg, hi, ".dup;
    auto sp2 = splitter(s1, regex(", *"));
}

unittest
{
    auto s1 = ", abc, de,  fg, hi, ";
    auto w1 = ["", "abc", "de", "fg", "hi", ""];
    assert(equal(split(s1, regex(", *")), w1[]));
}

unittest
{ // bugzilla 7141
    string pattern = `[a\--b]`;
    assert(match("-", pattern));
    assert(match("b", pattern));
    string pattern2 = `[&-z]`;
    assert(match("b", pattern2));
}
unittest
{//bugzilla 7111
    assert(match("", regex("^")));
}
unittest
{//bugzilla 7300
    assert(!match("a"d, "aa"d));
}

unittest
{//bugzilla 7674
    assert("1234".replace(regex("^"), "$$") == "$1234");
    assert("hello?".replace(regex(r"\?", "g"), r"\?") == r"hello\?");
    assert("hello?".replace(regex(r"\?", "g"), r"\\?") != r"hello\?");
}
unittest
{// bugzilla 7679
    foreach(S; TypeTuple!(string, wstring, dstring))
    {
        enum re = ctRegex!(to!S(r"\."));
        auto str = to!S("a.b");
        assert(equal(std.regex.splitter(str, re), [to!S("a"), to!S("b")]));
        assert(split(str, re) == [to!S("a"), to!S("b")]);
    }
}
unittest
{//bugzilla 8203
    string data = "
    NAME   = XPAW01_STA:STATION
    NAME   = XPAW01_STA
    ";
    auto uniFileOld = data;
    auto r = regex(
       r"^NAME   = (?P<comp>[a-zA-Z0-9_]+):*(?P<blk>[a-zA-Z0-9_]*)","gm");
    auto uniCapturesNew = match(uniFileOld, r);
    for(int i = 0; i < 20; i++)
        foreach (matchNew; uniCapturesNew) {}
    //a second issue with same symptoms
    auto r2 = regex(`([а-яА-Я\-_]+\s*)+(?<=[\s\.,\^])`);
    match("аллея Театральная", r2);
}
unittest
{// bugzilla 8637 purity of enforce
    auto m = match("hello world", regex("world"));
    enforce(m);
}

// bugzilla 8725
unittest
{
  static italic = regex( r"\*
                (?!\s+)
                (.*?)
                (?!\s+)
                \*", "gx" );
  string input = "this * is* interesting, *very* interesting";
  assert(replace(input, italic, "<i>$1</i>") ==
      "this * is* interesting, <i>very</i> interesting");
}

// bugzilla 8349
unittest
{
    enum peakRegexStr = r"\>(wgEncode.*Tfbs.*\.(?:narrow)|(?:broad)Peak.gz)</a>";
    enum peakRegex = ctRegex!(peakRegexStr);
    //note that the regex pattern itself is probably bogus
    assert(match(r"\>wgEncode-blah-Tfbs.narrow</a>", peakRegex));
}

// bugzilla 9211
unittest
{
    auto rx_1 =  regex(r"^(\w)*(\d)");
    auto m = match("1234", rx_1);
    assert(equal(m.front, ["1234", "3", "4"]));
    auto rx_2 = regex(r"^([0-9])*(\d)");
    auto m2 = match("1234", rx_2);
    assert(equal(m2.front, ["1234", "3", "4"]));
}

// bugzilla 9280
unittest
{
    string tomatch = "a!b@c";
    static r = regex(r"^(?P<nick>.*?)!(?P<ident>.*?)@(?P<host>.*?)$");
    auto nm = match(tomatch, r);
    assert(nm);
    auto c = nm.captures;
    assert(c[1] == "a");
    assert(c["nick"] == "a");
}


// bugzilla 9579
unittest
{
    char[] input = ['a', 'b', 'c'];
    string format = "($1)";
    // used to give a compile error:
    auto re = regex(`(a)`, "g");
    auto r = replace(input, re, format);
    assert(r == "(a)bc");
}

// bugzilla 9634
unittest
{
    auto re = ctRegex!"(?:a+)";
    assert(match("aaaa", re).hit == "aaaa");
}

//bugzilla 10798
unittest
{
    auto cr = ctRegex!("[abcd--c]*");
    auto m  = "abc".match(cr);
    assert(m);
    assert(m.hit == "ab");
}

// bugzilla 10913
unittest
{
    @system static string foo(const(char)[] s)
    {
        return s.dup;
    }
    @safe static string bar(const(char)[] s)
    {
        return s.dup;
    }
    () @system {
        replace!((a) => foo(a.hit))("blah", regex(`a`));
    }();
    () @safe {
        replace!((a) => bar(a.hit))("blah", regex(`a`));
    }();
}

// bugzilla 11262
unittest
{
    enum reg = ctRegex!(r",", "g");
    auto str = "This,List";
    str = str.replace(reg, "-");
    assert(str == "This-List");
}

// bugzilla 11775
unittest
{
    assert(collectException(regex("a{1,0}")));
}

// bugzilla 11839
unittest
{
    assert(regex(`(?P<var1>\w+)`).namedCaptures.equal(["var1"]));
    assert(collectException(regex(`(?P<1>\w+)`)));
    assert(regex(`(?P<v1>\w+)`).namedCaptures.equal(["v1"]));
    assert(regex(`(?P<__>\w+)`).namedCaptures.equal(["__"]));
    assert(regex(`(?P<я>\w+)`).namedCaptures.equal(["я"]));
}

// bugzilla 12076
unittest
{
    auto RE = ctRegex!(r"(?<!x[a-z]+)\s([a-z]+)");
    string s = "one two";
    auto m = match(s, RE);
}

// bugzilla 12105
unittest
{
    auto r = ctRegex!`.*?(?!a)`;
    assert("aaab".matchFirst(r).hit == "aaa");
    auto r2 = ctRegex!`.*(?!a)`;
    assert("aaab".matchFirst(r2).hit == "aaab");
}

//bugzilla 11784
unittest
{
    assert("abcdefghijklmnopqrstuvwxyz"
        .matchFirst("[a-z&&[^aeiuo]]").hit == "b");
}

//bugzilla 12366
unittest
{
     auto re = ctRegex!(`^((?=(xx+?)\2+$)((?=\2+$)(?=(x+)(\4+$))\5){2})*x?$`);
     assert("xxxxxxxx".match(re).empty);
     assert(!"xxxx".match(re).empty);
}

// bugzilla 12582
unittest
{
    auto r = regex(`(?P<a>abc)`);
    assert(collectException("abc".matchFirst(r)["b"]));
}

// bugzilla 12691
unittest
{
    assert(bmatch("e@", "^([a-z]|)*$").empty);
    assert(bmatch("e@", ctRegex!`^([a-z]|)*$`).empty);
}

//bugzilla  12713
unittest
{
    assertThrown(regex("[[a-z]([a-z]|(([[a-z])))"));
}

//bugzilla 12747
unittest
{
    assertThrown(regex(`^x(\1)`));
    assertThrown(regex(`^(x(\1))`));
    assertThrown(regex(`^((x)(?=\1))`));
}

}//version(unittest)
