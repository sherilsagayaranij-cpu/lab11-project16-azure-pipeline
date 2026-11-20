# 12 test scenarios

| ID | Scenario | Command or action | Expected result |
|---|---|---|---|
| 01 | Local Bicep compile | `bash scripts/validate.sh dev` | Successful build |
| 02 | Dev deployment | `bash scripts/deploy.sh dev` | Resource group and modules created |
| 03 | Idempotency | Repeat deploy; inspect What-If | No unexpected changes |
| 04 | App ZIP deploy | `bash scripts/deploy-app.sh dev` | ZIP deployed |
| 05 | Health | `bash scripts/verify.sh dev` | Healthy JSON |
| 06 | Not found | `curl -i https://<host>/missing` | HTTP 404 |
| 07 | HTTPS | Browse `https://<host>/` | TLS endpoint responds |
| 08 | Environment isolation | Deploy qa and compare resource groups | Separate app and plan |
| 09 | App settings | Portal > Web App > Environment variables | ENVIRONMENT set correctly |
| 10 | Monitoring | Request /health, inspect App Insights | Telemetry may appear after delay |
| 11 | ARM export | `bash scripts/export-arm.sh` | Generated JSON files |
| 12 | Cleanup | `bash scripts/cleanup.sh qa` | QA resource group removed |

Capture screenshots with resource IDs redacted. Results are expected, not observed.
