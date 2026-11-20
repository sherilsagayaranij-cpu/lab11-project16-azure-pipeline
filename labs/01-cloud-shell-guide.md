# Cloud Shell walkthrough (Central India)

1. In Azure Portal open Cloud Shell > Bash; select your standard subscription with `az account set --subscription '<ID>'`.
2. Upload the ZIP using Cloud Shell > Manage files > Upload. Run `unzip LAB11-Project16-Azure-Application-Deployment-Pipeline.zip` and `cd LAB11-Project16-Azure-Application-Deployment-Pipeline`.
3. Run `chmod +x scripts/*.sh` and `az bicep upgrade`.
4. Run `bash scripts/validate.sh dev` for local compilation.
5. Run `bash scripts/deploy.sh dev`. Review What-If; approve. The script creates `rg-lab11-p16-dev`.
6. Run `bash scripts/deploy-app.sh dev`, then `bash scripts/verify.sh dev`.
7. Repeat for `qa` or `prod` if needed. Each environment uses a separate App Service Plan and incurs cost.
8. Run `bash scripts/export-arm.sh` to generate ARM JSON in `arm/generated`.
9. Run `bash scripts/cleanup.sh dev` after the lab.

## Expected outputs
- `az webapp list -g rg-lab11-p16-dev -o table` lists the application.
- `curl https://<app-name>.azurewebsites.net/health` returns JSON containing `status: healthy`.
- No resources have been deployed by the ZIP author; actual names and output depend on your subscription.
