#!/bin/sh

set -v -e

# install custom resource definitions
kubectl create -f https://download.elastic.co/downloads/eck/2.1.0/crds.yaml

# install the operator with rbac rules
kubectl apply -f https://download.elastic.co/downloads/eck/2.1.0/operator.yaml

# to monitor the operator logs
#kubectl -n elastic-system logs -f statefulset.apps/elastic-operator
