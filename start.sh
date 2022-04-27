#!/bin/sh

set -v -e

# install custom resource definitions
kubectl create -f https://download.elastic.co/downloads/eck/2.1.0/crds.yaml

# install the operator with rbac rules
kubectl apply -f https://download.elastic.co/downloads/eck/2.1.0/operator.yaml

# to monitor the operator logs
#kubectl -n elastic-system logs -f statefulset.apps/elastic-operator

kubectl apply -f elasticsearch.deployment.yaml
kubectl apply -f kibana.deployment.yaml

# display the ClusterIP Service that has been automatically created for Kibana
kubectl get service quickstart-kb-http

# expose kibana on 5601
kubectl port-forward service/quickstart-kb-http 5601

# to expose elasticsearch
#kubectl port-forward service/quickstart-es-http 9200
