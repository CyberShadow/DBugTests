struct PutItemRequest
{
    string tableName;
    AttributeValue[string] item;
}

struct AttributeValue
{
    bool BOOL;
    string S;
    AttributeValue[string] M;
    string[] SS;
}

void main()
{
    PutItemRequest request = {
	    tableName: "table1",
		item: [
		    "field1": {S: "LALA"},
		]
	};
}
