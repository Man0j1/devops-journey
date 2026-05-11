FROM python:3.8-slim
WORKDIR /app
COPY requirements.txt /app/requirements.txt
RUN pip3 install -r requirements.txt
COPY app.py /app/app.py
CMD ["python3", "app.py"]