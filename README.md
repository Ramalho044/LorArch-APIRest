🧭 Projeto LorArch – API REST e Automação DevOps na Nuvem (Sprint 4 – FIAP)
👤 Identificação.

Aluno: Marcos Antonio Ramalho Neto
RM: 556773
Turma: 2TDSPW
Curso: Análise e Desenvolvimento de Sistemas
Instituição: FIAP – Faculdade de Informática e Administração Paulista

🚀 Descrição do Projeto

O LorArch é uma aplicação web e API REST desenvolvida em Spring Boot para o gerenciamento de motocicletas dentro de um galpão de operações.
Além das funcionalidades do sistema (registro, status e ocorrências), o projeto foi totalmente automatizado em uma pipeline CI/CD, utilizando Azure DevOps, Docker, Azure Container Registry (ACR) e Azure Container Instance (ACI).

Essa estrutura permite que o código seja compilado, testado, empacotado e implantado automaticamente em um ambiente em nuvem, garantindo entregas contínuas e auditáveis.

🧩 Arquitetura da Solução
🔹 Ferramentas e Serviços Utilizados
Camada	Tecnologia / Serviço
Linguagem e Framework	Java 21 + Spring Boot 3.2.x
Build	Gradle
Versionamento	Git + GitHub
CI/CD	Azure DevOps
Containerização	Docker
Registro de Imagens	Azure Container Registry (ACR)
Hospedagem da Aplicação	Azure Container Instance (ACI)
Banco de Dados (para CI)	Microsoft SQL Server 2022 (Docker)
Monitoramento	Azure Portal / Logs de Pipeline
Cobertura de Testes	Jacoco + Gradle

⚙️ Pipeline CI/CD – Estrutura e Etapas

A pipeline foi construída em YAML no Azure DevOps e executa as etapas a seguir:

Checkout do Repositório

Faz o clone do código hospedado no GitHub.

Repositório:
https://github.com/Ramalho044/LorArch-APIRest

🧪 Execução dos Testes (Jacoco)

Durante o processo de CI, os testes unitários são executados com Jacoco, garantindo que o código seja validado antes da publicação.

| Métrica                          | Resultado |
| -------------------------------- | --------- |
| **Total de testes executados**   | 100%      |
| **Falhas**                       | 0         |
| **Cobertura de código (Jacoco)** | 21,23%    |
| **Build status**                 | ✅ Sucesso |

☁️ Publicação e Deploy

A imagem Docker gerada é enviada para o Azure Container Registry (ACR), e de lá é implantada no Azure Container Instance (ACI) automaticamente.

🔸 Azure Container Registry (ACR)

Nome: acrlorch

Endereço: acrlorch.azurecr.io

Imagem publicada: acrlorch.azurecr.io/fiap/lorarch:latest

🔸 Azure Container Instance (ACI)

Nome: lorarch-app

Região: East US

IP Público: (gerado automaticamente)

FQDN: lorarch-app.eastus.azurecontainer.io

Porta exposta: 8080

Status: Running / Waiting (pode ser reativado via portal Azure)

🔸 Banco de Dados

Durante a pipeline, o SQL Server é executado em container temporário

🔗 Links Importantes
Item	Link
| Item                               | Link                                                                                           |
| ---------------------------------- | ---------------------------------------------------------------------------------------------- |
| **GitHub (Código Fonte)**          | [https://github.com/Ramalho044/LorArch-APIRest](https://github.com/Ramalho044/LorArch-APIRest) |
| **Pipeline DevOps (CI/CD)**        | [https://dev.azure.com/RM556773/LorAch/_build](https://dev.azure.com/RM556773/LorAch/_build)   |
| **Azure Container Registry (ACR)** | `acrlorch.azurecr.io`                                                                          |
| **Container Instance (ACI)**       | `http://lorarch-app.eastus.azurecontainer.io:8080`                                             |
| **Banco de Dados (CI Docker)**     | `mcr.microsoft.com/mssql/server:2022-latest`                                                   |


Documentação Técnica do Sistema LorArch

(Conteúdo original do projeto – arquitetura, endpoints, DTOs, validações, etc. Mantido conforme documentação fornecida pelo aluno.)

LorArch – Aplicação Web & API REST com Spring Boot
Descrição do Projeto

O LorArch é uma aplicação web em Spring Boot para gerenciar o fluxo operacional de motos em um galpão. O projeto oferece API REST e interface web (Thymeleaf), com autenticação via Spring Security e Oracle DB para desenvolvimento.

Objetivos

Registrar entrada/saída de motos

Acompanhar status (disponível, manutenção, danificada, etc.)

Lançar ocorrências (manutenção, diagnóstico, uso, etc.)

Disponibilizar API REST e páginas web para operação

Arquitetura
Controllers

REST: /api/**

Web (Thymeleaf): /motos/** e /ocorrencias/**

Camadas

Service: regras de negócio

Repository: persistência

DTO: objetos de entrada (API/Form)

Model: entidades JPA

Config: configurações do projeto

Exception: tratamento de erros

Resources: parte Web do projeto

Tecnologias

Java 21

Spring Boot 3.2.x

Spring Web

Spring Security

Spring Data JPA

Spring Cache

Thymeleaf

Oracle Database

Bean Validation

Gradle

API REST
| Método | Endpoint          | Descrição      |
| ------ | ----------------- | -------------- |
| POST   | `/api/motos`      | Cria nova moto |
| GET    | `/api/motos`      | Lista todas    |
| PUT    | `/api/motos/{id}` | Atualiza       |
| DELETE | `/api/motos/{id}` | Remove         |

Ocorrências

| Método | Endpoint                | Descrição            |
| ------ | ----------------------- | -------------------- |
| POST   | `/api/ocorrencias`      | Cria nova ocorrência |
| GET    | `/api/ocorrencias`      | Lista todas          |
| PUT    | `/api/ocorrencias/{id}` | Atualiza             |
| DELETE | `/api/ocorrencias/{id}` | Remove               |

Autores

Feito com 💙 por Marcos Ramalho, Gabriel Lima, Cauã Marcelo Machado
