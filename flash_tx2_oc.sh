#!/bin/bash

NVIDIA_FOLDER="$HOME/nvidia"

sudo apt install qemu-user-static wget usbutils python python3 cpio binutils -y

echo ""
echo "   *** NVIDIA Jetson Device ***"
echo "   * `lsusb -d 0955:7c18`"
echo "   ****************************"
echo ""

pushd "$NVIDIA_FOLDER/nvidia_sdk/JetPack_4.6.6_Linux_JETSON_TX2_TARGETS/Linux_for_Tegra"

    wget "https://connecttech.com/ftp/Drivers/CTI-L4T-TX2-32.7.5-V001.tgz"

    tar -xvf "CTI-L4T-TX2-32.7.5-V001.tgz"

    rm -f "CTI-L4T-TX2-32.7.5-V001.tgz"

    pushd "CTI-L4T"

        sudo ./install.sh

    popd

    sudo ./cti-flash.sh

popd
