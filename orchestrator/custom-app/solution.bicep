@description('The location of the existing Arc-enabled cluster resource in Azure.')
@allowed(['eastus2', 'westus3', 'northeurope'])
param clusterLocation string

@description('The extended location resource name.')
param customLocationName string

@description('The solution resource name.')
param solutionName string


resource k8sResource 'Microsoft.iotoperationsorchestrator/solutions@2023-10-04-preview' = {
  name: solutionName
  location: clusterLocation
  extendedLocation: {
    type: 'CustomLocation'
    name: resourceId('Microsoft.ExtendedLocation/customLocations', customLocationName)
  }
  properties: {
    components: [
      {
        name: 'app-01'
        type: 'yaml.k8s'
        properties: {
          yaml: 'https://raw.githubusercontent.com/ruifelixpereira/cicd-iot-orchestrator/main/azure-vote.yaml'
        }
      }
    ]
  }
}
