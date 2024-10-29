from lib.logic import wiki_search, wiki_summary, add

def test_search():
    assert "Harry Porter" in wiki_search()
def test_summary():
    assert " Harry" in wiki_summary()
def test_add():
    assert add() == 11