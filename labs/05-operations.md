# Operational verification

```bash
az account show -o table
az group show -n rg-lab11-p16-dev --query '{name:name,location:location,tags:tags}' -o json
az resource list -g rg-lab11-p16-dev -o table
az deployment group list -g rg-lab11-p16-dev -o table
az webapp list -g rg-lab11-p16-dev -o table
bash scripts/verify.sh dev
az monitor app-insights component show -g rg-lab11-p16-dev --app "$(az resource list -g rg-lab11-p16-dev --resource-type Microsoft.Insights/components --query '[0].name' -o tsv)" -o table
```

Verify the resource tags, HTTPS-only setting, plan SKU, deployment history, app status, health endpoint, logs, and monthly cost in Cost Management. Configure budget alerts separately; this project does not provision a budget.
