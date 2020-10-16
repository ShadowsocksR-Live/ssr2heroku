FROM alpine:latest
LABEL maintainer="https://github.com/ssrlive"

RUN apk add --no-cache --virtual .build-deps ca-certificates curl \
 && mkdir -m 777 /ssrbin \
 && curl -L -H "Cache-Control: no-cache" -o ssr.zip https://github.com/ShadowsocksR-Live/shadowsocksr-native/releases/latest/download/ssr-native-linux-x64.zip \
 && unzip ssr.zip -d /ssrbin ssr-server config.json\
 && chmod +x /ssrbin/ssr-server \
 && rm -rf ssr.zip \
 && chgrp -R 0 /ssrbin \
 && chmod -R g+rwX /ssrbin

ADD entrypoint.sh /ssrbin/entrypoint.sh
RUN chmod +x /ssrbin/entrypoint.sh 

CMD /ssrbin/entrypoint.sh
