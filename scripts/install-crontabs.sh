#! /usr/bin/env bash

set -euC
set -o pipefail
set -x

SCRIPTS_DIR=$(dirname "$0")
CRONTABS_DIR=$(realpath "$SCRIPTS_DIR"/../crontabs)

sudo crontab "$CRONTABS_DIR"/root
crontab "$CRONTABS_DIR"/user
