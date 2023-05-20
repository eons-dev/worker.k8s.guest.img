#!/bin/bash

persist="/mnt/persist/$HOSTNAME"

paths=(
	/etc/kubernetes
	/etc/tinc
)

for path in ${paths[@]}; do
	ln -sv $persist$path $path
done

# This was moved to mkkubelet.sh
# Specifying the $path after var/lib somehow duplicates it???
# for path in $(ls $persist/var/lib/); do
# 	rm -rfv /var/lib/$path
# 	ln -sv $persist/var/lib/$path /var/lib/
# done
