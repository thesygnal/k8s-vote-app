#!/bin/bash
CLUSTER_NAME="vote-app-cluster"
echo "Deleting old cluster if it exists..."
k3d cluster delete $CLUSTER_NAME
echo "Creating new cluster '$CLUSTER_NAME' with ingress ports..."
k3d cluster create $CLUSTER_NAME -p "80:80@loadbalancer" -p "443:443@loadbalancer"
echo "Cluster '$CLUSTER_NAME' is ready!"
