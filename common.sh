#!/usr/bin/env bash
set -euo pipefail
ENVIRONMENT="${1:-dev}"
case "$ENVIRONMENT" in dev|test|prod) ;; *) echo 'Use dev, test or prod' >&2; exit 2;; esac
LOCATION="${LOCATION:-centralindia}"
RG="${RG_PREFIX:-rg-lab11-p16}-${ENVIRONMENT}"
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
