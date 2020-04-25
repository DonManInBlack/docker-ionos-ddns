FROM alpine:latest

ENV FREQUENCY="*/5 * * * *"
ENV TZ="Europe/Berlin"

RUN apk update
RUN apk --no-cache add python3-dev py-pip build-base libffi-dev openssl-dev bash tzdata

RUN pip3 install domain-connect-dyndns

RUN mkdir /config

COPY root/entrypoint /usr/local/sbin/entrypoint
RUN chmod +x /usr/local/sbin/entrypoint

ENTRYPOINT [ "/usr/local/sbin/entrypoint" ]

VOLUME /config
