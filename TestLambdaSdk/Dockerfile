FROM swift:5.4.2-amazonlinux2 as builder
ARG TARGET_NAME
ARG GIT_ACCESS_TOKEN
RUN git config --global url."https://${GIT_ACCESS_TOKEN}@github.com".insteadOf "https://github.com"
RUN yum -y install git jq tar zip openssl-devel
WORKDIR /build-lambda
COPY . ./
WORKDIR ~/Codegen
COPY /Codegen ./

RUN cd /build-lambda && swift package clean && swift build
