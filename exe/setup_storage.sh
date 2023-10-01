#!/bin/bash

persist="/mnt/persist/$HOSTNAME"

paths=(
	/etc/kubernetes
	/etc/tinc 
)

for path in ${paths[@]}; do
	ln -sv $persist$path $path
done

rsync -ravh $persist/var/lib/ /var/lib/

if [ -d /var/lib/kubelet/pki/ ] && [ ! -z "$(ls /var/lib/kubelet/pki)" ]; then
	rm -fv /var/lib/kubelet/pki/kubelet-client-current.pem
	ln -sv /var/lib/kubelet/pki/$(ls /var/lib/kubelet/pki/ | tail -3 | head -1) /var/lib/kubelet/pki/kubelet-client-current.pem
fi
