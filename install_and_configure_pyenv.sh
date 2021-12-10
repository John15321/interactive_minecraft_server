#!/bin/bash

WORKING_PYTHON_VERSION="3.8.0"
# Clone and configure pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> $HOME/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> $HOME/.bashrc
echo 'eval "$(pyenv init --path)"' >>~/.profile
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
source $HOME/.bashrc
pyenv install $WORKING_PYTHON_VERSION
pyenv global $WORKING_PYTHON_VERSION
source $HOME/.bashrc


pip install -U pip && pip install mcrcon numpy
sudo pip install RPi.GPIO
