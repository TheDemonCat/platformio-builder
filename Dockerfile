FROM ubuntu
MAINTAINER thedemonCat@yandex.ru

RUN set -xe \
    && apt-get update \
    && apt-get install -qq -y --no-install-recommends wget \
        unzip \
        git \
        make \
        srecord \
        bc \
        xz-utils \
        gcc \
        libssl-dev openssl \
        curl \
        python-pip \
        python-dev \
        build-essential

RUN set -xe \
    && mkdir /dist \
    && cd /dist \
    && wget https://www.python.org/ftp/python/3.5.0/Python-3.5.0.tgz \
    && tar xzvf Python-3.5.0.tgz \
    && cd Python-3.5.0 \
    && ./configure \
    && make \
    && make install \
    && cd ../../ \
    && rm -rf /dist

RUN pip install -U pip setuptools 
RUN pip install -U pip platformio

RUN mkdir ./app

RUN groupadd --gid 1000 user 
RUN useradd --uid 1000 --gid user --shell /bin/bash --create-home user

USER user
WORKDIR /app

