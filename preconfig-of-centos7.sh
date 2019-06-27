# Preconfiguration of Centos7
# Author: Yalun Lin Hsu, empowered by Thrimbda
# Last Modified: 2019-06-27

set -e

yum update -y && yum install -y curl \
    htop \
    zsh \
    git \
    vim \
    tmux

yum install -y python36 \
    python36-pip


# Install Docker
yum install -y yum-utils \
    device-mapper-persistent-data \
    lvm2

yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

yum install -y docker-ce docker-ce-cli containerd.io

systemctl start docker

# System customize
# zsh configuration, powered by Thrimbda. root privilege only.
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Thrimbda/shell-set-up/master/install_docker.sh)"
chsh -s /bin/zsh    # zsh will be the default shell next time

# vim configuration, powered by spf13 vim
# sh -c "$(curl https://j.mp/spf13-vim3 -L)"