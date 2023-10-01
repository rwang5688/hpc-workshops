# Activate DLAMI PyTorch and conda environments
cd ~
source activate pytorch
conda config --set auto_activate_base true

# Install AWS CLI v2
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
