# Preconfiguration of ubuntu16.04
# Author: Yalun Lin Hsu, empowered by Thrimbda
# Last Modified: 2019-06-26

set -e

apt-get update && apt-get install -y curl \
    wget \
    htop \
    zsh \
    git \
    vim \
    tmux

# Install Docker
apt-get install -y apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

add-apt-repository -y \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

apt-get update && apt-get install -y docker-ce \
    docker-ce-cli \
    containerd.io


# System customize
# use Thrimbda's script to install pretty oh my zsh silently yet must not exeucte without root privilege.
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Thrimbda/shell-set-up/master/install.sh)"

# setup zsh envionment
sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen
export LANG=en_US.UTF-8
export LANGUAGE=en_US:en
export LC_ALL=en_US.UTF-8

# vim configuration, powered by spf13 vim
# sh -c "$(curl https://j.mp/spf13-vim3 -L)"