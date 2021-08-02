FROM swift:5.4-focal
# can remove both lines once repos are public but needed in order to test for now
ARG GIT_ACCESS_TOKEN
RUN git config --global url."https://${GIT_ACCESS_TOKEN}@github.com".insteadOf "https://github.com"

WORKDIR /package

COPY . ./

# to test on al2 swift images uncomment this and comment out other line.
# RUN yum -y install openssl-devel
RUN apt-get update -qq
RUN apt-get -y install libssl-dev

RUN swift package clean

RUN swift build

CMD ["swift", "test", "-Xcc", "-g"]

