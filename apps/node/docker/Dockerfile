FROM ubuntu:14.04

# Install git, nodejs, npm, and build dependencies for npm
RUN export PYTHON=python3 \
    && apt-get -qq update \
    && apt-get install -y curl \
    && curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash - \
    && apt-get update \
    && apt-get install -y git nodejs \
    && apt-get install -y mysql-client python make g++ \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install PM2
RUN npm install -g pm2

RUN mkdir -p /home/ubuntu/data/api

# Define working directory
WORKDIR /home/ubuntu/data/api

# Expose api (8888)
EXPOSE 8888

CMD pm2 start --no-daemon /home/ubuntu/data/api/servers.json
