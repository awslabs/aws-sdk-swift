FROM swift:5.4.2-amazonlinux2 as builder
ARG TARGET_NAME
# TODO: Remove the following 2 lines when repos are public
ARG GIT_ACCESS_TOKEN
RUN git config --global url."https://${GIT_ACCESS_TOKEN}@github.com".insteadOf "https://github.com"
RUN yum -y install git jq tar zip openssl-devel
WORKDIR /build-lambda
COPY . ./
RUN swift package clean
RUN swift build

