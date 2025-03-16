#!/bin/bash

echo "Inizio procedura di reinstallazione del Bluetooth su Debian KDE..."

echo "Rimozione pacchetti Bluetooth esistenti..."
sudo apt remove --purge -y bluez blueman bluedevil

echo "Pulizia dipendenze inutilizzate..."
sudo apt autoremove -y

echo "Reinstallazione Bluez e Bluedevil..."
sudo apt install -y bluez bluedevil

echo "Riavvio del servizio Bluetooth..."
sudo systemctl restart bluetooth

echo "Stato del servizio Bluetooth:"
systemctl status bluetooth | grep "Active:"

echo "Ricaricamento del modulo Bluetooth..."
sudo modprobe -r btusb
sudo modprobe btusb

echo "Verifica dispositivi Bluetooth:"
lsusb | grep -i bluetooth
dmesg | grep -i bluetooth | tail -n 10

echo "Procedura completata! Riavvio del sistema..."
sudo reboot
