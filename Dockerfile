FROM bestwu/wine:i386
MAINTAINER Peter Wu <piterwu@outlook.com>

RUN apt-get update && \
    apt-get install -y deepin.com.thunderspeed && \
    apt-get -y autoremove && apt-get clean -y && apt-get autoclean -y && \
    rm -rf var/lib/apt/lists/* var/cache/apt/* var/log/*

VOLUME ["/迅雷下载"]

ENV USER=root

ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]