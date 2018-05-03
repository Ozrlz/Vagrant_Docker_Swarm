#! /bin/bash

# Install docker c:

# Update and install requirements
apt-get update && sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common \
	sshpass

# Add the key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add the stable repository
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Install docker
apt-get update && apt-get install -y docker-ce

# Add the vagrant user to the docker group c:
usermod -aG docker vagrant

# Add the hosts in the /etc/hosts file only if the're not in 
egrep -e '^origin$|^manager[0-9]$|^node[0-9]$' /etc/hosts
if [ $? != 0 ]
then
    echo -e "192.168.10.10\torigin\torigin" >> /etc/hosts
    echo -e "192.168.10.11\tmanager1\tmanager1" >> /etc/hosts
    echo -e "192.168.10.21\tnode1\tnode1"  >> /etc/hosts
    echo -e "192.168.10.22\tnode2\tnode2"  >> /etc/hosts
fi

# Purge
apt-get autoremove -y