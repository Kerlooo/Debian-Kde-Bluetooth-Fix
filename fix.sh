#!/bin/bash

echo "Avvio della procedura di reinstallazione del Bluetooth su Debian KDE..."

echo "Rimozione dei pacchetti Bluetooth esistenti..."
sudo apt remove --purge -y bluez blueman bluedevil

echo "Pulizia delle dipendenze inutilizzate..."
sudo apt autoremove -y

echo "Reinstallazione di Bluez e Bluedevil..."
sudo apt install -y bluez bluedevil

echo "Riavvio del servizio Bluetooth..."
sudo systemctl restart bluetooth

echo "Stato del servizio Bluetooth:"
systemctl status bluetooth | grep "Active:"

echo "Ricaricamento del modulo Bluetooth..."
sudo modprobe -r btusb
sudo modprobe btusb

echo "Verifica dei dispositivi Bluetooth:"
lsusb | grep -i bluetooth
dmesg | grep -i bluetooth | tail -n 10

echo "Procedura completata!"

read -n1 -p  "Vuoi installarlo come servizio systemd? (s/n): " comando
if [[ "$comando" == "s" || "$comando" == "S" ]]; then
    echo "Creazione del servizio systemd..."
    mv fix.sh /usr/local/bin/fix.sh
    sudo chmod +x /usr/local/bin/fix.sh

    echo "alias fixbluetooth='/usr/local/bin/fix.sh'" >> ~/.bashrc
    source ~/.bashrc
    echo "Servizio systemd creato con successo!"
    echo "Puoi eseguire il comando 'fixbluetooth' in qualsiasi momento per reinstallare il Bluetooth."
fi

read -p "Vuoi riavviare il sistema? (s/n): " scelta
if [[ "$scelta" == "s" || "$scelta" == "S" ]]; then
    echo "Riavvio in corso..."
    sudo reboot
else
    echo "Riavvio annullato. Potrebbe essere necessario riavviare manualmente affinché le modifiche abbiano effetto."
fi