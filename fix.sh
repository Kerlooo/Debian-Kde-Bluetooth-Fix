#!/bin/bash

echo "Starting Bluetooth reinstallation procedure on Debian KDE..."

echo "Removing existing Bluetooth packages..."
sudo apt remove --purge -y bluez blueman bluedevil

echo "Cleaning up unused dependencies..."
sudo apt autoremove -y

echo "Reinstalling Bluez and Bluedevil..."
sudo apt install -y bluez bluedevil

echo "Restarting Bluetooth service..."
sudo systemctl restart bluetooth

echo "Bluetooth service status:"
systemctl status bluetooth | grep "Active:"

echo "Reloading Bluetooth module..."
sudo modprobe -r btusb
sudo modprobe btusb

echo "Checking Bluetooth devices:"
lsusb | grep -i bluetooth
dmesg | grep -i bluetooth | tail -n 10

echo "Procedure completed!"

read -p "Do you want to reboot the system? (y/n): " choice
if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
    echo "Rebooting now..."
    sudo reboot
else
    echo "Reboot skipped. You may need to restart manually for changes to take effect."
fi
