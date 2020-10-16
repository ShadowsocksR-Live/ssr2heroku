FROM alpine:latest
LABEL maintainer="https://github.com/ssrlive"

RUN apk add --no-cache --virtual .build-deps ca-certificates curl \
 && curl -L -H "Cache-Control: no-cache" -o ssr.zip https://github.com/ShadowsocksR-Live/shadowsocksr-native/releases/latest/download/ssr-native-linux-x64.zip \
 && unzip ssr.zip -d ssr-server \
 && chmod +x ssr-server \
 && rm -rf ssr.zip \

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh 

CMD /entrypoint.sh
