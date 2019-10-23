FROM ubuntu:16.04

ENV Z_HOME="/zeppelin" \
    JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64 \
    ZEPPELIN_WAR_TEMPDIR="/tmp/webapps"

RUN apt-get -y update && \
    apt-get install -y --no-install-recommends apt-utils awscli wget curl grep sed dpkg openjdk-8-jdk-headless && \
    wget -q -O tini.deb "https://github.com/krallin/tini/releases/download/v0.18.0/tini_0.18.0.deb" && \
    dpkg -i tini.deb && \
    rm tini.deb && \
    rm -rf /var/lib/apt/lists/*
ENV Z_VERSION="0.8.0"
RUN wget -q -O /tmp/zeppelin-${Z_VERSION}-bin-netinst.tgz http://archive.apache.org/dist/zeppelin/zeppelin-${Z_VERSION}/zeppelin-${Z_VERSION}-bin-netinst.tgz && \
    tar -zxf /tmp/zeppelin-${Z_VERSION}-bin-netinst.tgz && \
    rm -rf /tmp/zeppelin-${Z_VERSION}-bin-netinst.tgz && \
    mv /zeppelin-${Z_VERSION}-bin-netinst ${Z_HOME} && \
    rm -rf ${Z_HOME}/interpreter/python && \
    adduser --disabled-password --gecos '' zeppelin && \
    mkdir -p ${Z_HOME}/conf && \
    chown -R zeppelin:zeppelin ${Z_HOME}/conf && \
    mkdir -p ${Z_HOME}/local-repo && \
    chown -R zeppelin:zeppelin ${Z_HOME}/local-repo && \
    mkdir -p ${Z_HOME}/logs && \
    chown -R zeppelin:zeppelin ${Z_HOME}/logs && \
    mkdir -p ${Z_HOME}/notebook && \
    chown -R zeppelin:zeppelin ${Z_HOME}/notebook
USER zeppelin
EXPOSE 8080

ENTRYPOINT [ "/usr/bin/tini", "--" ]
WORKDIR ${Z_HOME}
CMD ["bin/zeppelin.sh"]
