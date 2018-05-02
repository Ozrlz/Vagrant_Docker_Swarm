#! /bin/bash

# Add the node to the swarm cluster
sshpass -p "vagrant" ssh -o StrictHostKeyChecking=no vagrant@manager 'docker swarm join-token worker' | grep -e "docker" | sudo /bin/bash

