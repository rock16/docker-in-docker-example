FROM golang:1.18 AS build
ENV GO111MODULE=on 
WORKDIR /mytemp 
COPY /mygo/go.mod .
COPY /mygo/go.sum .
RUN go mod download
COPY /mygo/app.go .
#RUN go mod init 
RUN GOOS=linux go build -a -installsuffix cgo -o app . && chmod +x ./app
#RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build


FROM docker:dind
COPY --from=build /mytemp/app .
CMD [ "/app" ]
