#!/bin/bash
echo '##########################################'
echo 'install zip for dependencies'
echo '##########################################'
sudo pacman -S unzip --noconfirm
unzip skel -d skel
echo '##########################################'
echo 'Creare Users and Groups'
echo '##########################################'
./users.sh
echo '##########################################'
echo 'Install all apps'
echo '##########################################'
./installApp.sh
