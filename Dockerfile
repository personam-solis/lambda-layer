FROM --platform=arm64 continuumio/miniconda3:latest

RUN conda config --add create_default_packages pip && \
    conda config --set always_yes True && \
    conda config --set ssl_verify False
RUN conda create --name std309 python=3.9
RUN conda create --name std308 python=3.8
RUN conda create --name std307 python=3.7
