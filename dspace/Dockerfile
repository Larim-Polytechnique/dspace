FROM debian:wheezy
MAINTAINER Paul-Willy Jean paul-willy.jean@geninov.com

ENV TOMCAT_USER dspace
ENV DEBIAN_FRONTEND noninteractive

RUN useradd -m dspace
RUN apt-get update && apt-get install -y \
    curl \
    maven \
    openjdk-7-jdk \
    tomcat7 \
    vim
RUN cp /usr/share/vim/vim73/vimrc_example.vim /etc/vim/vimrc
RUN curl -L http://sourceforge.net/projects/dspace/files/DSpace%20Stable/5.1/dspace-5.1-release.tar.gz/download | tar -xzf -
COPY build.properties dspace-5.1-release/
COPY web.xml /etc/tomcat7/

RUN mkdir /dspace \
    && chown dspace /dspace \
    && chown -R dspace dspace-5.1-release

USER dspace
WORKDIR dspace-5.1-release
RUN mvn -X -e package
WORKDIR dspace/target/dspace-installer
RUN ant fresh_install

CMD /bin/bash
