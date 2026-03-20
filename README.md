# 🛠️ Toy Data Platform

Bem-vindo(a)! Este projeto é uma plataforma de dados pronta para usar, criada para quem quer aprender ou experimentar com ferramentas modernas de dados — sem complicação.

## O que é isso?

Imagine um "laboratório de dados" completo, onde você pode testar, visualizar e transformar dados, tudo no seu próprio computador. Você não precisa instalar nada complicado: basta rodar um comando e tudo funciona junto, graças ao Docker.

## Principais recursos

- **Airflow**: Automatiza tarefas, como buscar e processar dados em horários programados.
- **MinIO**: Um lugar para guardar arquivos e dados, parecido com o Google Drive, mas para projetos de dados.
- **Lakekeeper**: Organiza e cataloga as tabelas de dados, facilitando encontrar o que você precisa.
- **Trino**: Permite fazer buscas e análises em grandes volumes de dados usando uma linguagem parecida com o Excel (SQL).
- **Superset**: Crie gráficos e dashboards bonitos para visualizar seus dados.
- **dlt**: Ferramenta para trazer dados de outros lugares para sua plataforma.
- **dbt**: Ajuda a transformar e organizar os dados para que fiquem prontos para análise.

## Como funciona a plataforma?

Veja abaixo um desenho mostrando como as ferramentas se conectam (não se preocupe se não entender tudo agora!):

![Eng Diagram](eng-diagram.png "Diagram")

## Pré-requisitos

- [Docker](https://www.docker.com/) (permite rodar tudo facilmente)
- [Docker Compose](https://docs.docker.com/compose/)

## Como usar? (Passo a passo)

1. **Baixe este projeto:**
   ```bash
   git clone https://github.com/seu-usuario/data-platform.git
   cd data-platform
   ```

2. **Ligue a plataforma:**
   ```bash
   docker compose up -d
   ```
   Isso vai iniciar todos os serviços automaticamente.

3. **Acesse as ferramentas:**
   - Airflow: [http://localhost:8080](http://localhost:8080)  
     Login: `airflow` / `airflow`
   - MinIO: [http://localhost:9001](http://localhost:9001)  
     Login: `root` / `rootrootroot`
   - Trino: [http://localhost:8081](http://localhost:8081)
   - Superset: [http://localhost:8088](http://localhost:8088)
   - Lakekeeper: [http://localhost:8181](http://localhost:8181)

## O que já vem pronto?

- Pastas para guardar dados no MinIO:  
  `raw`, `trusted`, `refined`
- Catálogos organizados no Lakekeeper:  
  `raw`, `trusted`, `refined`

## O que você pode personalizar?

- Criar seus próprios fluxos de tarefas no Airflow (adicione arquivos em `airflow/dags`)
- Adicionar novas fontes de dados no Trino
- Criar dashboards no Superset
- Integrar regras de acesso no Lakekeeper
- Trazer novos dados com o dlt
- Montar fluxos de transformação com dbt e Airflow

## Como saber se está funcionando?

Rode:
```bash
docker ps
```
Você deve ver todos os serviços rodando. Se tiver dúvidas, pergunte!

## Dicas e informações

- A configuração foi feita para ser fácil de testar localmente.
- Todos os serviços se comunicam entre si automaticamente.

## 🧑‍💻 Contribuindo

Pull Requests são super bem-vindos! Se tiver ideias ou encontrar problemas, abra uma issue ou mande uma sugestão.
