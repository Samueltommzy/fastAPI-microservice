from lib.logic import wiki_search, wiki_summary

from fastapi import FastAPI
import uvicorn
app = FastAPI()
@app.get("/")
def root():
    return {"message": "hello world"}
@app.get("/add/{num1}/{num2}")
def addition(num1:int, num2:int):
    total = num1 + num2
    return {"sum": total}

@app.get("/search/{name}")
def search_wiki(name: str):
    result = wiki_search(name)
    return {"result": result}

@app.get("/summary/{name}")
def get_summary(name:str):
    response = wiki_summary(name)
    return {"result": response}

if __name__ == "__main__":
    uvicorn.run(app)