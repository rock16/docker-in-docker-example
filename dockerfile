FROM docker:dind
RUN apt-get update && apt-get install -y golang-go
ADD . . 
