#DSN="host=localhost port=54325 user=postgres password=password dbname=sqli sslmode=disable timezone=UTC connect_timeout=5"
DSN="host=localhost port=54327 user=postgres password=password dbname=sqli sslmode=disable timezone=UTC connect_timeout=5"
BINARY_NAME=sqli-eafit

## build: Build binary
build:
	@echo "Building back end..."
	go build -o ${BINARY_NAME} ./cmd/api/
	@echo "Binary built!"

## run: builds and runs the application
run: build
	@echo "Starting back end..."
	@env DSN=${DSN} ./${BINARY_NAME} &
	@echo "Back end started!"

## clean: runs go clean and deletes binaries
clean:
	@echo "Cleaning..."
	@go clean
	@rm ${BINARY_NAME}
	@echo "Cleaned!"

## start: an alias to run
start: run

## stop: stops the running application
stop:
	@echo "Stopping back end..."
	@-pkill -SIGTERM -f "./${BINARY_NAME}"
	@echo "Stopped back end!"

## restart: stops and starts the running application
restart: stop start