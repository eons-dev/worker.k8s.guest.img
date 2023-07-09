#!/bin/bash

persist="/mnt/persist/$HOSTNAME"

paths=(
	/etc/kubernetes
	/etc/tinc 
)

for path in ${paths[@]}; do
	ln -sv $persist$path $path
done

cp -rv $persist/var/lib/ /var/lib/

if [ -d /var/lib/kubelet/pki/ ] && [ ! -z "$(ls /var/lib/kubelet/pki)" ]; then
	rm -fv /var/lib/kubelet/pki/kubelet-client-current.pem
	ln -sv /var/lib/kubelet/pki/$(ls /var/lib/kubelet/pki/ | tail -3 | head -1) /var/lib/kubelet/pki/kubelet-client-current.pem
fi


# This was moved to mkkubelet.sh
# Specifying the $path after var/lib somehow duplicates it???
# for path in $(ls $persist/var/lib/); do
# 	rm -rfv /var/lib/$path
# 	ln -sv $persist/var/lib/$path /var/lib/
# done
