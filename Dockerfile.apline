FROM node:alpine

LABEL Maintainer="Zaher Ghaibeh <z@zah.me>" \
      Description="Lightweight nodejs container based on alpine with bower, yarm, gulp."

RUN apk --no-cache update && apk --no-cache upgrade && apk add wget yarn && \
    apk --no-cache add ca-certificates && update-ca-certificates && \
    npm install -g gulp bower typescript && \
    npm cache verify && \
    wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64 && \
    chmod +x /usr/local/bin/dumb-init

WORKDIR /workspace

ENTRYPOINT ["/usr/local/bin/dumb-init", "--"]
