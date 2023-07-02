#!/bin/bash

persist="/mnt/persist/$HOSTNAME"

paths=(
	/etc/kubernetes
	/etc/tinc
	/etc/cni
	/opt 
)

for path in ${paths[@]}; do
	ln -sv $persist$path $path
done

mkdir -p /var/lib/kubelet/pki
cp -rv $persist/var/lib/kubelet/pki/kubelet* /var/lib/kubelet/pki/
rm -fv /var/lib/kubelet/pki/kubelet-client-current.pem
ln -sv /var/lib/kubelet/pki/$(ls /var/lib/kubelet/pki/ | tail -3 | head -1) /var/lib/kubelet/pki/kubelet-client-current.pem 


# This was moved to mkkubelet.sh
# Specifying the $path after var/lib somehow duplicates it???
# for path in $(ls $persist/var/lib/); do
# 	rm -rfv /var/lib/$path
# 	ln -sv $persist/var/lib/$path /var/lib/
# done
