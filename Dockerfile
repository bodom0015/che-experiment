FROM docker:dind
 
RUN apk --update add bash openjdk8-jre && \
    wget https://install.codenvycorp.com/che/eclipse-che-4.5.1.tar.gz && \
    tar xvfz eclipse-che-4.5.1.tar.gz && \
    rm eclipse-che-4.5.1.tar.gz && \
    ln -s /usr/local/bin/docker /usr/bin/docker && \
    addgroup docker && \
    addgroup root docker
 
ENV JAVA_HOME /usr/lib/jvm/default-jvm/jre/
 
COPY dockerd-entrypoint.sh /usr/local/bin/
 
VOLUME /var/lib/docker
EXPOSE 8080
 
ENTRYPOINT ["dockerd-entrypoint.sh"]
