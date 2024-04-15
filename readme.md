# Flutter dev box

A simple Docker container used for building and testing flutter apps under linux.
It is able to build for linux and android

## Build
```bash
$ docker build -t flutter_dev_builder .
```

## Using the Lontainer Locally
```bash
$ docker run --rm -it flutter_dev_builder bash
```

## Usage
Inside the container you can build your flutter app.

To restore dependencies 
```bash
$ flutter pub get
```

To build a release apk use
```bash
$ flutter build apk --release
```

To release a debug apk use
```bash
$ flutter build apk --debug
```

# Specs
* Build Time: 6 min (fast env)
* Total image Size: 4.13 GB