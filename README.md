# LAB 11 — Project 16: Azure Application Deployment Pipeline (brand-new GitHub repository)

**Azure standard subscription | Bicep | Node.js | GitHub Actions | Microsoft Entra OIDC | DEV / TEST / PROD**

Start with **[STUDENT-LAB-MANUAL.md](STUDENT-LAB-MANUAL.md)**. The workflow is **`.github/workflows/main.yml` at repository root** and is discoverable by GitHub Actions without moving it.

## Architecture

`Developer -> GitHub (push or Run workflow) -> test + Bicep compilation -> GitHub environment approval -> Entra OIDC -> Bicep What-If/deploy -> Azure App Service ZIP deploy -> /health`.

Bicep provisions a Linux App Service Plan, App Service, and Application Insights in each environment resource group. This template does **not** provision Log Analytics workspace or separate Azure Monitor alert rules; do not assume they exist. Application Insights itself is a billable service.

## Quick start (after Entra OIDC and GitHub secrets are configured)

GitHub > Actions > LAB11 Project16 > Run workflow > choose `dev`. Check the `deploy` job and `/health`. Then run `test`, and finally `prod` after configuring protection rules.

Local Cloud Shell alternative:

```bash
az login # only if not already signed in
az account set --subscription '<YOUR_SUBSCRIPTION_ID>'
bash scripts/deploy.sh dev
bash scripts/deploy-app.sh dev
bash scripts/verify.sh dev
```

`AUTO_APPROVE=true bash scripts/deploy.sh dev` skips the What-If prompt (use only after review). `LOCATION` defaults to `centralindia`; `RG_PREFIX` defaults to `rg-lab11-p16`.

**Cost:** B1/S1 App Service plans and monitoring incur charges. Each environment has its own plan. Run DEV first and clean up after exercises.
