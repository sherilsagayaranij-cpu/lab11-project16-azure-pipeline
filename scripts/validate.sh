#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/common.sh" "${1:-dev}"
az bicep build --file "$ROOT/infrastructure/main.bicep" --outfile /tmp/lab11-p16-main.json
az bicep build-params --file "$ROOT/infrastructure/parameters/${ENVIRONMENT}.bicepparam" --outfile /tmp/lab11-p16-${ENVIRONMENT}.parameters.json
if az group exists --name "$RG" | grep -q true; then
 az deployment group validate -g "$RG" --template-file "$ROOT/infrastructure/main.bicep" --parameters "$ROOT/infrastructure/parameters/${ENVIRONMENT}.bicepparam"
else
 echo "Resource group $RG does not exist; performed local Bicep compilation only."
fi
