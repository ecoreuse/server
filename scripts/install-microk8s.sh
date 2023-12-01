#! /usr/bin/env bash

set -euC
set -o pipefail
set -x

sudo snap install microk8s --classic
sudo usermod -aG microk8s "$USER"
sudo chown -fR "$USER" ~/.kube
sudo snap install kubectl --classic

if [ ! -f ~/.kube/config ]; then
    microk8s config > ~/.kube/config
fi

# Install addons
addons=(
    "dns"
    "dashboard"
    "hostpath-strorage"
    "ingress"
)
for addon in "${addons[@]}"; do
    microk8s enable "$addon"
    sleep 10
done
