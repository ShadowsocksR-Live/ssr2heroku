FROM alpine:latest
LABEL maintainer="https://github.com/ShadowsocksR-Live/ssr2heroku"

RUN apk add --no-cache --virtual .build-deps ca-certificates curl \
 && mkdir -m 777 /v2raybin \
 && chgrp -R 0 /v2raybin \
 && chmod -R g+rwX /v2raybin \
 && cd /v2raybin \
 && curl -L -H "Cache-Control: no-cache" -o v2ray.zip https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip \
 && unzip v2ray.zip \
 && rm -rf v2ray.zip \
 && chmod +x /v2raybin/v2ray

ADD entrypoint.sh /v2raybin/entrypoint.sh
RUN chmod +x /v2raybin/entrypoint.sh 

CMD /v2raybin/entrypoint.sh
