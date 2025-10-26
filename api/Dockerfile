FROM python:3.11-slim
WORKDIR /app
RUN pip install --no-cache-dir flask flask-cors python-dotenv
COPY . .
EXPOSE 5000
ENV FLASK_APP=api.py \
    FLASK_RUN_HOST=0.0.0.0 \
    FLASK_RUN_PORT=5000
CMD ["flask", "run"]
