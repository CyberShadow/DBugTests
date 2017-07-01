import std.typecons: TypeTuple;
struct Node {
    Node* left, right;
}
void main() {
    Node* n = new Node();
    auto le = n.left;
    auto t = TypeTuple!(n.left);
}
