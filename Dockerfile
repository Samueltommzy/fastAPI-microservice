FROM python:3.10.12-alpine3.17

WORKDIR /app

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . main.py /app/

CMD [ "fastapi" ,"run","main.py","--port","8080" ]
# ENTRYPOINT [ "python","main.py"]

