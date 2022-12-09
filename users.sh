#!/bin/bash
sudo groupaddchefs
sudo install -d -m 0770 -g chef "/home/partageChefs"
sudo mkdir -m 0777 "/home/partageTous"
{
    read
    while IFS=\; read -r firstname lastname password group; do
        lowGroup="${group,,}"
        shareFolder="partage${lowGroup^}"
        if [ "$group" = "MARK" ]; then
            group="marketing"
        elif [ "$group" = "DEV" ]; then
            group="dev"
        else [ "$group" = "WEB"]; then
            group="web"
        fi
        firstname="${firstname,,}"
        lastname="${lastname,,}"
        username="${firstname:0:1}${lastname:0:6}"
        basedir="/home/${group,,}"
        homedir="$basedir/$username"
        if [ $(getent group "$group") ]; then
          sudo useradd -N -G "$group" -m -b "$basedir" -d "$homedir" -m -k "/skel" "$username"
          echo "$username:$password" | sudo chpasswd
          sudo chmod 700 "$homedir"
          sudo ln -s "$basedir/$shareFolder" "$homedir"
          sudo ln -s "/home/partageTous" "$homedir"
        else
          sudo groupadd "$group"
          sudo mkdir "$basedir"
          sudo useradd -N -G CHEFS,"$group" -m -b "$basedir" -d "$homedir" -k "/skel" "$username"
          echo "$username:$password" | sudo chpasswd
          sudo chmod 700 "$homedir"
          sudo mkdir "$basedir/$shareFolder"
          sudo chown "$username":"$group" "$basedir/$shareFolder"
          sudo chmod 770 "$basedir/$shareFolder"
          sudo ln -s "$basedir/$shareFolder" "$homedir"
          sudo ln -s "/home/partageChefs" "$homedir"
          sudo ln -s "/home/partageTous" "$homedir"
        fi
    done 
} < collabos.csv
echo "Script is done"
