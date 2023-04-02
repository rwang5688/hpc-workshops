# Sources:
# https://isc22.hpcworkshops.com/04-container-parallelcluster/03-create-repository.html
# https://raw.githubusercontent.com/aws-samples/aws-hpc-tutorials/isc22/static/scripts/post-install/container-install.sh

# Install Docker
sudo amazon-linux-extras install -y docker
sudo usermod -a -G docker ec2-user
sudo systemctl start docker
sudo systemctl enable docker

# Install Singularity
sudo yum install -y singularity
