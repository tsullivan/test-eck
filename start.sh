#!/bin/sh

set -v -e

echo "hi"
kubectl apply -f elasticsearch.deployment.yaml kibana.deployment.yaml

