FROM alpine:3 
# Install required packages
RUN apk add --no-cache \
      bash \
      ca-certificates \
      curl \
      git \
      jq \
      openssh \
      unzip \
      python3 \
      py3-pip

RUN ["/bin/sh", "-c", "apk add --update --no-cache bash ca-certificates curl git jq openssh"]
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip" \
    && unzip /tmp/awscliv2.zip -d /tmp \
    && /tmp/aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli \
    && rm -rf /tmp/aws /tmp/awscliv2.zip

COPY ["src", "/src/"]

ENTRYPOINT ["/src/main.sh"]
