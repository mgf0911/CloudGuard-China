#!/bin/bash
cat <<EOF>/etc/udev/rules.d/00-OS-XX.rules
ID=="virtio2", NAME="eth0"
ID=="virtio3", NAME="eth1"
ID=="virtio4", NAME="eth2"
EOF

