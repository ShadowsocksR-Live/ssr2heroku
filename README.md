# SSR2HeroKu

## 快速部署

在 heroku 网站上注册账号，登录，一切就绪以后，点下图链接，按照提示输入各值，点击下部的 `Deploy app` 按钮就部署在 heroku 的 docker 容器上了。

[![](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy?template=https://github.com/ShadowsocksR-Live/ssr2heroku/tree/main)


## config.json

部署完毕，将以下文件中的 `${PASSWORD}` 和两个 `${APP_SITE}` 和 `${SECRET_PATH}` 替换成你的值就可以用于客户端了。

```json
{
    "password": "${PASSWORD}",
    "method": "aes-128-ctr",
    "protocol": "origin",
    "protocol_param": "",
    "obfs": "plain",
    "obfs_param": "",

    "udp": true,
    "idle_timeout": 300,
    "connect_timeout": 6,
    "udp_timeout": 6,

    "server_settings": {
        "listen_address": "0.0.0.0",
        "listen_port": 80
    },

    "client_settings": {
        "server": "${APP_SITE}",
        "server_port": 443,
        "listen_address": "0.0.0.0",
        "listen_port": 1080
    },

    "over_tls_settings": {
        "enable": true,
        "server_domain": "${APP_SITE}",
        "path": "/${SECRET_PATH}/",
        "root_cert_file": ""
    }
}
```
