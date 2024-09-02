#!/bin/bash
# Files are ordered in proper order with needed wait for the dependent custom resource definitions to get initialized.
# Usage: bash helm-apply.sh
cs=csvc
suffix=helm
kubectl apply -f namespace.yml
helmVersion=$(helm version --client | grep -E "v3\\.[0-9]{1,3}\\.[0-9]{1,3}" | wc -l)
if [ -d "${cs}-${suffix}" ]; then
  if [ $helmVersion -eq 1 ]; then
helm uninstall ${cs} 2>/dev/null
  else
helm delete --purge ${cs} 2>/dev/null
  fi
helm dep up ./${cs}-${suffix}
  if [ $helmVersion -eq 1 ]; then
helm install ${cs} ./${cs}-${suffix} --replace --namespace k8sspringdemo
  else
helm install --name ${cs} ./${cs}-${suffix} --replace --namespace k8sspringdemo
  fi
fi
  if [ $helmVersion -eq 1 ]; then
helm uninstall k8sspringdemo 2>/dev/null
  else
helm delete --purge k8sspringdemo 2>/dev/null
  fi
helm dep up ./k8sspringdemo-${suffix}
  if [ $helmVersion -eq 1 ]; then
helm install k8sspringdemo  ./k8sspringdemo-${suffix} --replace --namespace k8sspringdemo
  else
helm install --name k8sspringdemo  ./k8sspringdemo-${suffix} --replace --namespace k8sspringdemo
  fi


