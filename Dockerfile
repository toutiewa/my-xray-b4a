FROM alpine:latest

# 安装依赖并直接从官方 GitHub 获取最新版 Xray
RUN apk add --no-cache curl \
    && bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install

# 将上面的配置文件放入容器
COPY config.json /etc/xray/config.json

# 关键：Back4app 启动时会分配随机端口给 $PORT，这条命令会自动把 config.json 里的 8080 替换为正确的端口
CMD sed -i "s/8080/$PORT/g" /etc/xray/config.json && /usr/local/bin/xray -config /etc/xray/config.json
