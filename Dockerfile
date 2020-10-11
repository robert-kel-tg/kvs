# Stage 1: Compile the binary in a containerized Golang environment
FROM golang:1.13 as build

COPY . /go/src/kvs

WORKDIR /go/src/kvs

RUN go get github.com/gorilla/mux

RUN CGO_ENABLED=0 GOOS=linux go build -o kvs

# Stage 2: Build the Key-Value Store prod image
FROM scratch as image

COPY --from=build /go/src/kvs/kvs .

EXPOSE 8080

CMD ["/kvs"]
