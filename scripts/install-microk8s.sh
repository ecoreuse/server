#! /usr/bin/env bash

set -euC
set -o pipefail
set -x

SCRIPTS_DIR=$(dirname "$0")
SERVICES_DIR=$(realpath "$SCRIPTS_DIR"/../services)

sudo snap install microk8s --classic
sudo usermod -aG microk8s "$USER"
sudo chown -fR "$USER" ~/.kube
sudo snap install kubectl --classic

if [ ! -f ~/.kube/config ]; then
    microk8s config > ~/.kube/config
fi

# Install addons
microk8s enable dns dashboard ingress hostpath-storage observability

SERVICE_FILENAME="kubernetes-dashboard.service"
if [ ! -f /etc/systemd/system/"$SERVICE_FILENAME" ]; then
    sudo ln -s "$SERVICES_DIR/$SERVICE_FILENAME" /etc/systemd/system/"$SERVICE_FILENAME"
fi
