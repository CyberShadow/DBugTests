module foo;
//import c;
import c : NotErase; // <- breaks build of module `bar`
