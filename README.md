# SSR2HeroKu

* 快速部署

[![](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy?template=https://github.com/ssrlive/examples11/tree/master)


* config.json

装完以后，将 `${PASSWORD}` 和两个 `${APP_SITE}` 和 `${UUID}` 替换成你的值就可以用于客户端了。

```
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
        "path": "/${UUID}/",
        "root_cert_file": ""
    }
}
```
