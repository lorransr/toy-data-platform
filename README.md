# 🛠️ Toy data platform

Este projeto define uma plataforma de dados completa utilizando `Docker Compose`, com os seguintes componentes principais:

- **Apache Airflow** (orquestração de dados)
- **MinIO** (data lake S3-compatible)
- **Lakekeeper** (catálogo de metadados para tabelas Iceberg)
- **Trino** (engine de consulta SQL distribuída)
- **Apache Superset** (BI e visualização de dados)
- **dlt** (Ingestão de dados)
- **dbt** (Transformação de dados)

---

## Arquitetura

![Eng Diagram](eng-diagram.png "Diagram")

---

# Serviços

| Serviço           | Porta | Função |
|-------------------|-------|--------|
| **Airflow Web**       | 8080  | UI para orquestração de DAGs |
| **MinIO Console**     | 9001  | Interface S3-like para dados |
| **Trino**             | 8081  | SQL Query Engine |
| **Lakekeeper**        | 8181  | Catálogo de metadados Iceberg |
| **Superset**          | 8088  | Dashboards e visualizações |
| **Postgres (Airflow)**| 5432  | Banco de metadados do Airflow |
| **Postgres (Lakekeeper)**| 5433 | Banco do catálogo Lakekeeper |
| **Postgres (Superset)**| 5434 | Banco do Superset |

---

## ⚙️ Pré-requisitos

- Docker
- Docker Compose

---

## ▶️ Instruções de uso

1. **Clone o repositório:**

```bash
git clone https://github.com/seu-usuario/data-platform.git
cd data-platform
```

2. Suba os containers

```bash
docker compose up -d
```

3. **Acesse os serviços:**

   - Airflow: [http://localhost:8080](http://localhost:8080)
     - Login: `airflow` / `airflow`
   - MinIO: [http://localhost:9001](http://localhost:9001)
     - Login: `root` / `rootrootroot`
   - Trino UI: [http://localhost:8081](http://localhost:8081)
   - Superset: [http://localhost:8088](http://localhost:8088)
   - Lakekeeper: [http://localhost:8181](http://localhost:8181)
---

## 🗂️ Buckets criados automaticamente no MinIO

Ao iniciar, os seguintes buckets são criados:
``
- `raw`
- `trusted`
- `refined`

## Catálogos criados automaticamente no Lakekeeper
- `raw`
- `trusted`
- `refined`

---

## 🛠️ Customizações possíveis

- Adicionar DAGs personalizados em `airflow/dags`
- Adicionar catálogos no Trino (`trino/catalog/*.properties`)
- Criar visualizações no Superset
- Integrar políticas no Lakekeeper com AuthZ (atualmente `allowall`)
- Ingestão de novas entidades com o dlt
- montar um workflow de materialização com o dbt e o airflow

---

## Testes e verificação

Para verificar se os serviços estão de pé:

```bash
docker ps
```

Você deve ver todos os containers rodando corretamente.

---

## Notas

- A configuração usa `LocalExecutor` para facilitar testes locais.
- A comunicação entre os serviços acontece via rede Docker `platform-net`.

---

## 🧑‍💻 Contribuindo

Pull Requests são bem-vindos! Sinta-se livre para abrir issues ou sugerir melhorias.
