# Troubleshooting

- **AuthorizationFailed**: confirm subscription, `az account show`, resource-group Contributor role; for GitHub OIDC ensure federation subject matches GitHub environment.
- **Region/SKU unavailable**: check `az appservice list-locations --sku B1 -o table`; try another supported region or SKU after cost review.
- **Subscription quota**: request quota or deploy only dev; three B1 plans cost more than one.
- **Bicep syntax/build failure**: run `az bicep upgrade` and `az bicep build --file infrastructure/main.bicep`.
- **Deployment failure**: inspect `az deployment group list -g rg-lab11-p16-dev -o table` and deployment operations.
- **Web App 503/500**: check Log stream, App Service Configuration, ZIP deployment logs; verify `npm start` and Node runtime.
- **GitHub OIDC login failure**: ensure `id-token: write`, app registration federated credential `repo:OWNER/REPO:environment:dev` (and qa/prod), and repo environment is configured.
- **GitHub deployment approval missing**: configure required reviewers under repository Settings > Environments (plan/repository policy may apply).
- **Application Insights empty**: allow ingestion delay; simple Node sample does not automatically emit rich request telemetry without an SDK or instrumentation.
- **Storage/ARM JSON**: ARM templates are compiled from Bicep; `arm/generated` is intentionally generated rather than hand-maintained.
