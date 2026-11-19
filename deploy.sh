#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/common.sh" "${1:-dev}"
az account show --query '{subscription:id,tenant:tenantId}' -o table
az group create -n "$RG" -l "$LOCATION" --tags project=lab11-p16 environment="$ENVIRONMENT" -o none
bash "$ROOT/scripts/validate.sh" "$ENVIRONMENT"
az deployment group what-if -g "$RG" -f "$ROOT/infrastructure/main.bicep" -p "$ROOT/infrastructure/parameters/${ENVIRONMENT}.bicepparam"
if [[ "${AUTO_APPROVE:-false}" != true ]]; then
  read -r -p 'Proceed with deployment? [y/N] ' confirm
  [[ "$confirm" =~ ^[Yy]$ ]] || { echo 'Cancelled'; exit 0; }
fi
az deployment group create -g "$RG" -n "p16-${ENVIRONMENT}-$(date +%Y%m%d%H%M%S)" -f "$ROOT/infrastructure/main.bicep" -p "$ROOT/infrastructure/parameters/${ENVIRONMENT}.bicepparam" --query properties.outputs -o json
