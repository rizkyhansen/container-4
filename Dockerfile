# FROM golang:1.24.2-alpine3.21

# WORKDIR /app
# COPY . .

# RUN go build -o myapp

# ENTRYPOINT ["./myapp"]

FROM golang:1.24.2-alpine3.21 AS builder

WORKDIR /app
COPY . .

RUN go build -o myapp

FROM alpine:latest AS release

WORKDIR /app
COPY --from=builder /app/myapp .
EXPOSE 8000
ENTRYPOINT ["./myapp"]

# menggunakan multistage pada golang, multistage ini
# 1. Memisahkan proses build dan runtime
# 2. Hasil akhir: image yang lebih kecil & aman