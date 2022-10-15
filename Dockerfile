FROM ubuntu:latest

WORKDIR /tmp

# Always use bash as the entrypoint since the program requires interaction
ENTRYPOINT [ "/usr/bin/bash" ]

# set conda environment variables
ENV CONDA_DIR /opt/conda
ENV PATH=$CONDA_DIR/bin:$PATH

# Delete unneeded directories and files to reduce container size
RUN rm -Rf /var/log/apt && \
    rm -f /var/log/dpkg/log && \
    rm -f /var/log/bootstrap.log && \
    rm -f /var/log/lastlog && \
    rm -f /var/log/faillog

# Set unneeded files to /dev/null to prevent the container from growing
RUN ln -sf /dev/null /var/log/bootstrap.log && \
    ln -sf /dev/null /var/log/dpkg.log && \
    ln -sf /dev/null /var/log/lastlog && \
    ln -sf /dev/null /var/log/faillog

# Update the Ubuntu container to enable the repositories
RUN apt-get update && \
    apt-get install -y wget && \
    apt-get clean && \
    rm -Rf /etc/apt/sources.list && \
    rm -Rf /var/cache/apt && \
    rm -Rf /var/log/apt

# Download the miniconda package for Arm or Intel then run
RUN  wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-`uname -m`.sh -O ./miniconda.sh
RUN /bin/bash ./miniconda.sh -b -p /opt/conda

# Create the layer directories
RUN mkdir -p /tmp/layer/python/lib/python3.9/site-packages && \
    mkdir -p /tmp/layer/python/lib/python3.8/site-packages

# Initialize conda
RUN conda init bash

# Configure conda with basic packages and to prevent other issues
RUN conda config --add create_default_packages pip && \
    conda config --set always_yes True && \
    conda config --set ssl_verify False

# Create the conda environments
RUN conda create --name std308 python=3.8
RUN conda create --name std309 python=3.9

# Copy the program to the container
COPY lambda-layer /tmp/lambda-layer

# container build: docker build . --rm -t personamsolis/layermaker:latest
