#!/bin/bash

# Update and upgrade
sudo apt update
sudo apt upgrade -y

# Install Git
sudo apt install git -y

# Install Node.js
wget -O - https://raw.githubusercontent.com/audstanley/NodeJs-Raspberry-Pi/master/Install-Node.sh | sudo bash

# Install bpytop
sudo apt install bpytop -y

# Install vsftpd and restart it
sudo apt install vsftpd -y
sudo service vsftpd restart

# Create the "projects" directory in the home directory
mkdir ~/projects

# Set a static IP address for wlan0 (replace with your network configuration)
sudo tee -a /etc/dhcpcd.conf <<EOL
interface wlan0
static ip_address=192.168.0.77/24
static routers=192.168.0.1
static domain_name_servers=192.168.0.1
EOL

# Restart the networking service to apply the static IP
sudo systemctl restart dhcpcd

# Reboot the Raspberry Pi
sudo reboot

echo "Raspberry Pi setup complete. The system will now reboot."
