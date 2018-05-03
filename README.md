# Vagrant_Docker_Swarm

## Description

This repo is intended for testing purposes only, DO NOT USE IT UNDER PROD ENVS !!!

The vagrantfile defines 4 nodes, 2 managers and 2 workers.

They can communicate each other for hostname.

They follow the following hierarchy:

            Origin
            |
            manager1
            ___
                |
                node1
                |
                node2

