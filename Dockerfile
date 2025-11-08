# Usar apenas a JRE (runtime)
FROM eclipse-temurin:21-jre

WORKDIR /app

# O pipeline copia o JAR para drop/app.jar e depois faz docker build na raiz,
# então basta copiar o JAR gerado em build/libs (já presente no workspace).
COPY build/libs/*.jar /app/app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/app/app.jar"]
