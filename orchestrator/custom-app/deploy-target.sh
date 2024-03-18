#!/bin/bash

source ./.env

az deployment group create \
  --resource-group $RESOURCE_GROUP \
  --template-file ./target.bicep \
  --parameters \
  clusterLocation=$CLUSTER_LOCATION \
  clusterNamespace=$NAMESPACE \
  customLocationName=$CUSTOM_LOCATION_NAME \
  targetName=$TARGET_NAME
