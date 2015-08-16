FROM alpine:3.2

RUN apk update && \
    apk add py-pip gcc python-dev libzmq musl-dev g++ && \
    rm -rf /var/cache/apk/*

RUN pip install debade-courier && mkdir -p /etc/debade && mkdir -p /var/run/debade
ADD courier.yml /etc/debade/courier.yml

EXPOSE 3333

CMD ["/usr/bin/debade-courier", "-c", "/etc/debade/courier.yml", "tcp://0.0.0.0:3333"]
