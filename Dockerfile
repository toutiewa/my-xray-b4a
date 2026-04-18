# 使用官方最新的轻量镜像
FROM ghcr.io/sagernet/sing-box:latest

# 复制你的配置文件到镜像内
COPY config.json /etc/sing-box/config.json

# 暴露端口，Back4App 必须监听一个端口
EXPOSE 8080

# 启动命令
ENTRYPOINT ["sing-box", "-D", "/var/lib/sing-box", "-C", "/etc/sing-box/", "run"]
