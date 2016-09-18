# s2i-java
#
# This image provide a base for running Spring Boot based applications.
# It provides a base Java 8 installation.
FROM openshift/base-centos7

MAINTAINER Luis Fernando Gomes <dev@luiscoms.com.br>

EXPOSE 8080

ENV JAVA_VERSION 1.8.0

LABEL io.k8s.description="Platform for building and running Spring Boot applications" \
      io.k8s.display-name="Spring Boot Maven" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="builder,java,java8,maven,springboot"

RUN yum update -y && \
  yum install -y curl && \
  yum install -y java-$JAVA_VERSION-openjdk java-$JAVA_VERSION-openjdk-devel && \
  yum clean all

ENV JAVA_HOME /usr/lib/jvm/java

ENV MAVEN_VERSION 3.3.9
RUN curl -fsSL https://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz | tar xzf - -C /usr/share \
  && mv /usr/share/apache-maven-$MAVEN_VERSION /usr/share/maven \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

ENV MAVEN_HOME /usr/share/maven

COPY ./.s2i/bin/ $STI_SCRIPTS_PATH

RUN chown -R 1001:1001 /opt/app-root

USER 1001

CMD $STI_SCRIPTS_PATH/usage
