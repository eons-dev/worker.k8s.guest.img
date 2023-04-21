persist="/mnt/persist/$HOSTNAME"

paths=(
	/etc/kubernetes
	/etc/tinc
)

for path in ${paths[@]}; do
	ln -sv $persist/$path $path
done

