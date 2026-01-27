FROM python:3.11.11-slim

WORKDIR /app

COPY requirements.txt .

COPY --from=docker.io/astral/uv:latest /uv /uvx /bin/

RUN uv pip install -r requirements.txt --system

COPY . .

CMD ["python", "filesystem_pipeline.py"]
