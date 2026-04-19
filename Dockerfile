FROM ghcr.io/sagernet/sing-box:latest

WORKDIR /etc/sing-box

COPY config.json /etc/sing-box/config.json

RUN mkdir -p /var/lib/sing-box

EXPOSE 8080

CMD ["-D", "/var/lib/sing-box", "-C", "/etc/sing-box", "run"]
