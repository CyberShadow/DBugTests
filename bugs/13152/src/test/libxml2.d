import std.stdio;
import std.string;
import bcd.libxml2.parser;
import bcd.libxml2.tree;

void print_element_names(char[] prefix, _xmlNode * a_node)
{
    _xmlNode *cur_node = null;

    for (cur_node = a_node; cur_node; cur_node = cur_node.next) {
        if (cur_node.type == xmlElementType.XML_ELEMENT_NODE) {
            writefln("%s%s", prefix, toString(cur_node.name));
            
            print_element_names(prefix ~ " ", cur_node.children);
        }
    }
}


/**
 * Simple example to parse a file called "file.xml", 
 * walk down the DOM, and print the name of the 
 * xml elements nodes.
 */
int main(char[][] args)
{
    _xmlDoc *doc = null;
    _xmlNode *root_element = null;

    if (args.length != 2)
        return(1);

    /*
     * this initialize the library and check potential ABI mismatches
     * between the version it was compiled for and the actual shared
     * library used.
     */
    xmlCheckVersion(20621);

    /*parse the file and get the DOM */
    doc = xmlReadFile(args[1], null, 0);

    if (doc == null) {
        printf("error: could not parse file %s\n", args[1]);
    }

    /*Get the root element node */
    root_element = xmlDocGetRootElement(doc);

    print_element_names("", root_element);

    /*free the document */
    xmlFreeDoc(doc);

    /*
     *Free the global variables that may
     *have been allocated by the parser.
     */
    xmlCleanupParser();

    return 0;
}
