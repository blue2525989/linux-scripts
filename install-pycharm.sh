#!/bin/bash
# installs pycharm

sudo add-apt-repository ppa:mystic-mirage/pycharm
sudo apt-get update
sudo apt-get install pycharm-community
sudo add-apt-repository --remove ppa:mystic-mirage/pycharm
exit 0
