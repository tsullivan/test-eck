#!/bin/sh

set -v -e
# expose Kibana and ES port locally
kubectl port-forward service/quickstart-kb-http 5699:5601
kubectl port-forward service/quickstart-es-default 9299:9200
