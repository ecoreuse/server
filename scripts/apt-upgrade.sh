#! /usr/bin/env bash

set -euC
set -o pipefail
set -x

UPGRADE_LOG_FILE="/dev/stdout"
AUTOREMOVE_LOG_FILE="/dev/stdout"

export DEBIAN_FRONTEND=noninteractive
sudo apt-get update
sudo apt-get upgrade -y | tee -a "$UPGRADE_LOG_FILE"
sudo apt-get autoremove -y | tee -a "$AUTOREMOVE_LOG_FILE"
