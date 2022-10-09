FROM ubuntu:latest

WORKDIR /tmp

ENTRYPOINT [ "/usr/bin/bash" ]

ENV CONDA_DIR /opt/conda
ENV PATH=$CONDA_DIR/bin:$PATH

RUN rm -Rf /var/log/apt && \
    rm -f /var/log/dpkg/log && \
    rm -f /var/log/bootstrap.log && \
    rm -f /var/log/lastlog && \
    rm -f /var/log/faillog

RUN ln -sf /dev/null /var/log/bootstrap.log && \
    ln -sf /dev/null /var/log/dpkg.log && \
    ln -sf /dev/null /var/log/lastlog && \
    ln -sf /dev/null /var/log/faillog

RUN apt-get update && \
    apt-get install -y wget && \
    apt-get clean && \
    rm -Rf /etc/apt/sources.list && \
    rm -Rf /var/cache/apt && \
    rm -Rf /var/log/apt

RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-aarch64.sh -O ./miniconda.sh 
RUN /bin/bash ./miniconda.sh -b -p /opt/conda

RUN conda config --add create_default_packages pip && \
    conda config --set always_yes True && \
    conda config --set ssl_verify False && \
    mkdir -p 3.9/layer/python/lib/python3.9/site-packages && \
    mkdir -p 3.8/layer/python/lib/python3.8/site-packages

RUN conda create --name std308 python=3.8
RUN conda create --name std309 python=3.9

COPY lambda-layer /tmp/lambda-layer
