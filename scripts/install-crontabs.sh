#! /usr/bin/env bash

set -euC
set -o pipefail
set -x

SCRIPTS_DIR=$(dirname "$0")
CRONTABS_DIR=$(realpath "$SCRIPTS_DIR"/../crontabs)

sudo crontab "$CRONTABS_DIR"/root

# apt upgrade
sudo cp "$SCRIPTS_DIR"/apt-upgrade.sh /usr/local/bin/

# backup selenium user data
sudo cp "$SCRIPTS_DIR"/backup-selenium-user-data.sh /usr/local/bin/
