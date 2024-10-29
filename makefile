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
all: install lint test deploy