#!/bin/bash

# xorg display server installation
sudo apt install -y xorg

# Microcode for Intel/AMD 
# sudo apt install -y amd-microcode
sudo apt install -y intel-microcode 

# File Manager (eg. pcmanfm, thunar, ranger)
sudo apt install -y ranger

# Sound packages
sudo apt install -y pulseaudio alsa-utils pavucontrol volumeicon-alsa

# Neofetch/HTOP
sudo apt install -y neofetch htop

# EXA installation
# replace ls command in .bashrc file with line below
# alias ls='exa -al --long --header --color=always --group-directories-first' 
sudo apt install -y exa

# Browser Installation (eg. chromium, firefox-esr)
# sudo apt install -y firefox-esr 

# Desktop background browser/handler 
# feh --bg-fill /path/to/directory 
# example if you want to use in autostart
# sudo apt install -y nitrogen 
sudo apt install -y feh

# Install suckless dwm - dynamic window manager
cd
mkdir Downloads
cd Downloads
git clone  https://github.com/rendiwijiatmoko/dwm.git
cd dwm
sudo make clean install

# Install suckless st - simple terminal
cd
mkdir Downloads
cd Downloads
git clone  https://github.com/rendiwijiatmoko/st.git
cd dwm
sudo make clean install

# Install suckless dmenu - dynamic manu
cd
mkdir Downloads
cd Downloads
git clone  https://github.com/rendiwijiatmoko/dmenu.git
cd dwm
sudo make clean install


# Dependencies for Ly Console Manager
sudo apt install -y libpam0g-dev libxcb-xkb-dev

# Install Ly Console Display Manager
cd 
cd Downloads
git clone --recurse-submodules https://github.com/nullgemm/ly.git
cd ly/
make
sudo make install
sudo systemctl enable ly

# XSessions and dwm.desktop
if [[ ! -d /usr/share/xsessions ]]; then
    sudo mkdir /usr/share/xsessions
fi

cat > ./temp << "EOF"
[Desktop Entry]
Encoding=UTF-8
Name=dwm
Comment=Dynamic window manager
Exec=dwm
Icon=dwm
Type=XSession
EOF
sudo cp ./temp /usr/share/xsessions/dwm.desktop;rm ./temp

sudo apt autoremove

printf "\e[1;32mYou can now reboot! Thanks you.\e[0m\n"