# Use the latest Ubuntu image
FROM ubuntu:latest

# Set environment variables for non-interactive installs
ENV DEBIAN_FRONTEND=noninteractive

# Update and install required packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    gcc \
    g++ \
    make \
    file \
    wget \
    gawk \
    diffstat \
    bzip2 \
    cpio \
    chrpath \
    zstd \
    lz4 \
    python3 \
    vim \
    locales \
    patch \
    curl \
    ca-certificates \
 && rm -rf /var/lib/apt/lists/*

# Set up locales
RUN locale-gen en_US.UTF-8 \
 && update-locale LANG=en_US.UTF-8

ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

# Set user and the working directory inside the container
WORKDIR /project-data
USER ubuntu

