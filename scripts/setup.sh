#! /usr/bin/env bash

set -euC
set -o pipefail
set -x

SCRIPTDIR=$(dirname "$0")

# Install docker
if [ -z "$(which docker)" ]; then
    ./"$SCRIPTDIR"/install-docker.sh
fi

# Install microk8s
if [ -z "$(which microk8s)" ]; then
    ./"$SCRIPTDIR"/install-microk8s.sh
fi

# Install crontab
./"$SCRIPTDIR"/install-crontabs.sh

# Setup .git/hooks
cp -r "$SCRIPTDIR"/hooks "$SCRIPTDIR"/.git
chmod -R 744 "$SCRIPTDIR"/.git/hooks
