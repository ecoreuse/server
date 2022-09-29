#! /usr/bin/env bash

set -euC
set -o pipefail
set -x

SCRIPTS_DIR=$(dirname "$0")
SERVICES_DIR=$(realpath "$SCRIPTS_DIR"/../services)

sudo snap install microk8s --classic
sudo snap install kubectl --classic
sudo usermod -aG microk8s "$USER"
sudo chown -fR "$USER" ~/.kube
microk8s config > ~/.kube/config

# Install addons
microk8s enable dns dashboard ingress hostpath-storage observability
SERVICE_FILENAME="kubernetes-dashboard.service"
sudo ln -s "$SERVICES_DIR/$SERVICE_FILENAME" /etc/systemd/system/"$SERVICE_FILENAME"
