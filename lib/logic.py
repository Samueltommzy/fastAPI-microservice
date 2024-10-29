import wikipedia

def wiki_summary(name="Harry Porter", length=2) -> str:
    wiki_data = wikipedia.summary(name, length)
    return wiki_data
def wiki_search(name="Harry Porter") -> str:
    print(name)
    wiki_data = wikipedia.search(name)
    # print("data ", wiki_data)
    return wiki_data
def add():
    x = 5
    y = 6
    return x+y
