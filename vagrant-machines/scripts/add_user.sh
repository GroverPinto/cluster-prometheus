#!/bin/bash

sudo useradd -m ansible -s /bin/bash
sudo su 
echo "ansible:ansible" |chpasswd 
echo "************************** End user created"

echo 'ansible ALL=(ALL)       NOPASSWD:ALL' >> /etc/sudoers


sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config    
sudo systemctl restart sshd.service


echo "************************** End user permissions granted"