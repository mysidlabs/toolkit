FROM mysidlabs/toolkit-base

LABEL maintainer="Steve Taranto <steve.taranto@siriuscom.com>"

COPY files/root /

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh && \
    pip install pan-python pandevice lxml requests requests_toolbelt

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

CMD ["/bin/bash", "--login"]
