# Flutter dev box

A simple Docker container used for building and testing flutter apps under linux.
It is able to build for linux and android

# Build
```bash
$ docker build -t flutter_dev_builder .
```

# Using the container locally
```bash
$ docker run --rm -it flutter_dev_builder bash
```

# Specs
Build time: 6 min (fast env)
Total image Size: 4.13 GB