FROM ubuntu:14.04

ENV LEIN_ROOT true

# Install git, JDK7, and leiningen
RUN apt-get -qq update \
    && apt-get install -y git openjdk-7-jre-headless curl \
    && curl -o /usr/bin/lein https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein \
    && chmod +x /usr/bin/lein \
    && lein \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /home/ubuntu/data/api

# Define working directory
WORKDIR /home/ubuntu/data/api

# Expose api (8888)
EXPOSE 8888

CMD while :; do sleep 60; done
