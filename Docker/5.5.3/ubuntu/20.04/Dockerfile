FROM swift:5.5.3-focal

# Install Open SSL -- dependency of CRT
RUN apt-get -q update && \
  apt-get -q install -y libssl-dev

## The rest of this file is from https://github.com/aws/aws-codebuild-docker-images/blob/master/ubuntu/standard/5.0/Dockerfile

# Install other utilities
RUN apt-get install -y -qq --no-install-recommends \
  curl unzip wget

## Install Java

#****************      JAVA     ****************************************************
ENV JAVA_11_HOME="/usr/lib/jvm/java-11-amazon-corretto"
ENV JDK_11_HOME="/usr/lib/jvm/java-11-amazon-corretto"
ENV JRE_11_HOME="/usr/lib/jvm/java-11-amazon-corretto"
ENV JAVA_8_HOME="/usr/lib/jvm/java-1.8.0-amazon-corretto"
ENV JDK_8_HOME="/usr/lib/jvm/java-1.8.0-amazon-corretto"
ENV JRE_8_HOME="/usr/lib/jvm/java-1.8.0-amazon-corretto/jre"
ARG ANT_VERSION=1.10.12
ARG MAVEN_HOME="/opt/maven"
ARG MAVEN_VERSION=3.6.3
ARG INSTALLED_GRADLE_VERSIONS="5.6.4 6.7.1"
ARG GRADLE_VERSION=5.6.4
ARG SBT_VERSION=1.6.2
ARG GRADLE_PATH="$SRC_DIR/gradle"
ARG ANT_DOWNLOAD_SHA512="2287dc5cfc21043c14e5413f9afb1c87c9f266ec2a9ba2d3bf2285446f6e4ccb59b558bf2e5c57911a05dfa293c7d5c7ad60ac9f744ba11406f4e6f9a27b2403"
ARG MAVEN_DOWNLOAD_SHA512="c35a1803a6e70a126e80b2b3ae33eed961f83ed74d18fcd16909b2d44d7dada3203f1ffe726c17ef8dcca2dcaa9fca676987befeadc9b9f759967a8cb77181c0"
ARG GRADLE_DOWNLOADS_SHA256="abc10bcedb58806e8654210f96031db541bcd2d6fc3161e81cb0572d6a15e821 5.6.4\n22449f5231796abd892c98b2a07c9ceebe4688d192cd2d6763f8e3bf8acbedeb 6.7.1"
ARG SBT_DOWNLOAD_SHA256="637637b6c4e6fa04ab62cd364061e32b12480b09001cd23303df62b36fadd440"
ENV LOG4J_UNSAFE_VERSIONS="2.11.1 1.2.8"

ARG MAVEN_CONFIG_HOME="/root/.m2"

ENV JAVA_HOME="$JAVA_11_HOME" \
    JDK_HOME="$JDK_11_HOME" \
    JRE_HOME="$JRE_11_HOME"

ENV PATH="${PATH}:/opt/tools"

RUN set -ex \
    && apt-get update \
    && apt-get install -y -qq software-properties-common apt-utils \
    # Install Corretto 8
    && wget -qO- https://apt.corretto.aws/corretto.key | apt-key add - \
    && add-apt-repository 'deb https://apt.corretto.aws stable main' \
    && apt-get update \
    && apt-get install -y -qq java-1.8.0-amazon-corretto-jdk \
    && apt-get install -y -qq --no-install-recommends ca-certificates-java \
    # Ensure Java cacerts symlink points to valid location
    && update-ca-certificates -f \
    && dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install -y -qq --force-yes libc6-i386 \
       lib32stdc++6 lib32gcc1 lib32ncurses6 \
       lib32z1 libqt5widgets5 

RUN set -ex \
    # Install Corretto 11
    # Note: We will use update-alternatives to make sure JDK11 has higher priority for all the tools
    && apt-get install -y -qq java-11-amazon-corretto-jdk \
    && for tool_path in $JAVA_HOME/bin/*; do \
          tool=`basename $tool_path`; \
          update-alternatives --install /usr/bin/$tool $tool $tool_path 10000; \
          update-alternatives --set $tool $tool_path; \
        done \
     && rm $JAVA_HOME/lib/security/cacerts && ln -s /etc/ssl/certs/java/cacerts $JAVA_HOME/lib/security/cacerts \
    # Install Ant
    && curl -LSso /var/tmp/apache-ant-$ANT_VERSION-bin.tar.gz https://archive.apache.org/dist/ant/binaries/apache-ant-$ANT_VERSION-bin.tar.gz  \
    && echo "$ANT_DOWNLOAD_SHA512 /var/tmp/apache-ant-$ANT_VERSION-bin.tar.gz" | sha512sum -c - \
    && tar -xzf /var/tmp/apache-ant-$ANT_VERSION-bin.tar.gz -C /opt \
    && rm /var/tmp/apache-ant-$ANT_VERSION-bin.tar.gz \
    && update-alternatives --install /usr/bin/ant ant /opt/apache-ant-$ANT_VERSION/bin/ant 10000 

RUN set -ex \
    # Install Maven
    && mkdir -p $MAVEN_HOME \
    && curl -LSso /var/tmp/apache-maven-$MAVEN_VERSION-bin.tar.gz https://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz \
    && echo "$MAVEN_DOWNLOAD_SHA512 /var/tmp/apache-maven-$MAVEN_VERSION-bin.tar.gz" | sha512sum -c - \
    && tar xzf /var/tmp/apache-maven-$MAVEN_VERSION-bin.tar.gz -C $MAVEN_HOME --strip-components=1 \
    && rm /var/tmp/apache-maven-$MAVEN_VERSION-bin.tar.gz \
    && update-alternatives --install /usr/bin/mvn mvn /opt/maven/bin/mvn 10000 \
    && mkdir -p $MAVEN_CONFIG_HOME \
    # Install Gradle
    && mkdir -p $GRADLE_PATH \
    && for version in $INSTALLED_GRADLE_VERSIONS; do { \
       wget -q "https://services.gradle.org/distributions/gradle-$version-all.zip" -O "$GRADLE_PATH/gradle-$version-all.zip" \
       && unzip -q "$GRADLE_PATH/gradle-$version-all.zip" -d /usr/local \
       && echo "$GRADLE_DOWNLOADS_SHA256" | grep "$version" | sed "s|$version|$GRADLE_PATH/gradle-$version-all.zip|" | sha256sum -c - \
       && rm "$GRADLE_PATH/gradle-$version-all.zip" \
       && mkdir "/tmp/gradle-$version" \
       && "/usr/local/gradle-$version/bin/gradle" -p "/tmp/gradle-$version" wrapper \
       # Android Studio uses the "-all" distribution for it's wrapper script.
       && perl -pi -e "s/gradle-$version-bin.zip/gradle-$version-all.zip/" "/tmp/gradle-$version/gradle/wrapper/gradle-wrapper.properties" \
       && "/tmp/gradle-$version/gradlew" -p "/tmp/gradle-$version" init \
       && rm -rf "/tmp/gradle-$version" \
       && if [ "$version" != "$GRADLE_VERSION" ]; then rm -rf "/usr/local/gradle-$version"; fi; \
     }; done \
    # Install default GRADLE_VERSION to path
    && ln -s /usr/local/gradle-$GRADLE_VERSION/bin/gradle /usr/bin/gradle \
    && rm -rf $GRADLE_PATH \
    # Install SBT
    && curl -fSL "https://github.com/sbt/sbt/releases/download/v${SBT_VERSION}/sbt-${SBT_VERSION}.tgz" -o sbt.tgz \
    && echo "${SBT_DOWNLOAD_SHA256} *sbt.tgz" | sha256sum -c - \
    && tar xzf sbt.tgz -C /usr/local/bin/ \
    && rm sbt.tgz \
    && for version in $LOG4J_UNSAFE_VERSIONS; do find / -name log4j*-$version.jar | xargs rm -f; done

ENV PATH "/usr/local/bin/sbt/bin:$PATH"
RUN sbt version -Dsbt.rootdir=true
# Cleanup
RUN rm -fr /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && apt-get clean
#****************     END JAVA     ****************************************************