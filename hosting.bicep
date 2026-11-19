param location string
param environment string
param suffix string
param planSku string
@secure()
param appInsightsConnectionString string
resource plan 'Microsoft.Web/serverfarms@2023-12-01' = {
  name: 'asp-lab11-p16-${environment}-${suffix}'
  location: location
  sku: {
    name: planSku
    tier: planSku == 'B1' ? 'Basic' : 'Standard'
  }
  kind: 'linux'
  properties: {
    reserved: true
  }
  tags: {
    project: 'lab11-p16'
    environment: environment
  }
}
resource web 'Microsoft.Web/sites@2023-12-01' = {
  name: 'app-lab11-p16-${environment}-${suffix}'
  location: location
  kind: 'app,linux'
  properties: {
    serverFarmId: plan.id
    httpsOnly: true
    siteConfig: {
      linuxFxVersion: 'NODE|20-lts'
      alwaysOn: true
      ftpsState: 'Disabled'
      appSettings: [
        { name: 'WEBSITE_NODE_DEFAULT_VERSION', value: '~20' }
        { name: 'APPLICATIONINSIGHTS_CONNECTION_STRING', value: appInsightsConnectionString }
        { name: 'ENVIRONMENT', value: environment }
        { name: 'SCM_DO_BUILD_DURING_DEPLOYMENT', value: 'true' }
        { name: 'WEBSITE_RUN_FROM_PACKAGE', value: '0' }
      ]
    }
  }
  tags: {
    project: 'lab11-p16'
    environment: environment
  }
}
output webAppName string = web.name
output webAppUrl string = 'https://${web.properties.defaultHostName}'
