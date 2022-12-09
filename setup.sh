#!/bin/bash
echo '##########################################'
echo 'install zip for dependencies'
echo '##########################################'
sudo pacman -S unzip --noconfirm
unzip skel -d skel
sudo chmod +x users.sh
sudo chmod +x installApp.sh
echo '##########################################'
echo 'Creare Users and Groups'
echo '##########################################'
bash users.sh
echo '##########################################'
echo 'Install all apps'
echo '##########################################'
bash installApp.sh
