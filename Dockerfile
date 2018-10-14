FROM alpine
MAINTAINER D119 <contact@moonbear.cn>

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
    && apk update && apk upgrade \
    && apk add --no-cache caddy \
    && rm -rf /var/cache/apk/* \
    && mkdir /vhosts \
    && echo 'import /vhosts/*' > /etc/Caddyfile

EXPOSE 80
EXPOSE 443

VOLUME /vhosts

ENTRYPOINT caddy -conf /etc/Caddyfile