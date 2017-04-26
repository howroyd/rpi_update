#!/bin/bash
clear

echo "Updating..."

sudo ntpdate -u ntp.ubuntu.com
sudo apt-get update
sudo apt-get -y --force-yes dist-upgrade
sudo dpkg --configure -a
sudo apt-get -y --force-yes autoremove
sudo mv /boot/.firmware_revision ~
sudo PRUNE_MODULES=1 rpi-update -y

echo "Done!"

sudo shutdown -r now

# add the following line to sudo crontab -e
# 00 03 * * * /home/pi/update.sh
