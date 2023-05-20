#!/bin/bash

echo "kubelet \
--container-runtime-endpoint=unix:///var/run/containerd/containerd.sock \
--kubeconfig=/etc/kubernetes/kubelet.conf \
--config=/var/lib/kubelet/config.yaml \
--node-ip=$(ip addr show internode | awk '$1 == "inet" {gsub(/\/.*$/, "", $2); print $2}') \
" > /launch.d/60_kubelet