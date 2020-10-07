FROM openjdk:11

EXPOSE 8080

RUN curl https://download.newrelic.com/newrelic/java-agent/newrelic-agent/current/newrelic-java.zip -O \
&& unzip newrelic-java.zip -d /app \
&& rm newrelic-java.zip

ADD target/docker-demo.jar /app/docker-demo.jar

ENV NEW_RELIC_APP_NAME="My Application"
ENV NEW_RELIC_LICENSE_KEY="license_key"
ENV NEW_RELIC_LOG_FILE_NAME="STDOUT"

ENTRYPOINT [ "java","-javaagent:/app/newrelic/newrelic.jar","-jar","/app/docker-demo.jar" ]