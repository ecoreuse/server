#! /usr/bin/env bash

set -euC
set -o pipefail

DEST="${1:-"$HOME/backup/selenium-user-data"}"
if [ ! -d "$DEST" ]; then
    mkdir -p "$DEST"
fi
SRC="$(
    kubectl get -n ecoreuse9 pv -o json \
    | jq -r '.items[] | select(.spec.claimRef.name == "selenium-user-data") | .spec.hostPath.path'
)/"
sudo rsync -ah --delete --backup --backup-dir="../backup-$(date +%Y%m%d)" "$SRC" "$DEST/backup-latest"
