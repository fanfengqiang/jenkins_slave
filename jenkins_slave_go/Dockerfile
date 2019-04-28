FROM centos:7

ARG JENKINS_SLAVE_VERSION=3.27
ARG DOCKER_VERSION=18.06.3
ARG GO_VERSION=1.12.4
ARG GO_PATH=/root/go

RUN yum install iproute curl wget java-1.8.0-openjdk git openssh-client openssl procps -y \
    && yum clean all && rm -rf /var/cache/yum \
    && wget https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}-ce.tgz \
    && tar -xf docker-${DOCKER_VERSION}-ce.tgz \
    && mv docker/docker /bin/docker \
    && rm -rf docker \
    && wget https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz \
    && tar -xf go${GO_VERSION}.linux-amd64.tar.gz -C /usr/local \
    && rm -f go${GO_VERSION}.linux-amd64.tar.gz \
    && echo "export PATH=/usr/local/go/bin:\$PATH" > /etc/profile.d/go.sh \
    && echo "export GOPATH=${GO_PATH}" >> /etc/profile.d/go.sh \
    && mkdir -p ${GO_PATH}/src \
    && wget https://raw.githubusercontent.com/jenkinsci/docker-jnlp-slave/${JENKINS_SLAVE_VERSION}-1/jenkins-slave -O /jenkins-slave \
    && chmod +x /jenkins-slave \
    && curl --create-dirs -sSLo /usr/share/jenkins/slave.jar https://repo.jenkins-ci.org/public/org/jenkins-ci/main/remoting/${JENKINS_SLAVE_VERSION}/remoting-${VERSION}.jar

WORKDIR ${GO_PATH}/src

ENTRYPOINT ["/jenkins-slave"]
