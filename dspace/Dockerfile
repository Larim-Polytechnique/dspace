FROM tomcat:8.0
MAINTAINER Paul-Willy Jean <paul-willy.jean@geninov.com>

ENV TOMCAT_USER dspace
ENV DS_MAJOR=5.1

RUN useradd -m dspace
RUN buildDep=" \
        git \
        maven \
        openjdk-7-jdk \
    "; apt-get update && apt-get install -y $buildDep  vim
RUN cp /usr/share/vim/vim74/vimrc_example.vim /etc/vim/vimrc
RUN curl -SsL http://sourceforge.net/projects/dspace/files/DSpace%20Stable/$DS_MAJOR/dspace-$DS_MAJOR-release.tar.gz/download | tar -C /usr/src/ -xzf -

RUN mkdir /dspace \
    && chown dspace /dspace \
    && chown -R dspace /usr/src/dspace-$DS_MAJOR-release

USER dspace
WORKDIR /usr/src/dspace-$DS_MAJOR-release
RUN sed -i "s/path=\"Mirage\/\"/path=\"Mirage2\/\"/" dspace/config/xmlui.xconf
RUN mvn package -Dmirage2.on=true
WORKDIR dspace/target/dspace-installer

RUN sed -i "s/<java classname=\"org.dspace.storage.rdbms.DatabaseUtils\" classpathref=\"class.path\" fork=\"yes\" failonerror=\"yes\">/<java classname=\"org.dspace.storage.rdbms.DatabaseUtils\" classpathref=\"class.path\" fork=\"yes\" failonerror=\"no\">/" build.xml
RUN ant fresh_install

USER root
COPY entrypoint.sh /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
CMD ["run"]
