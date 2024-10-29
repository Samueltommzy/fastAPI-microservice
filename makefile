#To articulate all steps in the project lifecycle
freeze:
	pip freeze > requirements.txt
install:
	#install commands
	pip install --upgrade pip && pip install -r requirements.txt
format:
	#format code
	black *.py lib/*.py
lint:
	#flake8 or pylint - disable recommended and configuration warrnings
	pylint --disable R,C *.py lib/*.py 
test:
	#test
	python -m pytest test_logic.py test_api.py --cov=lib
build:
	#build container
	docker build -t fast-api:2 .
run:
	#run docker
	docker run -d -p 8080:8080 b167b5101ba5
deploy:
	#deploy
	aws ecr get-login-password --region eu-west-2 | docker login --username AWS --password-stdin 766350019609.dkr.ecr.eu-west-2.amazonaws.com
	docker build -t fastapi
	docker tag fastapi:latest 766350019609.dkr.ecr.eu-west-2.amazonaws.com/fastapi:latest
	docker push 766350019609.dkr.ecr.eu-west-2.amazonaws.com/fastapi:latest
    
all: install format lint test deploy