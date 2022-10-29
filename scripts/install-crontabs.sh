#! /usr/bin/env bash

set -euC
set -o pipefail
set -x

SCRIPTS_DIR=$(dirname "$0")
CRONTABS_DIR=$(realpath "$SCRIPTS_DIR"/../crontabs)

sudo crontab "$CRONTABS_DIR"/root
crontab "$CRONTABS_DIR"/user

# apt upgrade
sudo cp "$SCRIPTS_DIR"/apt-upgrade.sh /usr/local/bin/
sudo chmod 544 /usr/local/bin/apt-upgrade.sh
sudo chown root:root /usr/local/bin/apt-upgrade.sh
