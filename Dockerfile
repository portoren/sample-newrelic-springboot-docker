FROM alpine:3 as minion
RUN apk add --no-cache curl unzip
RUN curl https://download.newrelic.com/newrelic/java-agent/newrelic-agent/current/newrelic-java.zip -O \
&& unzip newrelic-java.zip -d /app \
&& rm newrelic-java.zip


FROM openjdk:11-jdk-slim
EXPOSE 8080
COPY --from=minion /app/newrelic /app/newrelic
ADD target/docker-demo.jar /app/docker-demo.jar
# ENV NEW_RELIC_APP_NAME="My Application"
# ENV NEW_RELIC_LICENSE_KEY="license_key"
ENV NEW_RELIC_LOG_FILE_NAME="STDOUT"
ENTRYPOINT [ "java","-javaagent:/app/newrelic/newrelic.jar","-jar","/app/docker-demo.jar" ]