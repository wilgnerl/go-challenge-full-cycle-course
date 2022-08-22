FROM golang:alpine AS builder

WORKDIR /app

COPY *.go ./
RUN go build ./hello-world.go

FROM scratch

WORKDIR /

COPY --from=builder /app /

ENTRYPOINT [ "./hello-world" ]

