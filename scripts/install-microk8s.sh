#! /usr/bin/env bash

set -euC
set -o pipefail
set -x

sudo snap install microk8s --classic
sudo snap install kubectl --classic
sudo usermod -aG microk8s "$USER"
sudo chown -fR "$USER" ~/.kube
microk8s config > ~/.kube/config
