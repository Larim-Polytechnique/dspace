FROM debian:wheezy
MAINTAINER Paul-Willy Jean paul-willy.jean@geninov.com

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
	&& apt-get install -y \
		postgresql \
		vim

RUN cp /usr/share/vim/vim73/vimrc_example.vim /etc/vim/vimrc

USER postgres

ENV PG_VERSION=9.1

RUN /etc/init.d/postgresql start \
	&& createuser --echo --username=postgres --no-password --no-superuser --no-createdb --no-createrole dspace \
	&& psql postgres -c "ALTER USER postgres WITH PASSWORD 'pgpass';" \
	&& createdb --username=postgres --owner=dspace --encoding=UNICODE --template=template0 dspace

RUN echo "listen_addresses = '*'" >> /etc/postgresql/${PG_VERSION}/main/postgresql.conf
RUN echo "host\t all\t\t postgres\t 0.0.0.0/0\t\t md5" >> /etc/postgresql/${PG_VERSION}/main/pg_hba.conf

EXPOSE 5432

VOLUME ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

CMD /usr/lib/postgresql/${PG_VERSION}/bin/postgres -D /var/lib/postgresql/${PG_VERSION}/main -c config_file=/etc/postgresql/${PG_VERSION}/main/postgresql.conf
# CMD ["/usr/lib/postgresql/${PG_VERSION}/bin/postgres", "-D", "/var/lib/postgresql/${PG_VERSION}/main", "-c", "config_file=/etc/postgresql/${PG_VERSION}/main/postgresql.conf"]
