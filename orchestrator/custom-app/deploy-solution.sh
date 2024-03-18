#!/bin/bash

source ./.env

az deployment group create \
  --resource-group $RESOURCE_GROUP \
  --template-file ./solution.bicep \
  --parameters \
  clusterLocation=$CLUSTER_LOCATION \
  customLocationName=$CUSTOM_LOCATION_NAME \
  solutionName=$SOLUTION_NAME