#!/bin/sh

set -v -e

kubectl apply -f elasticsearch.deployment.yaml
kubectl apply -f kibana.deployment.yaml

# To start a trial create a Kubernetes secret. Note that it must be in the same namespace as the operator
# (elastic-system)
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Secret
metadata:
  name: eck-trial-license
  namespace: elastic-system
  labels:
    license.k8s.elastic.co/type: enterprise_trial
  annotations:
    elastic.co/eula: accepted
EOF
