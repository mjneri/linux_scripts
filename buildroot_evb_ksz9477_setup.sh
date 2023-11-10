#!/bin/bash
# Setup buildroot env.
# NOTE: Run the script using 'source ./setup.sh'
sudo apt-get install sed make binutils build-essential gcc g++ bash patch gzip bzip2 perl tar cpio unzip rsync file bc git python3 python libncurses5-dev libssl-dev -y

mkdir evb_ksz9477_buildroot && cd evb_ksz9477_buildroot

git clone https://github.com/linux4sam/buildroot-at91
git clone https://github.com/linux4sam/buildroot-external-microchip

cd buildroot-external-microchip && git checkout linux4microchip-2022.10 && cd ..
cd buildroot-at91 && git checkout linux4sam-2022.10 && cd ..

# NOTE: We don't need to use O=$PWD with make because we're not going to build out-of-tree
cd buildroot-at91/
make BR2_EXTERNAL=../buildroot-external-microchip -C $PWD sama5d3_xplained_headless_defconfig menuconfig