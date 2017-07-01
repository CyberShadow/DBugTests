bool addArticle()
{
    scope(failure) return false;  // #2
    return true;   // #1
}
