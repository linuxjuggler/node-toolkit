FROM node:7-alpine

MAINTAINER Mhd Zaher Ghaibeh <z@zah.me>

RUN apk update && \
    apk add git ca-certificates wget && \
    update-ca-certificates && \
    npm install -g gulp bower npm-cache yarn && \
    npm cache clean && \
    rm -rf /var/lib/apt/lists/* /var/cache/* /tmp/* /var/tmp/* && \
    wget -O /usr/local/bin/dumb-init http://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64 && \
    chmod +x /usr/local/bin/dumb-init

WORKDIR /workspace

ENTRYPOINT ["/usr/local/bin/dumb-init", "--"]
