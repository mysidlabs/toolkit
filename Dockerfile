FROM mysidlabs/toolkit-base

COPY files/root /

ENV KUBECONFIG=~/.kube/config.sid

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

CMD ["/bin/bash", "--login"]
