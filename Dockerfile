FROM ubuntu:24.04

ARG VERSION

# Enable this during development.
#RUN echo 'Acquire::http { Proxy "http://192.168.59.103:3142"; };' >> /etc/apt/apt.conf.d/01proxy

RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install openjdk-17-jdk wget unzip

# For direct download from willuhn.de:
RUN wget https://www.willuhn.de/products/hibiscus-server/releases/hibiscus-server-${VERSION}.zip 

RUN unzip ./hibiscus-server-${VERSION}.zip 

ADD wrap.sh /wrap
ENTRYPOINT ["/wrap"]

EXPOSE 8080
