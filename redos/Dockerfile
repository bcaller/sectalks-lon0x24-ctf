FROM python:3.8-rc-slim

RUN useradd -ms /bin/bash guest

RUN apt-get update && \
    apt-get install -y xinetd && \
    rm -rf /var/lib/apt/lists/*

COPY xinetd.conf /etc/xinetd.d/redos
COPY run.sh /run.sh
COPY app.py /app.py

ENTRYPOINT ["/usr/sbin/xinetd", "-dontfork"]
