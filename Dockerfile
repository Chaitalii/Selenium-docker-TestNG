FROM  openjdk:8u191-jre-alpine3.8
RUN apk add curl jq
WORKDIR /usr/share/code
ADD target/web-test-1.0-SNAPSHOT.jar   web-test-1.0-SNAPSHOT.jar
ADD target/web-test-1.0-SNAPSHOT-tests.jar   web-test-1.0-SNAPSHOT-tests.jar
ADD target/libs/* libs/
ADD testng.xml testng.xml
ADD TestData.xlsx TestData.xlsx
ADD healthcheck.sh healthcheck.sh
#ENTRYPOINT java -cp web-test-1.0-SNAPSHOT-tests.jar:web-test-1.0-SNAPSHOT.jar:libs/* -DHUB_HOST=$HUB_HOST  org.testng.TestNG testng.xml
ENTRYPOINT sh healthcheck.sh

