FROM alpine:latest
LABEL maintainer="https://github.com/ssrlive"

RUN apk add --no-cache --virtual .build-deps ca-certificates curl \
 && mkdir -m 777 /ssrbin \
 && chgrp -R 0 /ssrbin \
 && chmod -R g+rwX /ssrbin \
 && curl -L -H "Cache-Control: no-cache" -o ssr.zip https://github.com/ShadowsocksR-Live/shadowsocksr-native/releases/latest/download/ssr-native-linux-x64.zip \
 && unzip ssr.zip -d /ssrbin ssr-server config.json\
 && chmod +xrw /ssrbin/ssr-server \
 && mv /ssrbin/ssr-server /ssrbin/ssrserver \
 && chmod -x+rw /ssrbin/config.json \
 && rm -rf ssr.zip

ADD entrypoint.sh /ssrbin/entrypoint.sh
RUN chmod +xrw /ssrbin/entrypoint.sh 

CMD /ssrbin/entrypoint.sh
