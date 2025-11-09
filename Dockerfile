FROM eclipse-temurin:21-jre

WORKDIR /app

# Copia o JAR gerado pelo bootJar
COPY build/libs/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/app/app.jar"]
