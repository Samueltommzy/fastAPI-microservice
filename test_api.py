from fastapi.testclient import TestClient
from main import app

test_client = TestClient(app)

def testSearch():
    response = test_client.get("/search/obama")
    assert response.status_code == 200