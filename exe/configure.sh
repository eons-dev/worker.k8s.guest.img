#!/bin/bash

mkdir -p /etc/default

echo "KUBELET_EXTRA_ARGS=\"\
--node-ip=$(ip addr show internode | awk '$1 == "inet" {gsub(/\/.*$/, "", $2); print $2}')\" \
" > /etc/default/kubelet

echo "127.0.1.1 $HOSTNAME" >> /etc/hosts