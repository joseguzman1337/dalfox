# BUILDER
FROM golang:latest AS builder
WORKDIR /go/src/app
COPY . .

RUN go get -d -v ./...
RUN go build -o dalfox

# RUNNING
<<<<<<< HEAD
<<<<<<< HEAD
FROM debian:11.2
=======
FROM debian:bullseye
>>>>>>> c17ac8f8663adb8a61e28e2673282ad82f65664f
=======
FROM debian:11
>>>>>>> master
RUN mkdir /app
COPY --from=builder /go/src/app/dalfox /app/dalfox
COPY --from=builder /go/src/app/samples /app/samples
WORKDIR /app/
CMD ["/app/dalfox"]
