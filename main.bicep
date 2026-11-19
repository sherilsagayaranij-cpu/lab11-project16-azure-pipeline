targetScope = 'resourceGroup'
@description('Environment label')
@allowed(['dev', 'test', 'prod'])
param environment string = 'dev'
@description('Deployment location')
param location string = resourceGroup().location
@description('Globally unique lowercase suffix')
param suffix string = uniqueString(resourceGroup().id)
@description('Linux App Service plan SKU')
@allowed(['B1', 'S1'])
param planSku string = 'B1'
@description('Deploy application hosting')
param deployApp bool = true

module monitoring './modules/monitoring.bicep' = {
  name: 'monitor-${environment}'
  params: {
    location: location
    environment: environment
    suffix: suffix
  }
}
module hosting './modules/hosting.bicep' = if (deployApp) {
  name: 'hosting-${environment}'
  params: {
    location: location
    environment: environment
    suffix: suffix
    planSku: planSku
    appInsightsConnectionString: monitoring.outputs.connectionString
  }
}
output webAppName string = deployApp ? hosting!.outputs.webAppName : ''
output webAppUrl string = deployApp ? hosting!.outputs.webAppUrl : ''
output appInsightsName string = monitoring.outputs.name
