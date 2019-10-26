# docker-h2-database
=========

Dockerized H2 database service.

## Features

* Inspired by [oscarfonts/h2](https://github.com/oscarfonts/docker-h2).
* Using [adoptopenjdk/openjdk8:alpine-jre](https://hub.docker.com/r/adoptopenjdk/openjdk8) to reduce images size. only 45.81MB.
* Only packing H2 jar-file into Docker image (retrieved from Maven Central).
* H2-DATA location on /opt/h2/data
* H2_OPTIONS default -ifNotExists
* Exposing default ports 8082 / 9092

## Running

Get the image:

```
docker pull hayond/h2database
```

Run as a service, exposing ports 9092 (TCP database server) and 8082 (web interface) and mapping data volume to host:

```
docker run -d -p 9092:9092 -p 8082:8082 -v /path/to/local/h2data:/opt/h2/data --name=h2database hayond/h2database
```
