# Etapa 1: Build
FROM gradle:8.7.0-jdk21 AS build
WORKDIR /usr/app
COPY . .
RUN chmod +x ./gradlew && ./gradlew clean bootJar -x test

# Etapa 2: Runtime
FROM eclipse-temurin:21-jre
WORKDIR /app
COPY --from=build /usr/app/build/libs/app.jar /app/app.jar
EXPOSE 8080

# Variáveis sobrescritas no ACI
ENV SERVER_PORT=8080
ENV SPRING_DATASOURCE_URL=""
ENV SPRING_DATASOURCE_USERNAME=""
ENV SPRING_DATASOURCE_PASSWORD=""
ENV SPRING_JPA_HIBERNATE_DDL_AUTO=validate

ENTRYPOINT ["java","-jar","/app/app.jar"]
