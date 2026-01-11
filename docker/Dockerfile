# 贝尔实验室 Spring 官方推荐镜像 JDK下载地址 https://bell-sw.com/pages/downloads/
FROM bellsoft/liberica-openjdk-alpine:17-cds

LABEL maintainer="Persi.Liao xiangchu.liao@gmail.com"
LABEL com.persiliao.image.title="Echo Service"
LABEL com.persiliao.image.description="Spring Cloud Application With Alibaba Nacos Server"
LABEL com.persiliao.image.url="https://github.com/persiliao/echo-service"
LABEL com.persiliao.image.version="1.0.0"

# Application
ENV ECHO_SERVICE_PORT=8889
ENV ECHO_SERVICE_APPLICATION_NAME="echo-service"
ENV ECHO_SERVICE_PROFILES_ACTIVE="dev"

# Nacos Config
ENV ECHO_SERVICE_CONFIG_SERVER="127.0.0.1:8848"
ENV ECHO_SERVICE_CONFIG_NAMESPACE="plublic"
ENV ECHO_SERVICE_CONFIG_FILE_EXTENSION="yml"

# Nacos Discovery
ENV ECHO_SERVICE_DISCOVERY_SERVER="127.0.0.1:8848"
ENV ECHO_SERVICE_DISCOVERY_NAMESPACE="public"

# Java
ENV JAVA_OPTS="-Xms256m -Xmx1024m -XX:+UseG1GC"

WORKDIR /echo-service

ADD ./echo-service.jar /echo-service/echo-service.jar

EXPOSE ${ECHO_SERVICE_PORT}

CMD ["-Djava.security.egd=file:/dev/./urandom", "-jar", "/echo-service/echo-service.jar"]

ENTRYPOINT ["java"]