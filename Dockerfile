# To build use:
# docker build -t glc12125/mainserver_env:1.0 .
FROM ubuntu:16.04
MAINTAINER Li <public at robok.ai>

LABEL description="A linux C++ build environment."

RUN apt-get update && apt-get install -y \
  gcc \
  g++ \
  libboost-all-dev \
  build-essential \
  cmake \
  pkg-config \
  autotools-dev \
  libicu-dev \
  libbz2-dev \
  python-dev \
  python-numpy \
  libtbb2 \
  libtbb-dev \
  libjpeg-dev \
  libpng-dev \
  libtiff-dev \
  zip \
  unzip \
  wget

RUN wget -O opencv-3.2.0.zip https://sourceforge.net/projects/opencvlibrary/files/opencv-unix/3.2.0/opencv-3.2.0.zip/download
RUN unzip opencv-3.2.0.zip
RUN cd opencv-3.2.0 && mkdir build && cd build && cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local/ .. && make -j4 && make install


ENV LD_LIBRARY_PATH=/libs
ENV CPLUS_INCLUDE_PATH=/libs/include

RUN mkdir /src
RUN mkdir /build
WORKDIR /build

CMD ["/bin/bash"]