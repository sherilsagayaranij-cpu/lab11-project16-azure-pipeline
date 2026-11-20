# GitHub Actions with Azure OIDC — setup

1. Create an Entra app registration and service principal for CI/CD (portal: Microsoft Entra ID > App registrations > New registration).
2. On the app registration, create **Federated credentials** for GitHub Actions. Use entity type **Environment** and the exact repository `OWNER/REPO` and environment `dev`; repeat for `qa` and `prod`.
3. Grant the service principal **Contributor** at the specific lab resource group scope. Create each resource group first (e.g. `az group create -n rg-lab11-p16-dev -l centralindia`). Avoid subscription-wide Contributor.
4. In GitHub repository Settings > Secrets and variables > Actions, create secrets `AZURE_CLIENT_ID`, `AZURE_TENANT_ID`, `AZURE_SUBSCRIPTION_ID`.
5. In Settings > Environments create `dev`, `qa`, `prod`; add required reviewers to prod and optionally qa.
6. Push to `main` to run app tests and Bicep build only. To deploy, Actions > Azure Bicep + App Deployment > Run workflow > choose environment.
7. The deploy job requests OIDC token (`id-token: write`), logs into Azure, runs What-If, deploys infrastructure, ZIP deploys app, then verifies health.
8. Review job logs and Azure deployment history. Avoid printing credentials.

**Security note:** The deployment job uses `AUTO_APPROVE=true` after GitHub environment approval. For production, add separate manual review of the What-If plan before deployment.
