# BUILDER
FROM golang:latest AS builder
WORKDIR /go/src/app
COPY . .

RUN go get -d -v ./...
RUN go build -o dalfox

# RUNNING
FROM debian:bullseye-20220125
RUN mkdir /app
COPY --from=builder /go/src/app/dalfox /app/dalfox
COPY --from=builder /go/src/app/samples /app/samples
WORKDIR /app/
CMD ["/app/dalfox"]
