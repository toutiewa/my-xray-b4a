FROM p4gefau1t/trojan-go:latest

# 复制配置文件
COPY config.json /etc/trojan-go/config.json

# Back4app 部署时通常会通过环境变量指定端口，这里我们强制让它运行
CMD ["/usr/local/bin/trojan-go", "-config", "/etc/trojan-go/config.json"]
