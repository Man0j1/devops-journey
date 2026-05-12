FROM python:3.8-slim as builder
WORKDIR /app
COPY requirements.txt /app/requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt
COPY app.py /app/app.py

FROM python:3.8-slim
WORKDIR /app
COPY --from=builder /app/app.py /app/app.py
COPY requirements.txt /app/requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt
EXPOSE 5000
CMD ["python3", "app.py"]
