echo "KUBELET_EXTRA_ARGS=\"\
--node-ip=$(ip addr show internode | awk '$1 == "inet" {gsub(/\/.*$/, "", $2); print $2}')\" \
" > /etc/default/kubelet