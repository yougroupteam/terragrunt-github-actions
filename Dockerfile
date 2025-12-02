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
# Install AWS CLI v2 (official way — the only one that works on Alpine)
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli && \
    rm -rf aws awscliv2.zip
    
COPY ["src", "/src/"]

ENTRYPOINT ["/src/main.sh"]
