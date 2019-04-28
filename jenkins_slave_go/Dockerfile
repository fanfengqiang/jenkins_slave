FROM centos:7

ARG GO_VERSION=1.12.4

ENV PATH=$PATH:/usr/local/go/bin

RUN yum install -y wget && \
    yum clean all && rm -rf /var/cache/yum && \
    mkdir /root/go && \
    wget https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz && \
    tar -xf go${GO_VERSION}.linux-amd64.tar.gz -C /usr/local && \
    rm -rf go${GO_VERSION}.linux-amd64.tar.gz 

COPY --from=jenkins/jnlp-slave /usr/local/bin/jenkins-slave /usr/local/bin/jenkins-slave

WORKDIR /root/go

ENTRYPOINT ["jenkins-slave"]
