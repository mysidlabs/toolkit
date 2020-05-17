FROM fedora

RUN yum install -y ansible bat diffutils emacs git iputils jq less nano python python-pip tree vim && yum clean all && \
    rm -f /root/*.cfg /root/*.log && \
    pip install boto boto3 && \
    curl -o /usr/local/bin/gosu -SL https://github.com/tianon/gosu/releases/download/1.12/gosu-amd64 && \
    chmod +x /usr/local/bin/gosu

COPY files/root /

ENV KUBECONFIG=~/.kube/config.sid

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

CMD ["/bin/bash", "--login"]
