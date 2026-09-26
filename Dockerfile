FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    gcc \
    g++ \
    gdb \
    make \
    vim \
    nano \
    python3 \
    bash \
    coreutils \
    file \
    time \
    less \
    ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /bin/bash noi

RUN mkdir -p /home/noi/contest && \
    chown -R noi:noi /home/noi

RUN echo 'export PS1="noi@noi-linux:\w\$ "' >> /home/noi/.bashrc

RUN echo 'echo "========================================"' >> /home/noi/.bashrc && \
    echo 'echo "       NOI Linux Web Environment"' >> /home/noi/.bashrc && \
    echo 'echo "       Ubuntu 20.04 / GCC 9.3"' >> /home/noi/.bashrc && \
    echo 'echo "========================================"' >> /home/noi/.bashrc

WORKDIR /home/noi

USER noi

ENV HOME=/home/noi
ENV USER=noi
ENV SHELL=/bin/bash
ENV TERM=xterm-256color
ENV LANG=C.UTF-8

CMD ["/bin/bash"]
