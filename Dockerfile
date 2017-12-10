FROM node:slim

LABEL Maintainer="Zaher Ghaibeh <z@zah.me>" \
      Description="Lightweight nodejs container based on ubuntu with bower, yarm, gulp and typescript." \
      org.label-schema.name="Nodejs Toolkit" \
      org.label-schema.description="Lightweight nodejs container based on ubuntu with bower, yarm, gulp and typescript." \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="https://github.com/linuxjuggler/node-toolkit.git" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.schema-version="1.0.0"

RUN apt-get update && apt-get -yqq install apt-transport-https && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get -yqq update && \
    apt-get -yqq --no-install-recommends install git yarn && \
    npm -g i gulp-cli bower npm-cache typescript && \
    npm cache verify && npm cache clean --force && \
    apt-get -yqq autoremove && \
    apt-get -yqq clean && \
    rm -rf /var/lib/apt/lists/* /var/cache/* /tmp/* /var/tmp/* && \
    wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64 && \
    chmod +x /usr/local/bin/dumb-init


WORKDIR /workspace

ENTRYPOINT ["/usr/local/bin/dumb-init", "--"]
