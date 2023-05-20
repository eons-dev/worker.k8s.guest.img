#!/bin/bash
echo "127.0.1.1 $HOSTNAME" >> /etc/hosts

cat << EOF > /etc/crictl.yaml
runtime-endpoint: "unix:///run/containerd/containerd.sock"
timeout: 0
debug: false
EOF