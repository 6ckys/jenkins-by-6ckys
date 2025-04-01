FROM jenkins/jenkins:lts-alpine
USER root

# Install prerequisites
RUN apk add --no-cache \
    git \
    openssh-client \
    curl \
    bash \
    libc6-compat

# Install Docker CLI (static binary)
RUN mkdir -p /tmp/download && \
    curl -fsSL https://download.docker.com/linux/static/stable/$(uname -m | sed 's/aarch64/arm64/;s/x86_64/x86_64/')/docker-28.0.4.tgz | tar -xz -C /tmp/download && \
    mv /tmp/download/docker/docker /usr/bin/ && \
    rm -rf /tmp/download

# Install Docker Compose v2
RUN mkdir -p /usr/local/lib/docker/cli-plugins && \
    curl -fsSL https://github.com/docker/compose/releases/download/v2.34.0/docker-compose-linux-$(uname -m | sed 's/aarch64/arm64/;s/x86_64/x86_64/') -o /usr/local/lib/docker/cli-plugins/docker-compose && \
    chmod +x /usr/local/lib/docker/cli-plugins/docker-compose && \
    ln -s /usr/local/lib/docker/cli-plugins/docker-compose /usr/bin/docker-compose

# Create docker group and add jenkins user
RUN addgroup -S docker && \
    adduser jenkins docker

# Verify installations
RUN docker --version && docker compose version

# Standard Jenkins setup
RUN mkdir -p /var/scripts
COPY scripts/deploy.sh /var/scripts/
RUN chmod +x /var/scripts/deploy.sh && \
    chown jenkins:jenkins /var/scripts/deploy.sh

USER jenkins