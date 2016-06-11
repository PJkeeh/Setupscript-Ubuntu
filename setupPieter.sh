#!/bin/bash
sudo apt update
sudo apt install -f -y
sudo apt install git intltool -y

#FIXES
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

#INSTALLATIONS
mkdir ~/tmp
cd ~/tmp

#Install Visual Studio Code
wget https://az764295.vo.msecnd.net/stable/def9e32467ad6e4f48787d38caf190acbfee5880/vscode-amd64.deb
sudo dpkg -i vscode-amd64.deb
echo " "
echo "Open Visual Studio Code and press Ctrl+p"
echo "now type ext install tcl to add TCL support"
read -p "Press ENTER to continue."

#Install Spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update
sudo apt install spotify -y

#Install Vivaldi
sudo apt install libappindicator1 libcurl3
wget https://downloads.vivaldi.com/stable/vivaldi-stable_1.2.490.39-1_amd64.deb
sudo dpkg -i vivaldi-stable_1.2.490.39-1_amd64.deb

#Install Chromium
sudo apt install chromium-browser -y

#Install tmux
sudo apt install tmux -y

sudo apt install slack -y

cd ~
rm ~/tmp -R

#Change .bashrc

echo "#Start tmux" | sudo tee --append ~/.bashrc > /dev/null
echo "if [[ ! \$TERM =~ screen ]]; then" | sudo tee --append ~/.bashrc > /dev/null
echo "    exec tmux" | sudo tee --append ~/.bashrc > /dev/null
echo "fi" | sudo tee --append ~/.bashrc > /dev/null

echo "#Alias" | sudo tee --append ~/.bashrc > /dev/null
echo "alias install=\"sudo apt install\"" | sudo tee --append ~/.bashrc > /dev/null
echo "alias purge=\"sudo apt purge\"" | sudo tee --append ~/.bashrc > /dev/null
echo "alias upgrade=\"sudo apt upgrade && sudo apt dist-upgrade\"" | sudo tee --append ~/.bashrc > /dev/null
echo "alias untar=\"tar -zxvf\"" | sudo tee --append ~/.bashrc > /dev/null

#Remove stuff
sudo purge transmission-* #Remove for work
sudo apt purge gnome-mahjongg gnome-sudoku aisleriot gnome-mines rhythmbox -y

sudo apt-get autoremove -y

#Update system
sudo apt upgrade
sudo apt dist-upgrade

