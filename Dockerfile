FROM buildpack-deps:jessie-curl

ENV CONFD_VERSION 0.9.0

RUN curl -kL https://github.com/kelseyhightower/confd/releases/download/v${CONFD_VERSION}/confd-${CONFD_VERSION}-linux-amd64 -o /usr/local/bin/confd && \
  chmod a+x /usr/local/bin/confd && \
  mkdir -p /etc/confd/{conf.d,templates}

ADD init.sh /init.sh
ADD conf.d/bidata.toml /etc/confd/conf.d/bidata.toml
ADD templates/bi-data.properties.tmpl /etc/confd/templates/bi-data.properties.tmpl

ENV BLA test1
ENV BLE test2
ENTRYPOINT ["/init.sh"]
