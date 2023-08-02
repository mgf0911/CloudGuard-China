#!/bin/bash

template_name=$1
template_version=$2
admin_shell=$3
internal_ip=$4
hostname=$5
sic_key=$6
allow_upload_download=$7

echo "template_name: ${template_name}" >> /etc/cloud-version
echo "template_version: ${template_version}" >> /etc/cloud-version

clish -c "set user admin shell '${admin_shell}'" -s
clish -c "set interface eth1 ipv4-address ${internal_ip} mask-length 24"
clish -c "set interface eth1 state on"
clish -c "set hostname ${hostname}" -s

addr_ex="$(ip addr show dev eth0 | awk '/inet/{print $2; exit}' | cut -d / -f 1)"
dynamic_objects -n LocalGatewayExternal -r "$addr_ex" "$addr_ex" -a || true
addr_int="$(ip addr show dev eth1 | awk '/inet/{print $2; exit}' | cut -d / -f 1)"
dynamic_objects -n LocalGatewayInternal -r "$addr_int" "$addr_int" -a || true

blink_conf="gateway_cluster_member=true"
blink_conf="$blink_conf&ftw_sic_key=${sic_key}"
blink_conf="$blink_conf&download_info=${allow_upload_download}"
blink_conf="$blink_conf&upload_info=${allow_upload_download}"
blink_conf="$blink_conf&reboot_if_required=true"

blink_config -s "$blink_conf"

touch /etc/finished_user_data

shutdown -r now

