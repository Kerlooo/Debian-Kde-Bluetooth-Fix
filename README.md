# Fix Bluetooth su Debian KDE  

Questo script Bash reinstalla e configura il Bluetooth su Debian KDE, rimuovendo pacchetti inutili e assicurandosi che Bluedevil sia il gestore predefinito.  

## Funzionalità  
- Rimuove Bluez, Blueman e Bluedevil (se presenti)  
- Elimina pacchetti non necessari  
- Reinstalla Bluez e Bluedevil (senza Blueman)  
- Riavvia e verifica lo stato del servizio Bluetooth  
- Ricarica il modulo del kernel per il Bluetooth  
- Controlla se il dispositivo è riconosciuto 
- Installa (su richiesta) il comando  
- Riavvia il sistema per applicare le modifiche  

## Installazione  
Clona questo repository sul tuo PC:  
```bash
git clone https://github.com/Kerlooo/Debian-Kde-Bluetooth-Fix.git
cd Debian-Kde-Bluetooth-Fix
chmod +x fix.sh
./fix.sh
```

## Requisiti
- Privilegi sudo
- Debian con ambiente KDE Plasma
