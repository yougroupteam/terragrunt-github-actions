FROM amazon/aws-cli:2.17.54
# Install required packages
RUN yum install -y \
      git \
      jq \
      openssh-clients \
      unzip \
      which \
      shadow-utils \
    && yum clean all
# RUN ["/bin/sh", "-c", "apk add --update --no-cache bash ca-certificates curl git jq openssh"]

# Final check – this will fail the build if aws is broken
RUN aws --version
# Required by GitHub Actions
WORKDIR /github/workspace

COPY ["src", "/src/"]

ENTRYPOINT ["/src/main.sh"]
