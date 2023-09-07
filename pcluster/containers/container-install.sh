#!/bin/bash

# Install Docker
sudo apt-get update && sudo apt-get install -y docker.io
sudo usermod -a -G docker ubuntu
sudo systemctl start docker
sudo systemctl enable docker

# Install Singularity
sudo apt-get install -y singularity

# Install AWS CLI v2
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
exit
