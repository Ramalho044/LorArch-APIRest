
# ETAPA 1: BUILD COM GRADLE

FROM gradle:8.7.0-jdk21 AS build
WORKDIR /usr/app

# Copia o código fonte e arquivos de configuração do Gradle
COPY . .

# Dá permissão e executa o build (gera o JAR sem rodar testes)
RUN chmod +x ./gradlew && ./gradlew clean bootJar -x test


# ETAPA 2: RUNTIME

FROM eclipse-temurin:21-jre
WORKDIR /app

# Copia o JAR gerado na etapa de build
COPY --from=build /usr/app/build/libs/*.jar /app/app.jar

# Expõe a porta da aplicação
EXPOSE 8080

# Variáveis de ambiente padrão (podem ser sobrescritas no ACI)
ENV SERVER_PORT=8080
ENV SPRING_DATASOURCE_URL=""
ENV SPRING_DATASOURCE_USERNAME=""
ENV SPRING_DATASOURCE_PASSWORD=""
ENV SPRING_JPA_HIBERNATE_DDL_AUTO=validate

# Comando de execução
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
