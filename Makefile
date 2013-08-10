OSC=$(shell which osacompile)

build:
	@echo "Building .."
	@${OSC} -o build/tmpbrowser.app src/main.applescript

clean:
	@echo "Cleaning up .."
	rm -rf build/*
	rm -rf dist/*

dist:
	@echo "Zipppp.."
	zip -r dist/tmpbrowser.zip build/tmpbrowser.app

all: clean build dist

.PHONY: clean build dist
