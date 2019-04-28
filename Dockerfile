FROM centos:7

ARG JENKINS_SLAVE_VERSION=3.27
ARG DOCKER_VERSION=18.06.3


RUN yum install curl wget java-1.8.0-openjdk git openssh-client openssl procps -y \
    && yum clean all && rm -rf /var/cache/yum \
    && wget https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}-ce.tgz \
    && tar -xf docker-${DOCKER_VERSION}-ce.tgz \
    && mv docker/docker /bin/docker \
    && rm -rf docker \
    && wget https://raw.githubusercontent.com/jenkinsci/docker-jnlp-slave/${JENKINS_SLAVE_VERSION}-1/jenkins-slave -O /jenkins-slave \
    && chmod +x  /jenkins-slave \
    && curl --create-dirs -sSLo /usr/share/jenkins/slave.jar https://repo.jenkins-ci.org/public/org/jenkins-ci/main/remoting/${JENKINS_SLAVE_VERSION}/remoting-${VERSION}.jar


ENTRYPOINT ["/jenkins-slave"]
