FROM alpine

RUN apk --update add openssh && \
    rm -rf /var/cache/apk/*

RUN adduser -D -u 1001 docker
RUN passwd -u docker

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
COPY sshd_config /etc/ssh/sshd_config

CMD ["/usr/local/bin/entrypoint.sh"]
