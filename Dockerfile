FROM ubuntu:20.04

# Enable this during development.
#RUN echo 'Acquire::http { Proxy "http://192.168.59.103:3142"; };' >> /etc/apt/apt.conf.d/01proxy

RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install openjdk-8-jdk wget unzip


# For direct download from willuhn.de:
RUN wget https://www.willuhn.de/products/hibiscus-server/releases/hibiscus-server-2.10.20.zip 
# But let's use the copy included in ./vendor/ instead:
# COPY vendor/willuhn/hibiscus-server-2.10.9.zip ./hibiscus-server-2.10.20.zip

RUN unzip ./hibiscus-server-2.10.20.zip 

ADD wrap.sh /wrap
ENTRYPOINT ["/wrap"]

EXPOSE 8080
