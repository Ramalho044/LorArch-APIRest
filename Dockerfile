
FROM eclipse-temurin:21-jdk AS build
WORKDIR /usr/app

COPY . .


RUN ./gradlew clean bootJar --no-daemon -x test

# Normaliza o nome do jar para app.jar
RUN JAR=$(ls build/libs/*SNAPSHOT.jar | head -n1) && \
    mkdir -p build/libs && \
    cp "$JAR" build/libs/app.jar

FROM eclipse-temurin:21-jre
WORKDIR /app

COPY --from=build /usr/app/build/libs/app.jar /app/app.jar

EXPOSE 8080

ENTRYPOINT ["java","-jar","/app/app.jar"]
