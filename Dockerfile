FROM golang:1.20 AS compiler
WORKDIR /app
COPY go.mod main.go .
RUN go build main.go

FROM ubuntu:latest
WORKDIR /app
COPY --from=compiler /app/main .
CMD ["./main"]
