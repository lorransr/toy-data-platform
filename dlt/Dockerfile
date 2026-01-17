FROM python:3.10-slim

WORKDIR /app

COPY requirements.txt .

COPY --from=docker.io/astral/uv:latest /uv /uvx /bin/

RUN uv pip install --no-cache-dir -r requirements.txt --system

COPY . .

CMD ["python", "filesystem_pipeline.py"]
