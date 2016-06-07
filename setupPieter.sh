#!/bin/bash
sudo apt update
sudo apt install -f -y
sudo apt install git intltool -y

mkdir ~/tmp
cd ~/tmp

#Install Visual Studio Code
wget https://az764295.vo.msecnd.net/stable/def9e32467ad6e4f48787d38caf190acbfee5880/vscode-amd64.deb
sudo dpkg -i vscode-amd64.deb
echo " "
echo "Open Visual Studio Code and press Ctrl+p"
echo "now type ext install tcl to add TCL support"
read -p "Druk op een toets om verder te gaan."

#Disable Mouse Acceleration
echo " "
echo "Disabling Mouse Acceleration"
sudo rm /usr/share/X11/xorg.conf.d/90-mouse.conf
echo Section \"InputClass\" | sudo tee --append /usr/share/X11/xorg.conf.d/90-mouse.conf > /dev/null
echo    Identifier \"mouse\" | sudo tee --append /usr/share/X11/xorg.conf.d/90-mouse.conf > /dev/null
echo    MatchIsPointer \"on\" | sudo tee --append /usr/share/X11/xorg.conf.d/90-mouse.conf > /dev/null
echo    Option \"AccelerationProfile\" \"-1\" | sudo tee --append /usr/share/X11/xorg.conf.d/90-mouse.conf > /dev/null
echo    Option \"AccelerationScheme\" \"none\" | sudo tee --append /usr/share/X11/xorg.conf.d/90-mouse.conf > /dev/null
echo EndSection | sudo tee --append /usr/share/X11/xorg.conf.d/90-mouse.conf > /dev/null

#Spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update
sudo apt install spotify -y

#Remove games
sudo apt purge gnome-mahjongg gnome-sudoku aisleriot gnome-mines rhythmbox -y && sudo apt-get autoremove -y

#Install vivaldi
sudo apt install libappindicator1 libcurl3
wget https://downloads.vivaldi.com/stable/vivaldi-stable_1.2.490.39-1_amd64.deb
sudo dpkg -i vivaldi-stable_1.2.490.39-1_amd64.deb

#Install chromium
sudo apt install chromium-browser

cd ~
rm ~/tmp -R

sudo apt upgrade
sudo apt dist-upgrade
