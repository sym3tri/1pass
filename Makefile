all: 1pass

.PHONY: test
DEPS=*.go onepass/*.go jsonutil/*.go plist/*.go rangeutil/*.go cmdmodes/*.go

1pass: $(DEPS)
	go get -d
	go build
	go test ./...

test: 1pass
	go test ./...
	pip install --quiet --requirement requirements.txt
	python ./client_test.py

