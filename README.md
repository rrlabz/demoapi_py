# Demo API

A simple FastAPI application with two endpoints.

## Run

```bash
pip install -r requirements.txt
uvicorn app.main:app --reload
```

## Endpoints

- `GET /home` - returns a welcome message
- `GET /healthcheck` - returns the service health status
