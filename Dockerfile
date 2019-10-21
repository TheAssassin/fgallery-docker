FROM nginx:alpine

RUN apk add --no-cache \
    curl \
    imagemagick \
    fbida-exiftran \
    zip \
    lcms2-utils \
    perl-image-exiftool \
    perl-json \
    perl-json-xs \
    jpegoptim \
    pngcrush \
    p7zip

VOLUME /images
WORKDIR /images

COPY error.html /
COPY entrypoint.sh /

CMD sh /entrypoint.sh

ARG BRANCH=master

RUN install -d /fgallery && \
    curl -sL https://gitlab.com/wavexx/fgallery/-/archive/$BRANCH/fgallery.tar.gz | \
        tar -xz -C /fgallery --strip-components=1
