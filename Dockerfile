FROM fedora

RUN yum install -y ansible bat diffutils emacs git iputils jq less nano python python-pip tree vim && yum clean all && \
    rm -f /root/*.cfg /root/*.log
RUN pip install boto boto3

COPY files/root /

RUN groupadd --gid 4568 sidgroup && \
    useradd -ms /bin/bash --uid 4567 --groups 4568 sid && \
    chown -R sid:sid /home/sid
COPY --chown=sid:sid files/home /home

USER sid
WORKDIR /home/sid

ENV KUBECONFIG=~/.kube/config.sid

