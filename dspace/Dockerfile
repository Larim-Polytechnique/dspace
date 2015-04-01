FROM debian:wheezy
MAINTAINER Paul-Willy Jean paul-willy.jean@geninov.com

ENV TOMCAT_USER dspace
ENV DEBIAN_FRONTEND noninteractive

RUN useradd -m dspace
RUN apt-get update && apt-get install -y curl
RUN curl -L http://sourceforge.net/projects/dspace/files/DSpace%20Stable/5.1/dspace-5.1-release.tar.gz/download | tar -xzf -
RUN apt-get install -y postgresql
RUN apt-get install -y openjdk-7-jdk
RUN apt-get install -y tomcat7
RUN apt-get install -y maven
RUN apt-get install -y vim && cp /usr/share/vim/vim73/vimrc_example.vim /etc/vim/vimrc
RUN service postgresql start && su postgres -c 'createuser --echo --username=postgres --no-password --no-superuser --no-createdb --no-createrole dspace && createdb --username=postgres --owner=dspace --encoding=UNICODE --template=template0 dspace'

CMD /bin/bash
