# ECK Test

Run these commands to use this repo:

1. Start a Kubernetes cluster locally, using `minikube` or `kind`.

1. Run the `install-eck.sh` script to install the Elastic custom resource definitions.

1. Run the `create-deployments.sh` script

1. Run the `start-port-forwarder.sh` script

You can now log into Kibana as the `elastic` user. The password can be obtained with the following command:
```sh
kubectl get secret quickstart-es-elastic-user -o=jsonpath='{.data.elastic}' | base64 --decode; echo
```

Using https://github.com/elastic/kibana-reporting-benchmarks, the following command can install sample data from 7.6:
```sh
\
  ELASTIC_PW=$(kubectl get secret quickstart-es-elastic-user -o=jsonpath='{.data.elastic}' | base64 --decode; echo) \
  TEST_KIBANA_URL=https://elastic:$ELASTIC_PW@localhost:5699 \
  TEST_ES_URL=https://elastic:$ELASTIC_PW@localhost:9200 \
  ./setup/setup_kibana.sh
```
