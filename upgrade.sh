#!/bin/bash

echo Starting Ubuntu 21.10 Forced Update

cd /tmp

sudo mkdir impish 

cd impish

IMPISH=impish-base-amd64.tar.gz

clear

echo Downloading necessary files

sudo apt update

sudo apt install wget git curl apt-utils -y

sudo wget https://cdimage.ubuntu.com/ubuntu-base/daily/pending/impish-base-amd64.tar.gz

sudo tar -xzf $IMPISH

cd etc/apt

sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak

sudo rm -rf /etc/apt/sources.list

sudo cp sources.list /etc/apt/

sudo cp trusted.gpg.d/* /etc/apt/trusted.gpg.d/

cd ..

sudo rm -rf /etc/os-release

sudo cp os-release /etc/

sudo apt update

sudo apt update

sudo apt upgrade -y

sudo rm -rf /var/lib/dpkg/info/postfix.postinst

sudo apt upgrade -y

sudo apt update

echo Removing files for some space

sudo rm /tmp/$IMPISH

sudo update-manager -d

echo Finished. Rebooting the system.

sudo reboot -f
