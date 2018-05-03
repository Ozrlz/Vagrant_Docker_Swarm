#! /bin/bash

# Add the node to the swarm cluster
sshpass -p "vagrant" ssh -o StrictHostKeyChecking=no vagrant@origin \
'docker swarm join-token worker' | grep -e "docker" | sudo /bin/bash

