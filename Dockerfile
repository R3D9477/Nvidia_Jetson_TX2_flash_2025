FROM ubuntu:18.04

USER root
RUN passwd --delete root

RUN apt-get update && apt-get install -y sudo

RUN groupadd nvidia
RUN mkdir -p /home/nvidia
RUN useradd -rm -d /home/nvidia -s /bin/bash -g root -G sudo -u 1001 nvidia
RUN chown nvidia:nvidia /home/nvidia
RUN echo '%nvidia ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN passwd --delete nvidia

COPY sdkmanager.deb /
COPY flash_tx2_oc.sh /

RUN chmod +x /flash_tx2_oc.sh

RUN apt update
RUN apt upgrade -y
RUN apt install gnupg -y
RUN apt install /sdkmanager.deb --fix-broken -y
RUN apt purge tlp -y

RUN ln -s /opt/nvidia/sdkmanager/sdkmanager-gui /usr/bin/sdkmanager-gui
