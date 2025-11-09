
FROM eclipse-temurin:21-jre

WORKDIR /app

COPY drop/app.jar /app/app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/app/app.jar"]

FROM eclipse-temurin:21-jdk AS build

WORKDIR /usr/app

COPY gradlew gradlew
COPY gradle gradle
COPY build.gradle settings.gradle ./
COPY src src

RUN chmod +x gradlew
RUN ./gradlew bootJar --no-daemon

RUN ls build/libs && \
    cp build/libs/*SNAPSHOT.jar build/libs/app.jar

FROM eclipse-temurin:21-jre

WORKDIR /app

COPY --from=build /usr/app/build/libs/app.jar /app/app.jar

EXPOSE 8080

ENV JAVA_OPTS=""

ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar /app/app.jar"]
