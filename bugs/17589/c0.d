import std.stdio;

string readAndLog(string filename){
    import std.file;
    auto text=readText(filename);
    write(filename," read successfully!\n");
    return text;
}

void main(){
    writeln(readAndLog("important_data.txt"));
}
