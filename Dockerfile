FROM imrehg/raspberrypi3-debian-qemu

RUN [ "cross-build-start" ]

RUN    apt-get update \
    && apt-get install build-essential python3 python3-pip python3-dev \
         libatlas-dev \
         libblas-dev \
         liblapack-dev \
         gfortran \
         libatlas-base-dev \
    && pip3 install -U pip

ENV NUMPY_VERSION=1.12.1
RUN pip3 install numpy==${NUMPY_VERSION}
ENV SCIPY_VERSION=0.19.0
RUN pip3 install scipy==${SCIPY_VERSION}

RUN [ "cross-build-end" ]
