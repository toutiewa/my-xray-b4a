FROM ghcr.io/sagernet/sing-box:latest

# 复制配置文件
COPY config.json /etc/sing-box/config.json

# 设置工作目录
WORKDIR /var/lib/sing-box

# 这里的逻辑是：启动时用 sed 动态替换 config.json 里的端口为 Back4app 分配的端口
# 如果 Back4app 没给端口，默认使用 8080
CMD sed -i "s/8080/${PORT:-8080}/g" /etc/sing-box/config.json && \
    /usr/local/bin/sing-box run -c /etc/sing-box/config.json
