plugins {
    java
    id("org.springframework.boot") version "3.2.5"
    id("io.spring.dependency-management") version "1.1.4"
    id("jacoco")
}

group = "com.lorarch"
version = "0.0.1-SNAPSHOT"

java {
    toolchain {
        languageVersion.set(JavaLanguageVersion.of(21))
    }
}

repositories {
    mavenCentral()
}

dependencies {
    // Web + MVC + validação
    implementation("org.springframework.boot:spring-boot-starter-web")
    implementation("org.springframework.boot:spring-boot-starter-validation")
    implementation("org.springframework.boot:spring-boot-starter-thymeleaf")

    // JPA
    implementation("org.springframework.boot:spring-boot-starter-data-jpa")

    // Segurança (login simples)
    implementation("org.springframework.boot:spring-boot-starter-security")

    // Cache simples
    implementation("org.springframework.boot:spring-boot-starter-cache")

    // Swagger/OpenAPI
    implementation("org.springdoc:springdoc-openapi-starter-webmvc-ui:2.5.0")

    // Driver CORRETO para SQL Server (com Java 21 use o artefato jre11)
    runtimeOnly("com.microsoft.sqlserver:mssql-jdbc:12.8.1.jre11")

    // Front (se estiver usando)
    implementation("org.webjars:bootstrap:5.3.3")

    // Testes
    testImplementation("org.springframework.boot:spring-boot-starter-test")
}

tasks.withType<Test> {
    useJUnitPlatform()
}

// Jacoco: gerar relatório depois dos testes
tasks.test {
    finalizedBy(tasks.jacocoTestReport)
}

tasks.jacocoTestReport {
    dependsOn(tasks.test)
    reports {
        xml.required.set(true)   // gera build/reports/jacoco/test/jacocoTestReport.xml
        html.required.set(true)  // relatórios em HTML
    }
}
