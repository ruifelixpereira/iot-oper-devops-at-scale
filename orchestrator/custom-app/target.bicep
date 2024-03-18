@description('The location of the existing Arc-enabled cluster resource in Azure.')
@allowed(['eastus2', 'westus3', 'northeurope'])
param clusterLocation string

@description('The namespace on the K8s cluster where the resources are installed.')
param clusterNamespace string

@description('The extended location resource name.')
param customLocationName string

@description('The target resource name.')
param targetName string


resource k8sResource 'Microsoft.iotoperationsorchestrator/targets@2023-10-04-preview' = {
  name: targetName
  location: clusterLocation
  extendedLocation: {
    type: 'CustomLocation'
    name: resourceId('Microsoft.ExtendedLocation/customLocations', customLocationName)
  }
  properties: {
    scope: clusterNamespace
    components: []
    topologies: [
      {
        bindings: [
          {
            role: 'instance'
            provider: 'providers.target.k8s'
            config: {
              inCluster: 'true'
            }
          }
          {
            role: 'yaml.k8s'
            provider: 'providers.target.kubectl'
            config: {
              inCluster: 'true'
            }
          }
        ]
      }
    ]
  }
}
