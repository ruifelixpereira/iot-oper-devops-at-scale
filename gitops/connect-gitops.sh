#!/bin/bash

source ./.env

az k8s-configuration flux create \
  --name cluster-config \
  --cluster-name $CLUSTER_NAME \
  --namespace flux-system \
  --resource-group $RESOURCE_GROUP \
  --url $GIT_REPO \
  --branch main \
  --https-user $GIT_USER \
  --https-key $GIT_TOKEN \
  --scope cluster \
  --cluster-type connectedClusters \
  --interval 2m \
  --kustomization name=cluster-config prune=true path=arc-cicd-cluster/manifests
