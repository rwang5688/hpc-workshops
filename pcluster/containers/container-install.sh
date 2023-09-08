#!/bin/bash

# Install Docker and add user "ubuntu" to group "docker"
sudo apt-get update
sudo apt-get install -y docker.io
sudo usermod -a -G docker ubuntu
sudo systemctl start docker
sudo systemctl enable docker

# Install Singularity


# Install AWS CLI v2
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
exit
