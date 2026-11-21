FROM python:3.14-slim

LABEL org.opencontainers.image.title="demoapi_py"
LABEL org.opencontainers.image.description="FastAPI demo application"
LABEL org.opencontainers.image.source="https://github.com/rrlabz/demoapi_py"

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir --retries 10 --timeout 60 -r requirements.txt

COPY app ./app

RUN useradd --create-home --uid 1000 appuser \
    && chown -R appuser:appuser /app

USER appuser

EXPOSE 8000

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
