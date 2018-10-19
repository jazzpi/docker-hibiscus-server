FROM ubuntu:latest

# Enable this during development.
#RUN echo 'Acquire::http { Proxy "http://192.168.59.103:3142"; };' >> /etc/apt/apt.conf.d/01proxy

RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install default-jre wget unzip

RUN wget https://www.willuhn.de/products/hibiscus-server/releases/hibiscus-server-2.6.20.zip
RUN unzip hibiscus-server-2.6.20.zip -d / && rm hibiscus-server-2.6.20.zip

ADD wrap.sh /wrap
ENTRYPOINT ["/wrap"]

EXPOSE 8080
