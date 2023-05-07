# worker.k8s.guest.img
Kubernetes Worker Guest Image

## Host Configuration

### Make Cgroups Writeable
```
echo 'GRUB_CMDLINE_LINUX=systemd.unified_cgroup_hierarchy=false' > /etc/default/grub.d/cgroup.cfg
update-grub
reboot
```