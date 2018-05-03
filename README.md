# Hello App

SPACE

## Build

```
$ CGO_ENABLED=0 GOOS=linux go build -o app .
```
```
$ docker build -t hello .
```

## Run

```
$ docker run --rm hello
```
