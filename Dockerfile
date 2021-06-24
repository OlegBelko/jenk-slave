FROM jenkinsci/slave:alpine
USER root

RUN apk add --update --no-cache docker curl py-pip && \
  pip install 'docker-compose==1.11.2'
COPY jenkins-slave /usr/local/bin/jenkins-slave
COPY preload-docker-images /usr/local/bin/preload-docker-images

VOLUME /var/run/docker.sock

USER jenkins
ENTRYPOINT ["jenkins-slave"]

