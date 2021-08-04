FROM d.ctdn.net/debian:buster-slim
LABEL maintainer="sombochea@cubetiqs.com"

ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'
ENV TIMEZ=Asia/Phnom_Penh

RUN mkdir -p /src/cubetiq/build
COPY lic.txt version.txt /src/cubetiq/build/

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata curl ca-certificates fontconfig locales \
    && echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
    && locale-gen en_US.UTF-8 \
    && rm -rf /var/lib/apt/lists/*

ENV JAVA_VERSION jdk-16.0.1+9

RUN set -eux; \
    ARCH="$(dpkg --print-architecture)"; \
    case "${ARCH}" in \
       aarch64|arm64) \
         ESUM='4e47f1cbf46190727be74cd73445ec2b693f5ba4a74542c554d6b3285811cab5'; \
         BINARY_URL='https://github.com/AdoptOpenJDK/openjdk16-binaries/releases/download/jdk-16.0.1%2B9/OpenJDK16U-jre_aarch64_linux_hotspot_16.0.1_9.tar.gz'; \
         ;; \
       armhf|armv7l) \
         ESUM='c1f88f3ce955cb2e9a4236a916cc6660ef55231d29c4390b1a4398ebbca358b7'; \
         BINARY_URL='https://github.com/AdoptOpenJDK/openjdk16-binaries/releases/download/jdk-16.0.1%2B9/OpenJDK16U-jre_arm_linux_hotspot_16.0.1_9.tar.gz'; \
         ;; \
       ppc64el|ppc64le) \
         ESUM='495805e2e9bcabeac0d8271623b6c92604440608286f4ce411ea48f582854930'; \
         BINARY_URL='https://github.com/AdoptOpenJDK/openjdk16-binaries/releases/download/jdk-16.0.1%2B9/OpenJDK16U-jre_ppc64le_linux_hotspot_16.0.1_9.tar.gz'; \
         ;; \
       s390x) \
         ESUM='780f10923df3230b6013c74482adcc6d8c1fef7b60aefe59a0b337183767d214'; \
         BINARY_URL='https://github.com/AdoptOpenJDK/openjdk16-binaries/releases/download/jdk-16.0.1%2B9/OpenJDK16U-jre_s390x_linux_hotspot_16.0.1_9.tar.gz'; \
         ;; \
       amd64|x86_64) \
         ESUM='5eca19d406c6d130e9c3a4b932b9cb0a6e9cd45932450668c3e911bded4bcf40'; \
         BINARY_URL='https://github.com/AdoptOpenJDK/openjdk16-binaries/releases/download/jdk-16.0.1%2B9/OpenJDK16U-jre_x64_linux_hotspot_16.0.1_9.tar.gz'; \
         ;; \
       *) \
         echo "Unsupported arch: ${ARCH}"; \
         exit 1; \
         ;; \
    esac; \
    curl -LfsSo /tmp/openjdk.tar.gz ${BINARY_URL}; \
    echo "${ESUM} */tmp/openjdk.tar.gz" | sha256sum -c -; \
    mkdir -p /opt/java/openjdk; \
    cd /opt/java/openjdk; \
    tar -xf /tmp/openjdk.tar.gz --strip-components=1; \
    rm -rf /tmp/openjdk.tar.gz;

ENV JAVA_HOME=/opt/java/openjdk \
    PATH="/opt/java/openjdk/bin:$PATH"