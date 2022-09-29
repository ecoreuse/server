#! /usr/bin/env bash

set -euC
set -o pipefail
set -x

curl -fsSL https://get.docker.com/ | bash
sudo usermod -aG docker "$USER"
