resource "null_resource" "single_gw_cloud_init_script" {
  count = var.gw_deployment_type == "Single" ? 1 : 0
  depends_on = [
    module.gw[0]
  ]

  connection {
    type        = "ssh"
    host        = module.gw[0].public_ip
    user        = "admin"
    private_key = file(var.key_path)
    timeout     = "15m"
  }

  provisioner "remote-exec" { // returns when preliminary connection established
    on_failure = continue
    inline     = []
  }

  provisioner "local-exec" {
    on_failure = continue
    command    = "sleep 60"
  }

  provisioner "local-exec" {
    on_failure = continue
    command    = format(local.change_shell_to_bash_ssh_cmd, var.key_path, module.gw[0].public_ip)
  }

  provisioner "local-exec" { // change shell to bash
    on_failure = fail
    command    = format(local.wait_for_bash_shell_ssh_cmd, var.key_path, module.gw[0].public_ip)
  }

  provisioner "file" {
    source      = "${local.huawei_scripts_dir}/cloud_init_gw.sh"
    destination = "/tmp/cloud_init.sh"
  }

  provisioner "remote-exec" {
    on_failure = continue
    inline = [
      "chmod +x /tmp/cloud_init.sh",
      "/tmp/cloud_init.sh single_terraform 20230302 /bin/bash ${module.gw[0].backend_private_ip} ${local.gw_hostname} ${local.gw_SIC} true",
      "rm /tmp/cloud_init.sh"
    ]
  }
}

resource "null_resource" "cluster_1_cloud_init_script" {
  count = var.gw_deployment_type == "Cluster" ? 1 : 0
  depends_on = [
    module.cluster[0]
  ]

  connection {
    type        = "ssh"
    host        = module.cluster[0].cluster_member_1_public_ip
    user        = "admin"
    private_key = file(var.key_path)
    timeout     = "15m"
  }

  provisioner "remote-exec" { // returns when preliminary connection established
    on_failure = continue
    inline     = []
  }

  provisioner "local-exec" {
    on_failure = continue
    command    = "sleep 60"
  }

  provisioner "local-exec" {
    on_failure = continue
    command    = format(local.change_shell_to_bash_ssh_cmd, var.key_path, module.cluster[0].cluster_member_1_public_ip)
  }

  provisioner "local-exec" {
    on_failure = fail
    command    = format(local.wait_for_bash_shell_ssh_cmd, var.key_path, module.cluster[0].cluster_member_1_public_ip)
  }

  provisioner "file" {
    source      = "${local.huawei_scripts_dir}/cloud_init_cl.sh"
    destination = "/tmp/cloud_init.sh"
  }

  provisioner "remote-exec" {
    on_failure = continue
    inline = [
      "chmod +x /tmp/cloud_init.sh",
      "/tmp/cloud_init.sh cluster_terraform 20230302 /bin/bash ${local.gw_hostname}-1 ${local.gw_SIC} true",
      "rm /tmp/cloud_init.sh"
    ]
  }
}

resource "null_resource" "cluster_2_cloud_init_script" {
  count = var.gw_deployment_type == "Cluster" ? 1 : 0
  depends_on = [
    module.cluster[0]
  ]

  connection {
    type        = "ssh"
    host        = module.cluster[0].cluster_member_2_public_ip
    user        = "admin"
    private_key = file(var.key_path)
    timeout     = "15m"
  }

  provisioner "remote-exec" { // returns when preliminary connection established
    on_failure = continue
    inline     = []
  }

  provisioner "local-exec" {
    on_failure = continue
    command    = "sleep 60"
  }

  provisioner "local-exec" {
    on_failure = continue
    command    = format(local.change_shell_to_bash_ssh_cmd, var.key_path, module.cluster[0].cluster_member_2_public_ip)
  }

  provisioner "local-exec" {
    on_failure = fail
    command    = format(local.wait_for_bash_shell_ssh_cmd, var.key_path, module.cluster[0].cluster_member_2_public_ip)
  }

  provisioner "file" {
    source      = "${local.huawei_scripts_dir}/cloud_init_cl.sh"
    destination = "/tmp/cloud_init.sh"
  }

  provisioner "remote-exec" {
    on_failure = continue
    inline = [
      "chmod +x /tmp/cloud_init.sh",
      "/tmp/cloud_init.sh cluster_terraform 20230302 /bin/bash ${local.gw_hostname}-2 ${local.gw_SIC} true",
      "rm /tmp/cloud_init.sh"
    ]
  }
}

resource "null_resource" "mgmt_cloud_init_script" {
  count = local.mgmt_needs_deployment ? 1 : 0
  depends_on = [
    huaweicloud_compute_instance.mgmt[0]
  ]

  connection {
    type        = "ssh"
    host        = local.mgmt_ip
    user        = "admin"
    private_key = file(local.mgmt_key_path)
    timeout     = "15m"
  }

  provisioner "remote-exec" { // returns when preliminary connection established
    on_failure = continue
    inline     = []
  }

  provisioner "local-exec" {
    on_failure = continue
    command    = "sleep 60"
  }

  provisioner "local-exec" {
    on_failure = continue
    command    = format(local.change_shell_to_bash_ssh_cmd, local.mgmt_key_path, local.mgmt_ip)
  }

  provisioner "local-exec" {
    on_failure = fail
    command    = format(local.wait_for_bash_shell_ssh_cmd, local.mgmt_key_path, local.mgmt_ip)
  }

  provisioner "file" {
    source      = "${local.huawei_scripts_dir}/cloud_init_mgmt.sh"
    destination = "/tmp/cloud_init.sh"
  }

  provisioner "remote-exec" {
    on_failure = continue
    inline = [
      "chmod +x /tmp/cloud_init.sh",
      "/tmp/cloud_init.sh mgmt_terraform 20210111 /bin/bash ${local.mgmt_hostname} true ${local.maintenance_pwd}",
      "rm /tmp/cloud_init.sh"
    ]
  }
}

resource "null_resource" "wait_for_cluster_reboot_script" {
  depends_on = [
    null_resource.single_gw_cloud_init_script,
    null_resource.mgmt_cloud_init_script,
    null_resource.cluster_1_cloud_init_script,
    null_resource.cluster_2_cloud_init_script
  ]

  provisioner "local-exec" {
    on_failure = continue
    command    = "sleep 60"
  }
}

resource "null_resource" "check_single_gw_done_script" {
  count = var.gw_deployment_type == "Single" ? 1 : 0
  depends_on = [
    module.gw[0],
    null_resource.wait_for_cluster_reboot_script
  ]

  connection {
    type        = "ssh"
    host        = module.gw[0].public_ip
    user        = "admin"
    private_key = file(var.key_path)
    timeout     = "15m"
  }

  provisioner "remote-exec" { // returns when preliminary connection established
    on_failure = continue
    inline     = []
  }

  provisioner "local-exec" { // lock database override
    on_failure = continue
    command    = format(local.lock_database_override_script, var.key_path, module.gw[0].public_ip)
  }

  provisioner "local-exec" { // add admin password hash (if relevant)
    on_failure = fail
    command    = var.gw_password != "" ? format(local.add_admin_password_hash_script, var.key_path, module.gw[0].public_ip, local.gw_password_hash_escaped) : ":"
  }

  provisioner "local-exec" { // save config
    on_failure = fail
    command    = format(local.save_config_script, var.key_path, module.gw[0].public_ip)
  }
}

resource "null_resource" "check_cluster_member_1_done_script" {
  count = var.gw_deployment_type == "Cluster" ? 1 : 0
  depends_on = [
    module.cluster[0],
    null_resource.wait_for_cluster_reboot_script
  ]

  connection {
    type        = "ssh"
    host        = module.cluster[0].cluster_member_1_public_ip
    user        = "admin"
    private_key = file(var.key_path)
    timeout     = "15m"
  }

  provisioner "remote-exec" { // returns when preliminary connection established
    on_failure = continue
    inline     = []
  }

  provisioner "local-exec" { // lock database override
    on_failure = continue
    command    = format(local.lock_database_override_script, var.key_path, module.cluster[0].cluster_member_1_public_ip)
  }

  provisioner "local-exec" { // add admin password hash (if relevant)
    on_failure = fail
    command    = var.gw_password != "" ? format(local.add_admin_password_hash_script, var.key_path, module.cluster[0].cluster_member_1_public_ip, local.gw_password_hash_escaped) : ":"
  }

  provisioner "local-exec" { // save config
    on_failure = fail
    command    = format(local.save_config_script, var.key_path, module.cluster[0].cluster_member_1_public_ip)
  }
}

resource "null_resource" "check_cluster_member_2_done_script" {
  count = var.gw_deployment_type == "Cluster" ? 1 : 0
  depends_on = [
    module.cluster[0],
    null_resource.wait_for_cluster_reboot_script
  ]

  connection {
    type        = "ssh"
    host        = module.cluster[0].cluster_member_2_public_ip
    user        = "admin"
    private_key = file(var.key_path)
    timeout     = "15m"
  }

  provisioner "remote-exec" { // returns when preliminary connection established
    on_failure = continue
    inline     = []
  }

  provisioner "local-exec" { // lock database override
    on_failure = continue
    command    = format(local.lock_database_override_script, var.key_path, module.cluster[0].cluster_member_2_public_ip)
  }

  provisioner "local-exec" { // add admin password hash (if relevant)
    on_failure = fail
    command    = var.gw_password != "" ? format(local.add_admin_password_hash_script, var.key_path, module.cluster[0].cluster_member_2_public_ip, local.gw_password_hash_escaped) : ":"
  }

  provisioner "local-exec" { // save config
    on_failure = fail
    command    = format(local.save_config_script, var.key_path, module.cluster[0].cluster_member_2_public_ip)
  }
}

resource "null_resource" "check_mgmt_done_script" {
  count = local.mgmt_needs_deployment ? 1 : 0
  depends_on = [
    null_resource.wait_for_cluster_reboot_script
  ]

  connection {
    type        = "ssh"
    host        = local.mgmt_ip
    user        = "admin"
    private_key = file(local.mgmt_key_path)
    timeout     = "15m"
  }

  provisioner "remote-exec" { // returns when preliminary connection established
    on_failure = continue
    inline     = []
  }

  provisioner "local-exec" { // lock database override
    on_failure = continue
    command    = format(local.lock_database_override_script, var.key_path, local.mgmt_ip)
  }

  provisioner "remote-exec" { // returns when preliminary connection established
    on_failure = continue
    inline = [
      "api start"
    ]
  }

  provisioner "file" { // returns when API is ready
    source      = "${local.common_scripts_dir}/check_api_ready.sh"
    destination = "/tmp/check_api_ready.sh"
  }

  provisioner "remote-exec" {
    on_failure = continue
    inline = [
      "api start",
      "chmod +x /tmp/check_api_ready.sh",
      "/tmp/check_api_ready.sh",
      "rm /tmp/check_api_ready.sh"
    ]
  }

  provisioner "remote-exec" {
    on_failure = continue
    inline = [
      "api start",
      "chmod +x /tmp/check_api_ready.sh",
      "/tmp/check_api_ready.sh",
      "rm /tmp/check_api_ready.sh"
    ]
  }

  provisioner "local-exec" { // add admin password hash (if relevant)
    on_failure = continue
    command    = var.mgmt_password != "" ? format(local.add_admin_password_hash_script, local.mgmt_key_path, local.mgmt_ip, local.mgmt_password_hash_escaped) : ":"
  }

  provisioner "local-exec" { // save config
    on_failure = continue
    command    = format(local.save_config_script, var.key_path, local.mgmt_ip)
  }

  provisioner "remote-exec" {
    inline = [
      "mgmt_cli -r true set checkpoint-host name ${local.mgmt_hostname} ip-address ${local.mgmt_ip} management-blades.logging-and-status true management-blades.network-policy-management true logs-settings.enable-log-indexing true",
      "mgmt_cli -r true publish"
    ]
  }
}

resource "null_resource" "add_gw_to_mgmt_script" {
  count = (var.gw_deployment_type == "None" || var.mgmt_deployment_type == "None") ? 0 : 1
  depends_on = [
    null_resource.check_mgmt_done_script,
    null_resource.check_single_gw_done_script,
    null_resource.check_cluster_member_1_done_script,
    null_resource.check_cluster_member_2_done_script
  ]

  connection {
    type        = "ssh"
    host        = local.mgmt_ip
    user        = "admin"
    private_key = file(local.mgmt_key_path)
    timeout     = "15m"
  }

  provisioner "remote-exec" { // returns when preliminary connection established
    on_failure = continue
    inline     = []
  }

  provisioner "local-exec" { // needs to run in case management was imported
    on_failure = continue
    command    = format(local.change_shell_to_bash_ssh_cmd, local.mgmt_key_path, local.mgmt_ip)
  }

  provisioner "file" {
    source      = local.add_gw_to_mgmt_script_path
    destination = "/tmp/add_gw_to_mgmt_script.sh"
  }

  provisioner "remote-exec" {
    on_failure = fail
    inline = [
      "set -o errexit", // returns non-zero on failure of any one of the commands
      "chmod +x /tmp/add_gw_to_mgmt_script.sh",
      "sh -x /tmp/add_gw_to_mgmt_script.sh ${local.add_gw_to_mgmt_script_args}",
      "rm /tmp/add_gw_to_mgmt_script.sh"
    ]
  }
}

resource "null_resource" "mgmt_additional_cmds_script" {
  count = var.mgmt_deployment_type == "None" ? 0 : 1
  depends_on = [
    null_resource.check_mgmt_done_script,
    null_resource.check_single_gw_done_script,
    null_resource.check_cluster_member_1_done_script,
    null_resource.check_cluster_member_2_done_script,
    null_resource.add_gw_to_mgmt_script
  ]

  connection {
    type        = "ssh"
    host        = local.mgmt_ip
    user        = "admin"
    private_key = file(local.mgmt_key_path)
    timeout     = "15m"
  }

  provisioner "remote-exec" { // returns when preliminary connection established
    on_failure = continue
    inline     = []
  }

  provisioner "local-exec" { // needs to run in case management was imported and no gateway was deployed
    on_failure = continue
    command    = format(local.change_shell_to_bash_ssh_cmd, local.mgmt_key_path, local.mgmt_ip)
  }

  provisioner "file" { // run additional management CLI commands
    source      = "${local.common_scripts_dir}/mgmt_cli_additional.sh"
    destination = "/tmp/mgmt_cli_additional.sh"
  }

  provisioner "remote-exec" {
    on_failure = fail
    inline = [
      "set -o errexit", // returns non-zero on failure of any one of the commands
      "chmod +x /tmp/mgmt_cli_additional.sh",
      "/tmp/mgmt_cli_additional.sh ${local.mgmt_cli_additional_script_args}",
      "rm /tmp/mgmt_cli_additional.sh"
    ]
  }
}

resource "null_resource" "nat_rules_script" {
  count = var.internal_count > 0 && (var.mgmt_deployment_type != "None" && var.gw_deployment_type != "None") ? 1 : 0
  depends_on = [
    null_resource.check_mgmt_done_script,
    null_resource.check_single_gw_done_script,
    null_resource.check_cluster_member_1_done_script,
    null_resource.check_cluster_member_2_done_script,
    null_resource.add_gw_to_mgmt_script,
    null_resource.mgmt_additional_cmds_script
  ]

  connection {
    type        = "ssh"
    host        = local.mgmt_ip
    user        = "admin"
    private_key = file(local.mgmt_key_path)
    timeout     = "15m"
  }

  provisioner "remote-exec" { // returns when preliminary connection established
    on_failure = continue
    inline     = []
  }

  provisioner "file" {
    source      = local.add_nat_rules_script_path
    destination = "/tmp/add_nat_rules.sh"
  }

  provisioner "remote-exec" {
    on_failure = fail
    inline = [
      "set -o errexit", // returns non-zero on failure of any one of the commands
      "chmod +x /tmp/add_nat_rules.sh",
      "flock /run/lock/add_nat_rules_script_lock -c \"sh -x /tmp/add_nat_rules.sh ${local.add_nat_rules_script_args}\""
    ]
  }

  provisioner "file" { // run additional management CLI commands
    source      = "${local.common_scripts_dir}/mgmt_cli_additional.sh"
    destination = "/tmp/mgmt_cli_additional.sh"
  }

  provisioner "remote-exec" {
    on_failure = fail
    inline = [
      "set -o errexit", // returns non-zero on failure of any one of the commands
      "chmod +x /tmp/mgmt_cli_additional.sh",
      "flock /run/lock/add_nat_rules_script_lock -c \"sh -x /tmp/mgmt_cli_additional.sh ${local.gw_hostname} false false ${var.mgmt_policy_name} true\""
    ]
  }
}
/*
resource "null_resource" "external_host_allow_http_script" {
  count = local.mgmt_only ? 0 : var.external_count
  depends_on = [
    null_resource.nat_rules_script
  ]

  connection {
    type        = "ssh"
    host        = huaweicloud_vpc_eip.external_host_eip[count.index].address
    user        = "ubuntu"
    private_key = file(var.key_path)
    timeout     = "15m"
    port        = 22
  }

  provisioner "remote-exec" { // returns when preliminary connection established
    on_failure = continue
    inline     = []
  }

  provisioner "remote-exec" {
    inline = [
      "sudo iptables -I INPUT 6 -m state --state NEW -p tcp --dport 80 -j ACCEPT",
      "sudo netfilter-persistent save",
      "sudo ip li set mtu 1200 dev ens3"
    ]
  }
}

resource "null_resource" "internal_host_allow_http_script" {
  count = local.mgmt_only ? 0 : var.internal_count
  depends_on = [
    null_resource.nat_rules_script
  ]

  connection {
    type        = "ssh"
    host        = var.gw_deployment_type == "Single" ? module.gw[0].public_ip : module.cluster[0].cluster_public_ip
    user        = "ubuntu"
    private_key = file(var.key_path)
    timeout     = "15m"
    port        = 2200 + count.index
  }

  provisioner "remote-exec" { // returns when preliminary connection established
    on_failure = continue
    inline     = []
  }

  provisioner "remote-exec" {
    inline = [
      "sudo iptables -I INPUT 6 -m state --state NEW -p tcp --dport 80 -j ACCEPT",
      "sudo netfilter-persistent save",
      "sudo ip li set mtu 1200 dev ens3"
    ]
  }
}
*/
resource "null_resource" "remove_gw_from_mgmt" {
  triggers = {                                                        // used to store data (provisioner can't access locals and variables on destruction script)
    count                               = var.mgmt_deployment_type == "None" ? "0" : (var.mgmt_import ? "1" : "0") // trigger values are saved as strings
    lock_database_override_local_script = local.lock_database_override_script
    change_shell_to_bash_local_script   = local.wait_for_bash_shell_ssh_cmd
    remove_gw_from_mgmt_script_path     = local.remove_gw_from_mgmt_script_path
    remove_gw_from_mgmt_script_args     = local.remove_gw_from_mgmt_script_args
    remove_nat_rules_script_path        = local.remove_nat_rules_script_path
    remove_nat_rules_script_args        = local.remove_nat_rules_script_args
    mgmt_ip                             = local.mgmt_ip
    mgmt_key_path                       = local.mgmt_key_path
  }

  connection {
    type        = "ssh"
    host        = self.triggers.count == "1" ? self.triggers.mgmt_ip : "0.0.0.0"
    user        = "admin"
    private_key = self.triggers.count == "1" ? file(self.triggers.mgmt_key_path) : ""
    timeout     = self.triggers.count == "1" ? "30s" : "1s"
  }

  provisioner "local-exec" { // lock database override
    when       = destroy
    on_failure = continue
    command    = self.triggers.count == "1" ? format(self.triggers.lock_database_override_local_script, self.triggers.mgmt_key_path, self.triggers.mgmt_ip) : ":"
  }

  provisioner "local-exec" { // change shell to bash
    when       = destroy
    on_failure = continue
    command    = self.triggers.count == "1" ? format(self.triggers.change_shell_to_bash_local_script, self.triggers.mgmt_key_path, self.triggers.mgmt_ip) : ":"
  }

  provisioner "file" { // remove GW from MGMT
    when        = destroy
    on_failure  = continue
    source      = self.triggers.remove_gw_from_mgmt_script_path
    destination = "/tmp/remove_gw_from_mgmt_script.sh"
  }

  provisioner "remote-exec" {
    when       = destroy
    on_failure = continue
    inline = [
      "set -o errexit", // returns non-zero on failure of any one of the commands
      "chmod +x /tmp/remove_gw_from_mgmt_script.sh",
      "/tmp/remove_gw_from_mgmt_script.sh ${self.triggers.remove_gw_from_mgmt_script_args}",
      "rm /tmp/remove_gw_from_mgmt_script.sh"
    ]
  }

  provisioner "file" { // remove NAT rules
    when        = destroy
    on_failure  = continue
    source      = self.triggers.remove_nat_rules_script_path
    destination = "/tmp/remove_nat_rules.sh"
  }

  provisioner "remote-exec" {
    when       = destroy
    on_failure = continue
    inline = [
      "chmod +x /tmp/remove_nat_rules.sh",
      "/tmp/remove_nat_rules.sh ${self.triggers.remove_nat_rules_script_args}",
      "rm /tmp/remove_nat_rules.sh"
    ]
  }
}
