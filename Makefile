
build:
	npm run build

build-docs:
	npm run build:docs

setup:
	pip install -r requirements.txt
	npm install

server: build-docs build
	npm run dev

debug:
	npm run debug