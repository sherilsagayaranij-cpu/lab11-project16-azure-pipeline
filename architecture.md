# Architecture diagrams

```mermaid
flowchart TD
  Git[GitHub Repository] --> CI[GitHub Actions: Test and Bicep Build]
  CI --> Gate{Manual workflow dispatch + environment approval}
  Gate --> OIDC[Azure OIDC Federated Identity]
  OIDC --> Bicep[main.bicep]
  Bicep --> AI[Application Insights]
  Bicep --> Plan[Linux App Service Plan]
  Plan --> Web[Node.js Web App]
  AI -. telemetry .-> Web
  CI --> Zip[ZIP Deploy]
  Zip --> Web
  Web --> Health[/health endpoint]
```

```mermaid
flowchart LR
  Developer --> Repo[main branch]
  Repo --> Tests[Node.js tests]
  Tests --> Validate[Bicep compile]
  Validate --> Dev[DEV manual dispatch]
  Dev --> QA[QA manual dispatch]
  QA --> Prod[PROD protected environment]
```

```mermaid
flowchart TD
  Main[main.bicep] --> Monitor[modules/monitoring.bicep]
  Main --> Hosting[modules/hosting.bicep]
  Params[dev/qa/prod.bicepparam] --> Main
  Hosting --> Plan[App Service Plan]
  Hosting --> App[Web App]
  Monitor --> Insights[Application Insights]
```
