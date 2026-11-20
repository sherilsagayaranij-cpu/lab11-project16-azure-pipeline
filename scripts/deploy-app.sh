#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/common.sh" "${1:-dev}"
command -v zip >/dev/null || { echo 'Install zip first' >&2; exit 1; }
command -v unzip >/dev/null || { echo 'Install unzip first' >&2; exit 1; }
APP=$(az webapp list -g "$RG" --query '[0].name' -o tsv)
[[ -n "$APP" && "$APP" != None ]] || { echo "No web app found in $RG" >&2; exit 1; }
TMP_DIR=$(mktemp -d)
trap 'rm -rf "$TMP_DIR"' EXIT
ZIP="$TMP_DIR/application.zip"
(cd "$ROOT/application" && zip -q -r "$ZIP" . -x 'node_modules/*' '*.zip' '.git/*')
unzip -t "$ZIP" >/dev/null
az webapp deploy -g "$RG" -n "$APP" --src-path "$ZIP" --type zip
HOST=$(az webapp show -g "$RG" -n "$APP" --query defaultHostName -o tsv)
echo "Application deployed: https://${HOST}/health"
