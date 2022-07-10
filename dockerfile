FROM golang:1.18 AS build
WORKDIR /tmp 
COPY /mygo/ .
RUN GOOS=linux go build -a -installsuffix cgo -o app . && chmod +x ./app


FROM docker:dind
COPY --from=build /tmp/app .
CMD [ "./app" ]
