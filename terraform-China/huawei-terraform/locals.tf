locals {
  ssh_flags                      = "-T -oStrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o PasswordAuthentication=no -oKexAlgorithms=+diffie-hellman-group-exchange-sha1 -oHostKeyAlgorithms=+ssh-rsa -oPubkeyAcceptedKeyTypes=+ssh-rsa"
  wait_for_bash_shell_ssh_cmd    = "for i in $(seq 1 50); do ssh ${local.ssh_flags} -i %s admin@%s uname; if [ $? != 0 ]; then sleep 30; else exit 0; fi; done; exit 1 > /dev/null 2>&1"                                                                                                                                                       // needs to be called using format() with arguments: key path, ip
  change_shell_to_bash_ssh_cmd   = "ssh ${local.ssh_flags} -i %s admin@%s set user admin shell /bin/bash"                                                                                                                                                                                                                                      // needs to be called using format() with arguments: key path, ip
  lock_database_override_script  = "ssh -T -i %s -oStrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o PasswordAuthentication=no -oKexAlgorithms=+diffie-hellman-group-exchange-sha1 -oHostKeyAlgorithms=+ssh-rsa -oPubkeyAcceptedKeyTypes=+ssh-rsa admin@%s clish -c \\'lock database override\\'"                                    // needs to be called using format() with arguments: key path, ip, key path, ip
  add_admin_password_hash_script = "ssh -T -i %s -oStrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o PasswordAuthentication=no -oKexAlgorithms=+diffie-hellman-group-exchange-sha1 -oHostKeyAlgorithms=+ssh-rsa -oPubkeyAcceptedKeyTypes=+ssh-rsa admin@%s clish -c \\'set user admin password-hash ${replace("%s", "$", "\\$")}\\'" // needs to be called using format() with arguments: key path, ip, password hash
  save_config_script             = "ssh -T -i %s -oStrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o PasswordAuthentication=no -oKexAlgorithms=+diffie-hellman-group-exchange-sha1 -oHostKeyAlgorithms=+ssh-rsa -oPubkeyAcceptedKeyTypes=+ssh-rsa admin@%s clish -c \\'save config\\'"                                               // needs to be called using format() with arguments: key path, ip

  add_gw_to_mgmt_script_path      = var.gw_deployment_type == "Single" ? "${local.common_scripts_dir}/add_single_gw_to_mgmt.sh" : (var.gw_deployment_type == "Cluster" ? "${local.common_scripts_dir}/add_cluster_to_mgmt.sh" : "${local.common_scripts_dir}/empty.sh")
  add_gw_to_mgmt_script_args      = var.gw_deployment_type == "Single" ? "${local.gw_hostname} ${module.gw[0].public_ip} ${local.gw_SIC} ${var.gw_version}" : (var.gw_deployment_type == "Cluster" ? "${local.gw_hostname} ${var.gw_version} ${local.gw_SIC} ${module.cluster[0].cluster_member_1_public_ip} ${module.cluster[0].cluster_member_1_frontend_ip} ${module.cluster[0].cluster_member_1_backend_ip} ${module.cluster[0].cluster_member_2_public_ip} ${module.cluster[0].cluster_member_2_frontend_ip} ${module.cluster[0].cluster_member_2_backend_ip} ${module.cluster[0].cluster_public_ip} ${module.cluster[0].cluster_frontend_ip} ${module.cluster[0].cluster_backend_ip} cluster 'cluster + sync' true" : "")
  mgmt_cli_additional_script_args = local.mgmt_only ? "null ${!var.mgmt_import} false ${var.mgmt_policy_name} false" : "${local.gw_hostname} ${!var.mgmt_import} ${local.get_interfaces_available} \"${var.mgmt_policy_name}\" ${var.mgmt_install_policy}"
  remove_gw_from_mgmt_script_path = var.gw_deployment_type != "None" ? "${local.common_scripts_dir}/remove_gw_from_mgmt.sh" : "${local.common_scripts_dir}/empty.sh"
  remove_gw_from_mgmt_script_args = var.gw_deployment_type != "None" ? "${local.gw_hostname} ${var.gw_deployment_type}" : ""
  add_nat_rules_script_path       = "${local.common_scripts_dir}/add_nat_port_translation_rules.sh"
  add_nat_rules_script_args       = var.gw_deployment_type == "Single" ? "${local.gw_hostname} ${module.gw[0].public_ip} ${module.gw[0].frontend_private_ip} ${var.mgmt_policy_name} ${var.project} ${local.internal_hosts_private_ips}" : (var.gw_deployment_type == "Cluster" ? "${local.gw_hostname} ${module.cluster[0].cluster_public_ip} ${module.cluster[0].cluster_frontend_ip} ${var.mgmt_policy_name} ${var.project} ${local.internal_hosts_private_ips}" : null)
  remove_nat_rules_script_path    = "${local.common_scripts_dir}/remove_nat_port_translation_rules.sh"
  remove_nat_rules_script_args    = "${var.project} ${var.mgmt_policy_name}"

  gw_hostname              = var.gw_deployment_type == "Single" ? "${var.project}-gw" : (var.gw_deployment_type == "Cluster" ? "${var.project}-cluster" : "")
  gw_SIC                   = "aaaa"
  gw_password_hash         = htpasswd_password.gw_password.sha512
  gw_password_hash_escaped = replace(local.gw_password_hash, "$", "\\$")

  mgmt_only = var.gw_deployment_type == "None" && var.mgmt_deployment_type != "None" ? true : false
  mgmt_needs_deployment = var.mgmt_deployment_type == "None" ? false : (var.mgmt_import ? false : true)
  mgmt_ip = var.mgmt_deployment_type == "None" ? "" : (var.mgmt_import ? var.mgmt_ip : huaweicloud_vpc_eip.mgmt_eip[0].address)
  mgmt_major_minor           = substr(var.mgmt_version, 1, -1) // removes R from mgmt_version
  mgmt_hostname              = "${var.project}-mgmt"
  mgmt_key_path              = var.mgmt_import ? var.mgmt_key_path : var.key_path
  mgmt_password_hash         = htpasswd_password.mgmt_password.sha512
  mgmt_password_hash_escaped = replace(local.mgmt_password_hash, "$", "\\$")

  ubuntu_image = "3e4a5ca2-de47-4546-8bcb-457ab329b416" // Ubuntu 20.04 

  maintenance_pwd = local.mgmt_major_minor >= 81.20 ? var.mgmt_password : ""

  get_interfaces_available = local.mgmt_major_minor >= 81 ? true : false // only Management R81 and above supports command 'get-interfaces'

  internal_hosts_private_ips = join(" ", huaweicloud_compute_instance.internal_host[*].access_ip_v4)

  common_scripts_dir = "${path.root}/../common/scripts"
  huawei_scripts_dir = "${path.root}/scripts"
}
