FROM ubuntu:18.04

USER root
RUN passwd --delete root

RUN apt update
RUN apt upgrade -y
RUN apt install -y gnupg sudo

# for tx2_oc flasher
RUN apt install -y qemu-user-static wget usbutils python python3 cpio binutils

# for nsight ncu-ui
RUN apt install -y g++ gcc make python2.7 pkg-config libx11-dev libxkbfile-dev libsecret-1-dev

RUN groupadd nvidia
RUN mkdir -p /home/nvidia
RUN useradd -rm -d /home/nvidia -s /bin/bash -g root -G sudo -u 1001 nvidia
RUN chown nvidia:nvidia /home/nvidia
RUN echo '%nvidia ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN passwd --delete nvidia

COPY sdkmanager.deb /
COPY flash_tx2_oc.sh /

RUN chmod +x /flash_tx2_oc.sh

RUN apt install /sdkmanager.deb --fix-broken -y
