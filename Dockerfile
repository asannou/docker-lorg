FROM php:5-alpine

WORKDIR /root

RUN docker-php-ext-install pcntl
RUN apk --no-cache --virtual build-dependencies add git \
  && git clone https://github.com/jensvoid/lorg.git /usr/src/lorg \
  && apk del build-dependencies

ENTRYPOINT ["/usr/src/lorg/lorg"]
