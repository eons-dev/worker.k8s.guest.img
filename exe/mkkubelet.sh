#!/bin/bash

echo "kubelet \
--container-runtime-endpoint=unix:///var/run/containerd/containerd.sock \
--node-ip=$(ip addr show internode | awk '$1 == "inet" {gsub(/\/.*$/, "", $2); print $2}') \
" > /launch.d/60_kubelet