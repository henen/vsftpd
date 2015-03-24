FROM ubuntu:14.04

MAINTAINER Henen <yss1530@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# Fix sh
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Install dependencies
RUN apt-get update && \
    apt-get install -yq vsftpd && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

#setting
RUN echo "local_enable=YES" >> /etc/vsftpd.conf
RUN echo "write_enable=YES" >> /etc/vsftpd.conf
RUN echo "local_umask=022" >> /etc/vsftpd.conf
RUN sed -i "s/anonymous_enable=YES/anonymous_enable=NO/" /etc/vsftpd.conf


VOLUME ["/root", "/app"]
ADD run.sh /run.sh

EXPOSE 21
CMD ["/run.sh"]

