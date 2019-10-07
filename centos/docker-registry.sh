#!/bin/bash


echo "removing dockerhub  containers if running "
docker rm -f dockerhub


docker run -d -p 443:5000 --restart=always --name dockerhub -v /temp_dockerhub:/var/lib/registry  -v /opt/test-certs:/certs \
  -e REGISTRY_STORAGE_DELETE_ENABLED=true \
  -e REGISTRY_HTTP_TLS_CERTIFICATE=/certs/test.crt \
  -e REGISTRY_HTTP_TLS_KEY=/certs/test.key \
  registry:2
