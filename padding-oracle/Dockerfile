FROM python:3.7-slim

RUN pip install pycryptodome==3.9.0

COPY server.py /app.py
COPY encrypt.py /encrypt.py

ENTRYPOINT ["python", "/app.py"]
