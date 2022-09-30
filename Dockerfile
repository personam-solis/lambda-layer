FROM continuumio/miniconda3:latest

WORKDIR /tmp/

RUN conda config --add create_default_packages pip && \
    conda config --set always_yes True && \
    conda config --set ssl_verify False && \
    mkdir -p 3.9/layer/python/lib/python3.9/site-packages && \
    mkdir -p 3.8/layer/python/lib/python3.8/site-packages
RUN conda create --name std309 python=3.9
RUN conda create --name std308 python=3.8
