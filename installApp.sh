#!/bin/bash
if [ -d "visual-studio-code-bin" ]; then
	rm -Rf visual-studio-code-bin
fi
echo '##########################################'
echo 'Installing VS Code'
echo '##########################################'
git clone https://AUR.archlinux.org/visual-studio-code-bin.git
cd visual-studio-code-bin/
echo 'O' | makepkg -s
sudo pacman -U --noconfirm visual-studio-code-bin-*-aarch64.pkg.tar.zst
cd ..
echo '##########################################'
echo 'Installing Chromium, chrome is not available'
echo '##########################################'
sudo pacman -S chromium --noconfirm
echo '##########################################'
echo 'Installing Libre Office'
echo '##########################################'
sudo pacman -S libreoffice-fresh --noconfirm
echo '##########################################'
echo 'Installing CommanderPi'
echo '##########################################'
cd ~
git clone https://github.com/EarthKiii/CommanderPiForArch.git
mv CommanderPiForArch CommanderPi
cd CommanderPi
sudo chmod u+x install.sh
bash install.sh
xrdb -load /dev/null
xrdb -query
echo '##########################################'
echo 'Installing VS Code extensions'
echo '##########################################'
code --install-extension ms-vscode.cpptools-extension-pack
code --install-extension formulahendry.code-runner
code --install-extention formulahendry.auto-close-tag
code --install-extension ms-vscode.live-server
