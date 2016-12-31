FROM node:slim

MAINTAINER Mhd Zaher Ghaibeh <z@zah.me>

RUN apt-get -yqq update && \
    apt-get -yqq --no-install-recommends install git && \
    npm install -g gulp bower npm-cache yarn && \
    npm cache clean && \
    apt-get -yqq autoremove && \
    apt-get -yqq clean && \
    rm -rf /var/lib/apt/lists/* /var/cache/* /tmp/* /var/tmp/* && \
    wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64 && \
    chmod +x /usr/local/bin/dumb-init

WORKDIR /workspace

ENTRYPOINT ["/usr/local/bin/dumb-init", "--"]
