#!/bin/bash
echo '##########################################'
echo 'Update syu'
echo '##########################################'
sudo pacman -Syu --noconfirm
echo '##s########################################'
echo 'Install base-devel'
echo '##########################################'
sudo pacman -S --noconfirm base-devel
if [ -d "visual-studio-code-bin" ]; then
	rm -Rf visual-studio-code-bin
fi
echo '##########################################'
echo 'Clone VSC'
echo '##########################################'
git clone http://AUR.archlinux.org/visual-studio-code-bin.git
cd visual-studio-code-bin/
echo '##########################################'
echo 'Make VSC'
echo '##########################################'
echo 'O' | makepkg -s
echo '##########################################'
echo 'Install VSC'
echo '##########################################'
sudo pacman -U  --noconfirm visual-studio-code-bin-*-aarch64.pkg.tar.zst
echo '##########################################'
echo 'Install VS Code extensions'
echo '##########################################'
code --install-extension ms-vscode.cpptools-extension-pack
code --install-extension formulahendry.code-runner
code --install-extention formulahendry.auto-close-tag
code --install-extension ms-vscode.live-server
echo '##########################################'
echo 'Install Chromium, chrome is not aviabloe'
echo '##########################################'
sudo pacman -S chromium --noconfirm
echo '##########################################'
echo 'Install Libre Office'
echo '##########################################'
sudo pacman -S libreoffice-fresh --noconfirm
