FROM docker.io/library/debian:stable-slim AS base

ENV FOLDER=/opt/fake-proxmox-subscription

WORKDIR /opt/fake-proxmox-subscription

RUN apt-get update && \
    apt-get install -y --no-install-recommends build-essential debhelper dpkg-dev

COPY . $FOLDER

RUN dpkg-buildpackage -us -uc -b
