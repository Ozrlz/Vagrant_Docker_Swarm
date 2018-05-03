# Initialize the docker swarm cluster only if the host is the origin
if [ $(hostname) == "origin" ]
then
    docker swarm init --advertise-addr 192.168.10.10
fi

# If the node is a manager, add it as manager to the cluster
hostname | grep -e "manager" > /dev/null 2>&1
if [ $? == 0 ]
then
    sshpass -p "vagrant" ssh -o StrictHostKeyChecking=no vagrant@origin \
    'docker swarm join-token manager' | grep -e "docker" | sudo /bin/bash
fi
