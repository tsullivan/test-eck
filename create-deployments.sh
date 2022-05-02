#!/bin/sh

set -v -e

kubectl apply -f elasticsearch.deployment.yaml
kubectl apply -f kibana.deployment.yaml
