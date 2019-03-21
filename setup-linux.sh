#!/usr/bin/env bash

sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get update
sudo apt-get install -y\
    ansible\
    apt-transport-https\
    build-essential\
    ca-certificates\
    curl\
    git\
    gnupg-agent\
    nodejs\
    npm\
    perl\
    python3.7\
    ruby\
    software-properties-common\
    tmux\
    vim\
    wget\
    zsh

git clone https://github.com/powerline/fonts
sudo ./fonts/install.sh
rm -rf fonts

cp .zshrc_linux ${HOME}/zshrc
cp .vimrc ${HOME}/.vimrc
cp -R .vim ${HOME}/.vim
cp .tmux.conf ${HOME}/.tmux.conf
cp .gitconfig ${HOME}/.gitconfig
cp vscode.json ${HOME}/.config/Code/User/settings.json

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list

sudo apt-get update
sudo apt-get install -y\
    docker-ce\
    docker-ce-cli\
    containerd.io\
    kubectl

curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
  && chmod +x minikube
sudo cp minikube /usr/local/bin && rm minikube

sudo apt-get install libsecret-1-0 libsecret-1-dev
pushd /usr/share/doc/git/contrib/credential/libsecret
make popd

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
