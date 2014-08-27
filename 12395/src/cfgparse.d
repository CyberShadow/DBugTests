module cfgparse;

import kmp;

import std.algorithm;
import std.conv;
import std.exception;
import std.range;
import std.stdio;
import std.string;
import std.traits;
import std.typecons;
import std.uni;
import std.utf;
import std.variant;

unittest {
	auto rules = parseBNFRules(`
<number> ::= <float> | <int>
<float> ::= <float-base> <exponent> | <float-base>
<float-base> ::= <int> <float_tail>
<int> ::= '-' <nonneg_int> | <nonneg_int>
<nonneg_int> ::= \d <nonneg_int> | \d
<float_tail> ::= '.' <nonneg_int> | '.'
<exponent> ::= <e-char> <int>
<e-char> ::= 'E' | 'e'
`);
	parse_node pn = rules["<number>"].matches("3.14159265");
//	assert(pn.matches(mv([[[mv("3"),mv([".","14159265"])]]])));
}

/+
Variant mv(Variant[] arr) {
	return Variant(arr);
}
Variant mv(T)(T[] arr)
if(!is(T:Variant))
{
	Variant[] res;
	foreach(T t;arr) {
		res ~= mv(t);
	}
	return Variant(res);
}
Variant mv(T)(T v) 
if(!isArray!T)
{
	return Variant(v);
}
+/

@safe
public const struct parse_node {
	const expression exp;
	immutable string val;
	const parse_node[] children;
/+	
	bool matches(Variant[] arr_tree)
	{
		if(arr_tree.length != children.length)
			return false;
		foreach(Variant t; arr_tree) {
			if(!matches(t))
				return false;
		}
		return true;
	}
	bool matches(Variant v) {
		if(v.convertsTo!(Variant[]))
			return matches(v.get!(Variant[]));
		else
			return val == v.get!string;
	}
+/
}

@safe
private immutable struct shallow(T) {
	T* ptr;
	size_t len;
	pure this(immutable T[] arr) {
		ptr = arr.ptr;
		len = arr.length;
	}
}

alias immutable(shallow!char) shallow_string;

@safe
pure void make_substitutions(bool first)(ref expression this_exp, expression[string] map) {
	if(cast(placeholder)this_exp) {
		this_exp = map[this_exp.name];
	} else if(conjunction exp = cast(conjunction)this_exp) {
		inner_substitutions!(first,conjunction)(exp, map);
	} else if(disjunction exp = cast(disjunction)this_exp) {
		inner_substitutions!(first,disjunction)(exp, map);
	}
}

@safe
pure void inner_substitutions(bool first, T)(ref T this_exp, expression[string] map) {
	if(!(first || this_exp.name.empty))
		return;
	foreach(ref expression exp; this_exp.inner) {
		exp.make_substitutions!false(map);
	}
}

@safe
public class expression {
	public string name;

	public pure abstract parse_node matches(string inp);
}

@safe
pure private class memo_expression : expression {
	private parse_node[shallow_string] match_table;

	pure abstract parse_node check_match(string inp);

	public pure final override parse_node matches(string inp) {
		shallow_string ss = shallow_string(inp);
		const parse_node* pres = ss in match_table;
		if(pres) {
			return *pres;
		} else {
			parse_node res = check_match(inp);
			match_table[ss] = res;
			return res;
		}
	}
}

@safe
private final class conjunction : memo_expression {
	expression[] inner;
	
	pure this(expression[] inner) {
		this.inner = inner;
	}
	
	pure override parse_node check_match(string inp) {
		string remaining = inp;
		parse_node[] pieces;
		int res_end = 0;
		foreach(expression exp; inner) {
			parse_node matched = exp.matches(remaining);
			if(matched.exp) {
				pieces ~= matched;
				res_end += matched.val.length;
				remaining = remaining[matched.val.length..$];
			} else {
				return parse_node();
			}
		}
		return parse_node(this, inp[0..res_end], pieces);
	}
}

@safe
private final class disjunction : memo_expression {
	expression[] inner;

	pure this(expression[] inner) {
		this.inner = inner;
	}
	pure override parse_node check_match(string inp) {
		foreach(expression exp; inner) {
			parse_node matched = exp.matches(inp);
			if(matched.exp) {
				return parse_node(this, matched.val, [matched]);
			}
		}
		return parse_node();
	}
}

@safe
private final class exact : expression {
	immutable string val;

	pure this(string myval) {
		val = myval;
	}
	pure override const parse_node matches(string inp) {
		if(inp.startsWith(val)) {
			return parse_node(this, val, []);
		}else
			return parse_node();
	}
}

@safe
private final class chartype(alias check_type) : expression {
	pure override const parse_node matches(string inp) {
		if(check_type(inp.front)) {
			return parse_node(this, inp[0..inp.stride()], []);
		}else
			return parse_node();
	}
}

@safe
private final class placeholder : expression {
	pure this(string name) {
		this.name = name;
	}

	pure override const parse_node matches(string inp) {
		assert(false);
	}
}

@safe
pure expression[string] parseBNFRules(string rule_list) {
	return parseBNFRules(split_rules(rule_list));
}

@safe
pure string[] split_rules(string inp) {
	string[] res;
	size_t lastRuleStart = 0;
	size_t lastTokStart = 0;
	bool first = true;
	auto tokens = get_tokens(inp);
	while(!tokens.empty) {
		size_t i = tokens.curPos;
		string token = tokens.front;
		scope(success) tokens.popFront();
		if(token == "::=") {
			if(first)
				first = false;
			else
				res ~= inp[lastRuleStart..lastTokStart];
			lastRuleStart = lastTokStart;
		}
		lastTokStart = i;
	}
	res ~= inp[lastRuleStart..$];
	return res;
}

@safe
pure bool wrapped_with(string s, string left, string right) {
	return s.startsWith(left) && s.endsWith(right);
}

@safe
pure expression[string] parseBNFRules(const string[] bnf_rules...) {
	expression[string] res;
	foreach(string rule; bnf_rules) {
		size_t i = 0;
		string name;
		expression[][] seppattern = [[]];
		auto tokens = get_tokens(rule);
		while(!tokens.empty) {
			string token = tokens.front;
			scope(success) tokens.popFront();
			scope(success) i++;
			if(i == 0) {
				name = token;
				assert(name.wrapped_with("<",">"));
			} else if(i == 1) {
				enforce(token == "::=");
			} else if(token == "|"){
				expression[] add = [];
				seppattern ~= add;
			} else if(token.wrapped_with(`"`,`"`) || token.wrapped_with("'","'")) {
				seppattern[$-1] ~= new exact(token[1..$-1]);
			} else if(token.wrapped_with("<",">")){
				seppattern[$-1] ~= new placeholder(token);
			}
		}
		expression[] conjpattern;
		foreach(expression[] e; seppattern) {
			if(e.length == 1) {
				conjpattern ~= e[0];
			} else {
				conjpattern ~= new conjunction(e);
			}
		}
		expression res_exp;
		if(conjpattern.length == 1) {
			res_exp = conjpattern[0];
		} else {
			res_exp = new disjunction(conjpattern);
		}
		res_exp.name = name;
		res[name] = res_exp;
	}
	foreach(string name, ref expression value; res) {
		make_substitutions!true(value, res);
	}
	return res;
}

@safe
pure bool isLinewhite(dchar c) {
	return isWhite(c) && c != '\n';
}

@safe
pure bool isNewline(dchar c) {
	return c == '\n';
}

template ctexp(string name) {
	immutable string ctexp =
	"private immutable expression " ~ name
		~ " = new immutable chartype!is" ~ capitalize(name) ~ ";";
}

mixin(ctexp!("newline"));
mixin(ctexp!("linewhite"));
mixin(ctexp!("number"));
mixin(ctexp!("lower"));
mixin(ctexp!("upper"));

private immutable char[char] matching;
private immutable expression[char] char_expr;
static this() {
	matching = ['<':'>', '"' : '"', '\'' : '\''];
	char_expr = ['w' : linewhite, 'd' : number,
				 'l' : lower, 'u' : upper, 'n' : newline];
}

@safe
private struct get_tokens {
	private immutable size_t slen;
	private size_t cutoff = 0;
	private string remaining;
	pure this(const string dpiece) {
		slen = dpiece.length;
		this.remaining = dpiece;
		findCutoff();
	}
	pure void findCutoff() {
		while(true) {
			remaining.stripLeft();
			if(remaining.empty)
				return;
			else if(remaining.front.isWhite) {
				remaining.popFront();
			} else
				break;
		}
		if(remaining[0] == '|')
			cutoff = 1;
		else if(remaining[0] == '\\')
			cutoff = 2;
		else if(remaining.startsWith("::="))
			cutoff = 3;
		else {
			cutoff = remaining[1..$].indexOf(matching[remaining[0]]) + 2;
		}
	}

	@property
	pure string front() const {
		return remaining[0..cutoff];
	}

	pure void popFront() {
		remaining = remaining[cutoff..$];
		findCutoff();
	}
	@property
	pure bool empty() const {
		return remaining.empty;
	}
	@property
	pure size_t curPos() const {
		return slen - remaining.length;
	}
}

static assert(isInputRange!(get_tokens));
