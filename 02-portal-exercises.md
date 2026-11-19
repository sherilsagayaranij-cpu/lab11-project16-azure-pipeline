# Azure Portal manual exercises

1. Resource groups > `rg-lab11-p16-dev` > Overview: verify Central India and tags.
2. Deployments > most recent deployment > Inputs / Outputs: identify parameters and App Service hostname.
3. App Service Plan > Scale up: inspect B1 cost; do not change SKU without approval.
4. App Service > Overview: confirm Running and HTTPS URL.
5. App Service > Configuration > Application settings: inspect ENVIRONMENT (do not expose secrets).
6. App Service > Deployment Center: inspect logs; distinguish ZIP deploy from GitHub continuous deployment.
7. App Service > Log stream: inspect app startup logs.
8. Application Insights > Overview / Failures: generate `/health` requests, then inspect telemetry after ingestion delay.
9. Resource group > Access control (IAM): inspect least-privilege role assignments.
10. Resource group > Deployments > Template: review generated ARM representation.
11. Azure Portal > Cloud Shell: run What-If before any redeploy.
12. Azure Monitor > Metrics: view requests and response times where metrics are available.
