FROM ubuntu:22.04

# Set environment variables to avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Update and install dependencies in a single RUN to minimize layers
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        git \
        build-essential \
        cmake \
        pkg-config \
        libssl-dev \
        zlib1g-dev \
        libcurl4-openssl-dev \
        libwxgtk3.0-gtk3-dev \
        gettext && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Clone and build myrulib
RUN git clone https://github.com/lintest/myrulib /myrulib && \
    cd /myrulib && \
    ./configure && \
    make install && \
    rm -rf /myrulib  # Remove source files after installation

# Verify the installation
RUN command -v myrulib

CMD ["/usr/local/bin/myrulib"]