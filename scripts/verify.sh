#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/common.sh" "${1:-dev}"
az resource list -g "$RG" --query '[].{name:name,type:type,location:location}' -o table
APP=$(az webapp list -g "$RG" --query '[0].name' -o tsv)
[[ -n "$APP" && "$APP" != None ]] || { echo "No app found in $RG" >&2; exit 1; }
az webapp show -g "$RG" -n "$APP" --query '{name:name,state:state,httpsOnly:httpsOnly,host:defaultHostName}' -o json
HOST=$(az webapp show -g "$RG" -n "$APP" --query defaultHostName -o tsv)
curl --fail --show-error --retry 8 --retry-delay 10 --retry-connrefused "https://${HOST}/health"
echo
