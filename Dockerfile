FROM debian:7.6
MAINTAINER jia.huang@geneegroup.com

ENV DEBIAN_FRONTEND noninteractive

# Install Basic Packages
RUN apt-get update && apt-get install -y python-pip python-dev

# Install ZeroMQ
RUN curl -sLo /usr/local/lib/libzmq.so.4.0.0 http://d.genee.cn/packages/zeromq-4/libzmq.so.4.0.0 && \
    ldconfig && \
    curl -sLo /usr/local/include/zmq.h http://d.genee.cn/packages/zeromq-4/zmq.h && \
    curl -sLo /usr/local/include/zmq_utils.h http://d.genee.cn/packages/zeromq-4/zmq_utils.h

RUN pip install debade-courier && mkdir -p /etc/debade && mkdir -p /var/run/debade
ADD courier.yml /etc/debade/courier.yml

CMD ["/usr/local/bin/debade-courier", "-c", "/etc/debade/courier.yml"]