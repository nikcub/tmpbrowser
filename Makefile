APPNAME="tmpbrowser"
OSC=$(shell which osacompile)
HD=$(shell which hdiutil)

build:
	@echo "Building .."
	@${OSC} -o build/tmpbrowser.app src/main.applescript

clean:
	@echo "Cleaning up .."
	rm -rf build/*
	rm -rf dist/*

zipdist:
	@echo "Zipppp.."
	zip -r dist/tmpbrowser.zip build/tmpbrowser.app

dist:
	@mkdir dist
	@ln -s /Applications/ build/Applications
	echo "Building disk image.."
	hdiutil create -ov -srcfolder build -volname ${APPNAME} dist/${APPNAME}.dmg

all: clean build dist

.PHONY: clean build dist
