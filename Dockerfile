FROM openshift/base-centos7

MAINTAINER Luis Fernando Gomes <dev@luiscoms.com.br>

EXPOSE 8080

ENV JAVA_VERSON 1.8.0

LABEL io.k8s.description="Platform for building and running Spring Boot applications" \
      io.k8s.display-name="Spring Boot Gradle" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="builder,java,java8,gradle,springboot"

RUN yum update -y && \
  yum install -y curl && \
  yum install -y java-$JAVA_VERSON-openjdk java-$JAVA_VERSON-openjdk-devel && \
  yum clean all

ENV JAVA_HOME /usr/lib/jvm/java

COPY ./s2i/bin/ $STI_SCRIPTS_PATH

RUN chown -R 1001:1001 /opt/app-root

# This default user is created in the openshift/base-centos7 image
USER 1001

# TODO: Set the default port for applications built using this image
# EXPOSE 8080

# TODO: Set the default CMD for the image
# CMD ["usage"]
