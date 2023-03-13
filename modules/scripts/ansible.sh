#!/bin/bash

# Update the package manager
sudo apt update -y
sudo hostnamectl set-hostname ansible-controller

# Install the required packages
sudo apt install -y software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install -y ansible