#!/bin/bash

template_name=$1
template_version=$2
admin_shell=$3
hostname=$4
allow_upload_download=$5
maintenance_pwd=$6

echo "template_name: ${template_name}" >> /etc/cloud-version
echo "template_version: ${template_version}" >> /etc/cloud-version
echo "template_type: ${template_type}" >> /etc/cloud-version

clish -c "set user admin shell '${admin_shell}'" -s
clish -c "set hostname '${hostname}'" -s

clish -c "save config" -s

if [[ -n "${maintenance_pwd}" ]]; then
    maintenance_hash="$(echo -e "$maintenance_pwd\n$maintenance_pwd" | LC_ALL=C grub2-mkpasswd-pbkdf2 | awk '/hash of / {print $NF}')"
    config_system -s "install_security_gw=false&install_security_managment=true&install_mgmt_primary=true&mgmt_gui_clients_radio=any&mgmt_admin_radio=gaia_admin&download_info=${allow_upload_download}&upload_info=${allow_upload_download}&maintenance_hash=${maintenance_hash}"
else
    config_system -s "install_security_gw=false&install_security_managment=true&install_mgmt_primary=true&mgmt_gui_clients_radio=any&mgmt_admin_radio=gaia_admin&download_info=${allow_upload_download}&upload_info=${allow_upload_download}"
fi

api start

touch /etc/finished_user_data

