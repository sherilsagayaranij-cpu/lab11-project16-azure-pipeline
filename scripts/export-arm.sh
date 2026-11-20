#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
mkdir -p "$ROOT/arm/generated"
az bicep build --file "$ROOT/infrastructure/main.bicep" --outfile "$ROOT/arm/generated/main.json"
for e in dev qa prod; do az bicep build-params --file "$ROOT/infrastructure/parameters/$e.bicepparam" --outfile "$ROOT/arm/generated/$e.parameters.json"; done
