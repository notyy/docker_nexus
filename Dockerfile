FROM notyy/docker-ubuntu14-jre7:v1
MAINTAINER notyycn <notyycn@gmail.com>

RUN apt-get install unzip
WORKDIR /usr/local
RUN wget http://www.sonatype.org/downloads/nexus-latest-bundle.zip
RUN unzip nexus-latest-bundle.zip -d nexus
RUN rm nexus-latest-bundle.zip
WORKDIR /usr/local/nexus/nexus-2.9.1-02
RUN useradd nexus
RUN chown -R nexus /usr/local/nexus

EXPOSE 8081
ENTRYPOINT su nexus bin/nexus console
