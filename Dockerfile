FROM debian:7.6
MAINTAINER jia.huang@geneegroup.com

ENV DEBIAN_FRONTEND noninteractive

# Install Basic Packages
RUN apt-get update && apt-get install -y python-pip

RUN pip install debade-courier && mkdir -p /etc/debade && mkdir -p /var/run/debade
ADD courier.yml /etc/debade/courier.yml

CMD ["/usr/local/bin/debade-courier", "-c", "/etc/debade/courier.yml"]