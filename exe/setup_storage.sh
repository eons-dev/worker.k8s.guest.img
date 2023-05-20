#!/bin/bash

persist="/mnt/persist/$HOSTNAME"

paths=(
	/etc/kubernetes
	/etc/tinc
)

for path in ${paths[@]}; do
	ln -sv $persist$path $path
done

# using the loop duplicates the last path???
ln -sv $persist/var/lib/kubelet /var/lib/kubelet