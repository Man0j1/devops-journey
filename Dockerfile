FROM python:3.8-slim as builder
WORKDIR /app
COPY requirements.txt /app/requirements.txt
RUN pip3 install -r requirements.txt
COPY app.py /app/app.py

FROM python:3.8-slim
WORKDIR /app
COPY --from=builder /app/app.py /app/app.py
EXPOSE 5000
CMD ["python3", "app.py"]
