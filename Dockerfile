FROM golang AS build
ARG PKGPATH=hello
ENV CGO_ENABLED=0
COPY . /go/src/$PKGPATH/
WORKDIR /go/src/$PKGPATH/
RUN go get .
RUN go build -o hello .

FROM scratch
ARG PKGPATH=hello
MAINTAINER SquareScale Engineering <engineering@squarescale.com>
LABEL maintainer "SquareScale Engineering <engineering@squarescale.com>"
LABEL name "hello"

WORKDIR /
COPY --from=build /go/src/$PKGPATH/hello /app
ENTRYPOINT ["/app"]
