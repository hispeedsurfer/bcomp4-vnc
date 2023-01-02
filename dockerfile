#
# Beyond Compare 4 Dockerfile
#
#

# Pull base image.
FROM jlesage/baseimage-gui:debian-11-v4.2.2

# Docker image version is provided via build arg.
ARG DOCKER_IMAGE_VERSION=

# Define software versions.
ARG BCOMP_VERSION=4.4.4

# Define working directory.
WORKDIR /tmp

# Install dependencies.
RUN \
    apt-get update && \
    apt-get install -y wget && \
    apt-get install -y poppler-utils && \
    apt-get install -y libglib2.0-0 && \
    apt-get install -y fonts-inconsolata && \
    apt-get install -y apt-utils

# Install Beyond Compare 4.
ENV BCOMPARE_URL https://www.scootersoftware.com/bcompare-4.4.4.27058_amd64.deb
RUN wget "${BCOMPARE_URL}" -O bcompare.deb && \
	dpkg -i bcompare.deb && \
  	apt-get purge -y --auto-remove wget && \
  	rm bcompare.deb && \
    apt-get install -y -f && \
    rm -rf /var/lib/apt/lists/*
# Enable below if we want to supply our license file
COPY foo BC4Key.* /usr/lib/beyondcompare/


# Generate and install favicons.
RUN \
    APP_ICON_URL=https://www.scootersoftware.com/images/media_BeyondCompareIcon512x512.png && \
    install_app_icon.sh "$APP_ICON_URL"

# Add files.
COPY startapp.sh /startapp.sh

# Set internal environment variables.
RUN \
    set-cont-env APP_NAME "Beyond Compare 4" && \
    set-cont-env APP_VERSION "$BCOMP_VERSION" && \
    set-cont-env DOCKER_IMAGE_VERSION "$DOCKER_IMAGE_VERSION" && \
    #set-cont-env TRASH_DIR "/trash" && \
    true

# Define mountable directories.
VOLUME ["/storage"]
#VOLUME ["/trash"]

# Metadata.
LABEL \
    org.label-schema.name="Beyond Compare 4" \
    org.label-schema.description="Docker container for Beyond Compare 4" \
    org.label-schema.version="${DOCKER_IMAGE_VERSION:-unknown}" \
    org.label-schema.vcs-url="https://github.com/hispeedsurfer/bcomp4-vnc" \
    org.label-schema.schema-version="1.0"
