#!/bin/bash

# Regenerate secret
kubectl -n applications create configmap frigate-config --from-file config/config.yaml -o yaml --dry-run=client > configmap.yml
kubectl -n applications create secret generic frigate-secrets --from-env-file config/.env -o yaml --dry-run=client > secret.yml

# Apply configmap 
kubectl apply -f configmap.yml
kubectl apply -f secret.yml

# Restart pods (not using kubectl rollout restart because the system I have has less than cpu limit)
if kubectl -n applications get pods --no-headers 2> /dev/null | grep -q frigate ; then
  kubectl -n applications delete pod "$(kubectl -n applications get pods --no-headers | grep frigate | cut -d ' ' -f 1)"
fi
