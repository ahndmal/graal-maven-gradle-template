# https://www.graalvm.org/22.1/docs/getting-started/container-images/
# FROM ghcr.io/graalvm/jdk:java17-22.1.0

### 1
# https://hub.docker.com/r/marksailes/al2-graalvm
#FROM marksailes/al2-graalvm:17-22.3.0
#COPY . .
#RUN mvn -Pnative -Dagent clean package
#CMD ["target/my-app"]


##### 2
FROM ghcr.io/graalvm/jdk:java17-22.1.0 AS build-aot

RUN yum update -y
RUN yum install wget -y
RUN wget https://www-eu.apache.org/dist/maven/maven-3/3.6.1/binaries/apache-maven-3.6.1-bin.tar.gz -P /tmp
RUN tar xf /tmp/apache-maven-3.6.1-bin.tar.gz -C /opt
RUN ln -s /opt/apache-maven-3.6.1 /opt/maven
RUN ln -s /opt/graalvm-ce-1.0.0-rc16 /opt/graalvm

ENV JAVA_HOME=/opt/graalvm
ENV M2_HOME=/opt/maven
ENV MAVEN_HOME=/opt/maven
ENV PATH=${M2_HOME}/bin:${PATH}
ENV PATH=${JAVA_HOME}/bin:${PATH}

COPY ./pom.xml ./pom.xml
COPY src ./src/

ENV MAVEN_OPTS='-Xmx6g'
RUN mvn -Dmaven.test.skip=true -Pnative-image-fargate clean package

CMD ["target/my-app"]



### ubuntu
#FROM ubuntu:focal
#
#RUN wget https://www-eu.apache.org/dist/maven/maven-3/3.6.1/binaries/apache-maven-3.6.1-bin.tar.gz -P /tmp
#RUN tar xf /tmp/apache-maven-3.6.1-bin.tar.gz -C /opt
#RUN ln -s /opt/apache-maven-3.6.1 /opt/maven

