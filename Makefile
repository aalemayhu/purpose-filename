all:
	swift build

clean:
	swift build --clean

test: clean build
	swift test
