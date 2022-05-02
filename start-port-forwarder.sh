#!/bin/sh

set -v -e

# display the ClusterIP Service that has been automatically created for Kibana
kubectl get service quickstart-kb-http

# Once the PortForward Service starts, open https://localhost:5601 in your browser. Your browser will show a
# warning because the self-signed certificate configured by default is not verified by a known certificate
# authority and not trusted by your browser

# Log in as the `elastic` user. The password can be obtained with the following command:
#kubectl get secret quickstart-es-elastic-user -o=jsonpath='{.data.elastic}' | base64 --decode; echo

# to expose elasticsearch
#kubectl port-forward service/quickstart-es-http 9200

# expose kibana on 5601
kubectl port-forward service/quickstart-kb-http 5699:5601
