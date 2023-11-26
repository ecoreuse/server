#! /usr/bin/env bash

set -euC
set -o pipefail
set -x

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get autoremove -y
