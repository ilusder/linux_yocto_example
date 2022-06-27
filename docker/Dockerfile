## Autor: ilusder

FROM ubuntu

### Stage 1 - add/remove packages ###
ENV TZ=Asia/Jerusalem
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && apt-get install -y gawk wget git-core diffstat unzip texinfo \
                                             gcc-multilib build-essential chrpath socat cpio \
					     software-properties-common \
                                             python3 python3-pip python3-pexpect \
                                             xz-utils debianutils iputils-ping python3-git \
                                             python3-jinja2 libegl1-mesa libsdl1.2-dev xterm \
                                             locales python3-distutils libssl-dev gdisk sudo \
                                             libgmp-dev libmpc-dev pylint nano
RUN groupadd -g 1000 dev \
	&& useradd -u 1000 -g dev -d /home/dev dev \
	&& mkdir /home/dev \
	&& chown -R dev:dev /home/dev

RUN usermod -aG sudo dev

# Set the locale
RUN apt-get update && apt-get install -y locales \
 && rm -rf /var/lib/apt/lists/* \
 && locale-gen "en_US.UTF-8"
ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8
    
ADD start.sh /home/dev/start.sh

RUN chmod +x /home/dev/start.sh

USER dev

WORKDIR /home/dev

RUN echo "alias python=python3" >> ~/.bashrc

WORKDIR /home/dev
# NOTE: intentionally NOT using s6 init as the entrypoint
# This would prevent container debugging if any of those service crash
CMD ["/home/dev/start.sh"]
