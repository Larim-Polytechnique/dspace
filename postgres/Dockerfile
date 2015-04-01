FROM debian:wheezy
MAINTAINER Paul-Willy Jean paul-willy.jean@geninov.com

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get install -y vim \
	&& cp /usr/share/vim/vim73/vimrc_example.vim /etc/vim/vimrc
RUN apt-get install -y postgresql

USER postgresql

RUN service postgresql start && su postgres -c '\
	createuser --echo --username=postgres --no-password --no-superuser --no-createdb --no-createrole dspace \
	&& createdb --username=postgres --owner=dspace --encoding=UNICODE --template=template0 dspace'

CMD /bin/bash
