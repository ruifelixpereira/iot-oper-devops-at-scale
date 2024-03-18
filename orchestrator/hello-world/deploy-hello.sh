#!/bin/bash

RESOURCE_GROUP="iot-oper-01-rg"
CLUSTER_LOCATION="northeurope"
NAMESPACE="hello"
CUSTOM_LOCATION_NAME="iot-oper-01-k8s-cl"

az deployment group create \
  --resource-group $RESOURCE_GROUP \
  --template-file ./main.bicep \
  --parameters \
  clusterLocation=$CLUSTER_LOCATION \
  clusterNamespace=$NAMESPACE \
  customLocationName=$CUSTOM_LOCATION_NAME
