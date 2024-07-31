#!/bin/bash

# zsh
sudo apt-get install zsh -y
chsh -s $(which zsh) -y

# ohmyzsh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" -y