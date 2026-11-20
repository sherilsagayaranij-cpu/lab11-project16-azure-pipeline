param location string
param environment string
param suffix string
resource ai 'Microsoft.Insights/components@2020-02-02' = {
  name: 'ai-lab11-p16-${environment}-${suffix}'
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
  }
  tags: {
    project: 'lab11-p16'
    environment: environment
  }
}
output name string = ai.name
output connectionString string = ai.properties.ConnectionString
