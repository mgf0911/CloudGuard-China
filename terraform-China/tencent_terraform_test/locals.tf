locals {
  ssh_flags                      = "-T -oStrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o PasswordAuthentication=no -oKexAlgorithms=+diffie-hellman-group-exchange-sha1 -oHostKeyAlgorithms=+ssh-rsa -oPubkeyAcceptedKeyTypes=+ssh-rsa"
  wait_for_bash_shell_ssh_cmd    = "for i in $(seq 1 50); do ssh ${local.ssh_flags} -i %s admin@%s uname; if [ $? != 0 ]; then sleep 30; else exit 0; fi; done; exit 1 > /dev/null 2>&1"                                                                                                                                                       // needs to be called using format() with arguments: key path, ip
  change_shell_to_bash_ssh_cmd   = "ssh ${local.ssh_flags} -i %s admin@%s set user admin shell /bin/bash"                                                                                                                                                                                                                                      // needs to be called using format() with arguments: key path, ip
  lock_database_override_script  = "ssh -T -i %s -oStrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o PasswordAuthentication=no -oKexAlgorithms=+diffie-hellman-group-exchange-sha1 -oHostKeyAlgorithms=+ssh-rsa -oPubkeyAcceptedKeyTypes=+ssh-rsa admin@%s clish -c \\'lock database override\\'"                                    // needs to be called using format() with arguments: key path, ip, key path, ip
  add_admin_password_hash_script = "ssh -T -i %s -oStrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o PasswordAuthentication=no -oKexAlgorithms=+diffie-hellman-group-exchange-sha1 -oHostKeyAlgorithms=+ssh-rsa -oPubkeyAcceptedKeyTypes=+ssh-rsa admin@%s clish -c \\'set user admin password-hash ${replace("%s", "$", "\\$")}\\'" // needs to be called using format() with arguments: key path, ip, password hash
  save_config_script             = "ssh -T -i %s -oStrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o PasswordAuthentication=no -oKexAlgorithms=+diffie-hellman-group-exchange-sha1 -oHostKeyAlgorithms=+ssh-rsa -oPubkeyAcceptedKeyTypes=+ssh-rsa admin@%s clish -c \\'save config\\'"

//  add_gw_to_mgmt_script_path      = "${local.common_scripts_dir}/add_single_gw_to_mgmt.sh"
//  add_gw_to_mgmt_script_args      = "${local.gw_hostname} ${module.gw[0].public_ip} ${local.gw_SIC} ${var.gw_version}"
//  mgmt_cli_additional_script_args = "${local.gw_hostname} true ${local.get_interfaces_available} \"${var.mgmt_policy_name}\" ${var.mgmt_install_policy}"
//  add_nat_rules_script_path       = "${local.common_scripts_dir}/add_nat_port_translation_rules.sh"
//  add_nat_rules_script_args       = "${local.gw_hostname} ${module.gw[0].public_ip} ${local.gw_frontend_ip} ${var.mgmt_policy_name} ${var.project} ${local.internal_hosts_private_ips}"

  gw_hostname              = "${var.project}-gw" // var.gw_deployment_type == "Single" ? "${var.project}-gw" : (var.gw_deployment_type == "Cluster" ? "${var.project}-cluster" : "")
  gw_SIC                   = "12345678"
  gw_password_hash         = htpasswd_password.gw_password.sha512
  gw_password_hash_escaped = replace(local.gw_password_hash, "$", "\\$")
//  gw_frontend_ip           = module.gw[0].frontend_private_ip

  mgmt_ip                    = tencentcloud_instance.mgmt[0].public_ip
  mgmt_hostname              = "${var.project}-mgmt"
  mgmt_major_minor           = substr(var.mgmt_version, 1, -1) // removes R from mgmt_version
  mgmt_key_path              = var.mgmt_import ? var.mgmt_key_path : var.key_path
  mgmt_password_hash         = htpasswd_password.mgmt_password.sha512
  mgmt_password_hash_escaped = replace(local.mgmt_password_hash, "$", "\\$")

  maintenance_pwd = local.mgmt_major_minor >= 81.20 ? var.mgmt_password : ""

  get_interfaces_available = local.mgmt_major_minor >= 81 ? true : false // only Management R81 and above supports command 'get-interfaces'

  tencent_scripts_dir = "${path.root}/scripts"
  common_scripts_dir  = "${path.root}/../common/scripts"

  ubuntu_image               = "img-22trbn9x" // Ubuntu 20.04 
  internal_hosts_private_ips = join(" ", data.tencentcloud_instances.internal_host_info.instance_list[*].private_ip)
}
