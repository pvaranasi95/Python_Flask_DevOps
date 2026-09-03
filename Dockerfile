FROM python:3.10 AS builder

WORKDIR /app

COPY . .

RUN pip install --prefix=/install -r app/requirements.txt

FROM python:3.10-slim

WORKDIR /app

COPY --from=builder /install /usr/local

COPY --from=builder /app /app

EXPOSE 5000

CMD ["python", "app/app.py"]
