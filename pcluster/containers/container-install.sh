# Ensure repositories are up-to-date
sudo apt-get update

# Install Docker and add user "ubuntu" to group "docker"
sudo apt-get install -y docker.io
sudo usermod -a -G docker ubuntu
sudo systemctl start docker
sudo systemctl enable docker

# Install Singularity
# https://docs.sylabs.io/guides/main/admin-guide/installation.html#id1
# Install debian packages for dependencies
sudo apt-get install -y \
   build-essential \
   libseccomp-dev \
   libglib2.0-dev \
   pkg-config \
   squashfs-tools \
   cryptsetup \
   runc
   
export VERSION=1.21.1 OS=linux ARCH=amd64 && \
  wget https://dl.google.com/go/go$VERSION.$OS-$ARCH.tar.gz && \
  sudo tar -C /usr/local -xzvf go$VERSION.$OS-$ARCH.tar.gz && \
  rm go$VERSION.$OS-$ARCH.tar.gz
  
echo 'export PATH=/usr/local/go/bin:$PATH' >> ~/.bashrc && \
  source ~/.bashrc

# https://github.com/sylabs/singularity/releases/download/v3.11.4/singularity-ce-3.11.4.tar.gz  
export VERSION=3.11.4 && \
    wget https://github.com/sylabs/singularity/releases/download/v${VERSION}/singularity-ce-${VERSION}.tar.gz && \
    tar -xzf singularity-ce-${VERSION}.tar.gz && \
    cd singularity-ce-${VERSION}

git clone --recurse-submodules https://github.com/sylabs/singularity.git && \
    cd singularity && \
    git checkout --recurse-submodules v${VERSION}

./mconfig && \
    make -C builddir && \
    sudo make -C builddir install

# Install AWS CLI v2
cd
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
