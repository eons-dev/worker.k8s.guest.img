#!/bin/bash

persist="/mnt/persist/$HOSTNAME"

paths=(
	/etc/kubernetes
	/etc/tinc
	/var/lib/kubelet
)

for path in ${paths[@]}; do
	ln -sv $persist/$path $path
done

