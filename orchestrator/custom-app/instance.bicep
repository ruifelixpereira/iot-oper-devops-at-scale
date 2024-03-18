@description('The location of the existing Arc-enabled cluster resource in Azure.')
@allowed(['eastus2', 'westus3', 'northeurope'])
param clusterLocation string

@description('The namespace on the K8s cluster where the resources are installed.')
param clusterNamespace string

@description('The extended location resource name.')
param customLocationName string

@description('The solution name.')
param solutionName string

@description('The target name.')
param targetName string


resource k8sResource 'Microsoft.iotoperationsorchestrator/instances@2023-10-04-preview' = {
  name: '${solutionName}-instance'
  location: clusterLocation
  extendedLocation: {
    type: 'CustomLocation'
    name: resourceId('Microsoft.ExtendedLocation/customLocations', customLocationName)
  }
  properties: {
    version: '1.0.0'
    scope: clusterNamespace
    solution: solutionName
    target: {
      name: targetName
    }
  }
}
