FROM adoptopenjdk/openjdk8:alpine-jre

ARG H2_VERSION=1.4.200

RUN apk add --no-cache curl

ENV DOWNLOAD http://central.maven.org/maven2/com/h2database/h2/${H2_VERSION}/h2-${H2_VERSION}.jar

RUN curl ${DOWNLOAD} -o h2.jar

FROM adoptopenjdk/openjdk8:alpine-jre

MAINTAINER Jane Gao <hayond@qq.com>

# COPY h2-1.4.200.jar /opt/h2/bin/h2.jar
COPY --from=0 h2.jar /opt/h2/bin/h2.jar
COPY h2.server.properties /root/.h2.server.properties

ENV DATA_DIR /opt/h2/data
ENV H2_OPTIONS -ifNotExists

EXPOSE 8082 9092

CMD java -cp /opt/h2/bin/h2.jar org.h2.tools.Server \
 	-web -webAllowOthers \
 	-tcp -tcpAllowOthers \
 	-baseDir ${DATA_DIR} ${H2_OPTIONS}


