#!/bin/bash

# Config

MINECRAFT_SERVER_DIR="minecraft-server"
MIECRAFT_SERVER_PATH="$HOME/$MINECRAFT_SERVER_DIR"
# 1.16.5 server, requires java 8
MINECRAFT_SERVER_DOWNLOAD_URL="https://launcher.mojang.com/v1/objects/1b557e7b033b583cd9f66746b7a9ab1ec1673ced/server.jar"

# Update the system and isntall dependencies
sudo apt update && sudo apt upgrade -y
sudo apt install git wget zip default-jdk python3-rpi.gpio  rpi.gpio-common -y
# pyenv dependencies
sudo apt-get update; sudo apt-get install make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev -y
# Clone and configure pyenv
# git clone https://github.com/pyenv/pyenv.git ~/.pyenv
# echo 'export PYENV_ROOT="$HOME/.pyenv"' >> $HOME/.bashrc
# echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> $HOME/.bashrc
# echo 'eval "$(pyenv init --path)"' >>~/.profile
# echo 'eval "$(pyenv init -)"' >> ~/.bashrc
# source $HOME/.bashrc
# pyenv install $WORKING_PYTHON_VERSION
# pyenv global $WORKING_PYTHON_VERSION
# source $HOME/.bashrc
# Update pip and install python packages
pip install -U pip && pip install mcrcon numpy
sudo pip install RPi.GPIO



# Create minecraft dir
cd $HOME
mkdir -v $MIECRAFT_SERVER_PATH
cd $MIECRAFT_SERVER_PATH


# Download and setup mineccraft server
wget $MINECRAFT_SERVER_DOWNLOAD_URL
echo "eula=TRUE" > eula.txt
java -Xmx2048M -Xms2048M -jar server.jar nogui || echo "Failed to startup the server"

# to zmeiniz z true na false
# online-mode=false
# ma byc true
# enable-rcon=true