#!/bin/bash
# Files are ordered in proper order with needed wait for the dependent custom resource definitions to get initialized.
# Usage: bash helm-apply.sh
cs=csvc
suffix=helm
if [ -d "${cs}-${suffix}" ]; then
helm dep up ./${cs}-${suffix}
helm upgrade --install ${cs} ./${cs}-${suffix} --namespace k8sspringdemo
fi
helm dep up ./k8sspringdemo-${suffix}
helm upgrade --install k8sspringdemo ./k8sspringdemo-${suffix} --namespace k8sspringdemo


