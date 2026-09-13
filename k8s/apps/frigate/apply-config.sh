#!/bin/bash

# TODO: if change ns in the future, need to change it here too

# Regenerate secret
kubectl -n privileged-apps create configmap frigate-config --from-file config/config.yaml -o yaml --dry-run=client > configmap.yaml
kubectl -n privileged-apps create secret generic frigate-secrets --from-env-file config/.env -o yaml --dry-run=client > secret.yaml

# Apply configmap 
kubectl apply -f configmap.yaml
kubectl apply -f secret.yaml

# Restart pods (not using kubectl rollout restart because the system I have has less than cpu limit)
if kubectl -n privileged-apps get pods --no-headers 2> /dev/null | grep -q frigate ; then
  kubectl -n privileged-apps delete pod "$(kubectl -n privileged-apps get pods --no-headers | grep frigate | cut -d ' ' -f 1)"
fi
