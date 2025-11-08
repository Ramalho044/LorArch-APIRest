# =========================
# STAGE 1 - BUILD (Gradle)
# =========================
FROM eclipse-temurin:21-jdk AS build

WORKDIR /usr/app

# Copia tudo pro container
COPY . .

# Garante que o gradlew é executável
RUN chmod +x ./gradlew

# Gera o JAR
RUN ./gradlew clean bootJar --no-daemon

# Renomeia o JAR gerado para app.jar (é isso que o stage final espera)
RUN cp build/libs/*.jar build/libs/app.jar

# =========================
# STAGE 2 - RUNTIME
# =========================
FROM eclipse-temurin:21-jre

WORKDIR /app

# Copia o JAR pronto do stage de build
COPY --from=build /usr/app/build/libs/app.jar /app/app.jar

# Porta da aplicação
EXPOSE 8080

# Nada de senha de banco aqui. Isso vai por variável de ambiente no ACI.
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
