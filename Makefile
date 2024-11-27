build:
	@go build -o bin/gofintech

run: build
	@./bin/gofintech

test:
	@go test -v ./...

