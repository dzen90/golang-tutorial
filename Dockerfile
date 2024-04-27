FROM golang:latest
WORKDIR /app
COPY *.go ./
COPY go.mod go.sum ./
COPY ./public/ ./public
COPY ./views/ ./views
RUN go mod download
RUN go mod verify
RUN go build -o todolist server.go
CMD [ "./todolist" ]