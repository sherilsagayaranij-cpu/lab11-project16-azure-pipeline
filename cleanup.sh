#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/common.sh" "${1:-dev}"
echo "This permanently deletes ALL resources in $RG"
read -r -p "Type $RG to confirm: " answer
[[ "$answer" == "$RG" ]] || { echo Cancelled; exit 1; }
az group delete -n "$RG" --yes
