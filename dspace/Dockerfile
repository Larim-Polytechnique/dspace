FROM tomcat:8.0
MAINTAINER Paul-Willy Jean <paul-willy.jean@geninov.com>

ENV TOMCAT_USER dspace
ENV DS_VERSION=5.1

RUN useradd -m dspace
RUN apt-get update && apt-get install -y \
        git \
        maven \
        openjdk-7-jdk \
        vim
RUN cp /usr/share/vim/vim74/vimrc_example.vim /etc/vim/vimrc
RUN curl -SsL https://github.com/DSpace/DSpace/archive/dspace-$DS_VERSION.tar.gz | tar -C /usr/src/ -xzf -

RUN mkdir /dspace \
    && chown dspace /dspace \
    && chown -R dspace /usr/src/DSpace-dspace-$DS_VERSION

USER dspace
WORKDIR /usr/src/DSpace-dspace-$DS_VERSION
RUN sed -i "s/path=\"Mirage\/\"/path=\"Mirage2\/\"/" dspace/config/xmlui.xconf
RUN mvn package -Dmirage2.on=true
WORKDIR dspace/target/dspace-installer

RUN sed -i "s/<java classname=\"org.dspace.storage.rdbms.DatabaseUtils\" classpathref=\"class.path\" fork=\"yes\" failonerror=\"yes\">/<java classname=\"org.dspace.storage.rdbms.DatabaseUtils\" classpathref=\"class.path\" fork=\"yes\" failonerror=\"no\">/" build.xml
RUN ant fresh_install

USER root
WORKDIR /dspace
RUN rm -r /usr/src/*
RUN apt-get purge -y --auto-remove \
        git \
        maven \
        openjdk-7-jdk \
    && rm -rf /var/lib/apt/lists/*
COPY entrypoint.sh /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
CMD ["run"]
