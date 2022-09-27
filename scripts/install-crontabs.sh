#! /usr/bin/env bash

set -euC
set -o pipefail
set -x

sudo crontab crontabs/root
crontab crontabs/user
