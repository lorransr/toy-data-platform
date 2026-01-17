ARG AIRFLOW_VERSION=3.1.6
from apache/airflow:${AIRFLOW_VERSION}-python3.11

RUN PYTHON_VERSION="$(python --version | cut -d " " -f 2 | cut -d "." -f 1-2)" && \
  CONSTRAINT_URL="https://raw.githubusercontent.com/apache/airflow/constraints-${AIRFLOW_VERSION}/constraints-${PYTHON_VERSION}.txt" && \
  uv pip install "apache-airflow[docker,fab,common-compat]==${AIRFLOW_VERSION}" \
  --constraint "${CONSTRAINT_URL}"
