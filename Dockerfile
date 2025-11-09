# Imagem runtime Java 21
FROM eclipse-temurin:21-jre

WORKDIR /app

# Copia o JAR GERADO PELO GRADLE NA PIPELINE
COPY build/libs/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/app/app.jar"]
