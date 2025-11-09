# Dockerfile simples: usa o JAR já gerado pela pipeline (drop/app.jar)

FROM eclipse-temurin:21-jre

WORKDIR /app

# A pipeline cria a pasta drop/ e copia o JAR para app.jar
COPY drop/app.jar /app/app.jar

EXPOSE 8080

ENV JAVA_OPTS=""

ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar /app/app.jar"]
