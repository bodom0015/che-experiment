FROM docker:dind

ARG version=4.5.1
 
RUN apk --update add bash openjdk8-jre && \
    wget https://install.codenvycorp.com/che/eclipse-che-${version}.tar.gz && \
    tar xvfz eclipse-che-${version}.tar.gz && \
    rm eclipse-che-${version}.tar.gz && \
    ln -s /usr/local/bin/docker /usr/bin/docker && \
    addgroup docker && \
    addgroup root docker
 
ENV JAVA_HOME /usr/lib/jvm/default-jvm/jre/
 
COPY dockerd-entrypoint.sh /usr/local/bin/
 
VOLUME /var/lib/docker
EXPOSE 8080 8000 32768-65535
 
WORKDIR /eclipse-che-${version}

ENTRYPOINT ["dockerd-entrypoint.sh"]
