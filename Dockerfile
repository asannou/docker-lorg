FROM php:8-alpine@sha256:330e4f7bbf86f4aee32c88bbb8856d3cda3feb8b3361b6f3544fea21fc91683d

WORKDIR /root

RUN apk --no-cache add libjpeg-turbo libwebp libpng freetype \
  && apk --no-cache --virtual .build-dependencies add libjpeg-turbo-dev libwebp-dev libpng-dev freetype-dev \
  && docker-php-ext-configure gd --with-jpeg --with-webp --with-freetype \
  && docker-php-ext-install pcntl gd \
  && apk del .build-dependencies

COPY php.ini /usr/local/etc/php/

RUN apk --no-cache --virtual .build-dependencies add git \
  && git clone --depth=1 --branch php8 --single-branch https://github.com/asannou/lorg.git /usr/src/lorg \
  && apk del .build-dependencies

RUN sed -i -E "s/(static \\\$phpids_path = ')[^']+/\1\/usr\/src\/lorg\/phpids\//g" /usr/src/lorg/lorg \
  && sed -i -E "s/(static \\\$geoip_path = ')[^']+/\1\/usr\/src\/lorg\/geoip\//g" /usr/src/lorg/lorg \
  && sed -i -E "s/(static \\\$pchart_path = ')[^']+/\1\/usr\/src\/lorg\/pchart\//g" /usr/src/lorg/lorg

ENTRYPOINT ["/usr/src/lorg/lorg"]
