FROM ubuntu:14.04
MAINTAINER Omer Anson <oaanson@gmail.com>

# FIXME: Docker doesn't currently offer a way to
# squash the layers from within a Dockerfile so
# the resulting image is unnecessarily large!

ENV LLVM_VERSION=3.4 \
    DISABLE_ASSERTIONS=0 \
    ENABLE_OPTIMIZED=1 \
    PROJECTS_DIR=/home/apron/projects

RUN apt-get update && \
    apt-get -y --no-install-recommends install \
        clang-${LLVM_VERSION} \
        llvm-${LLVM_VERSION} \
        llvm-${LLVM_VERSION}-dev \
        llvm-${LLVM_VERSION}-runtime \
        llvm \
        libcap-dev \
        git \
        subversion \
        make \
        libboost-program-options-dev \
        libgmp-dev \
        libmpfr-dev \
        libppl-dev ppl-dev \
        python3 \
        python3-dev \
        python3-pip \
        perl \
        flex \
        bison \
        libncurses-dev \
        zlib1g-dev \
        patch \
        wget \
        unzip \
        binutils && \
    pip3 install -U lit tabulate && \
    update-alternatives --install /usr/bin/python python /usr/bin/python3 50 && \
    ( wget -O - http://download.opensuse.org/repositories/home:delcypher:z3/xUbuntu_14.04/Release.key | apt-key add - ) && \
    echo 'deb http://download.opensuse.org/repositories/home:/delcypher:/z3/xUbuntu_14.04/ /' >> /etc/apt/sources.list.d/z3.list && \
    apt-get update

# Create ``apron`` user for container with password ``apron``.
# and give it password-less sudo access
RUN useradd -m apron && \
    echo apron:apron | chpasswd && \
    cp /etc/sudoers /etc/sudoers.bak && \
    echo 'apron  ALL=(root) NOPASSWD: ALL' >> /etc/sudoers
USER apron
WORKDIR /home/apron

# Install APRON
RUN mkdir -p ${PROJECTS_DIR}
RUN cd ${PROJECTS_DIR} && svn export svn://scm.gforge.inria.fr/svnroot/apron/apron/trunk apron
RUN cd ${PROJECTS_DIR}/apron && ./configure
RUN cd ${PROJECTS_DIR}/apron && make
USER root
RUN cd ${PROJECTS_DIR}/apron && make install
RUN cd ${PROJECTS_DIR}/apron && cp taylor1plus/t1p_*.h /usr/local/include/
USER apron

# Install llvm_apron_pass
RUN mkdir -p ${PROJECTS_DIR}/llvm_apron_pass
ADD / ${PROJECTS_DIR}/llvm_apron_pass
RUN sudo chown --recursive apron: ${PROJECTS_DIR}/llvm_apron_pass
RUN cd ${PROJECTS_DIR}/llvm_apron_pass/ApronPass && make
