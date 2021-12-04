#!/bin/bash

# Config
MINECRAFT_SERVER_DIR="minecraft-server"
MIECRAFT_SERVER_PATH="$HOME/$MINECRAFT_SERVER_DIR"
# 1.16 server, requires java 8
MINECRAFT_SERVER_DOWNLOAD_URL="https://launcher.mojang.com/v1/objects/1b557e7b033b583cd9f66746b7a9ab1ec1673ced/server.jar"

# Update the system and isntall dependencies
sudo apt update && sudo apt upgrade -y
# default-jdk 
sudo apt install git wget zip default-jdk -y
# pyenv dependencies
sudo apt-get update; sudo apt-get install make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev -y
# Clone pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv

# Create minecraft dir
mkdir -v $MIECRAFT_SERVER_PATH
cd $MIECRAFT_SERVER_PATH


# Download and setup mineccraft server
wget $MINECRAFT_SERVER_DOWNLOAD_URL
echo "eula=TRUE" > eula.txt
java -Xmx2048M -Xms2048M -jar server.jar nogui || echo "Failedto startup the server" # tu OR

# to zmeiniz z true na false
# online-mode=false