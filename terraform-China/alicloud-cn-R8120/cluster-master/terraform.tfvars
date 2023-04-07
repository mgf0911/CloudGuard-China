//PLEASE refer to README.md for accepted values FOR THE VARIABLES BELOW

// --- VPC Network Configuration ---
vpc_cidr = "10.88.0.0/16"
cluster_vswitchs_map = {
  "cn-shanghai-m" = 1
}
management_vswitchs_map = {
  "cn-shanghai-m" = 2
}
private_vswitchs_map = {
  "cn-shanghai-m" = 3
}
vswitchs_bit_length = 8

// --- ECS Instance Configuration ---
gateway_name = "G7-China-Cluster-tf"
gateway_instance_type = "ecs.g7ne.large"
key_name = "SGM-CP-Key"
allocate_and_associate_eip = false
volume_size = 100
ram_role_name = "CheckPoint-HA"
instance_tags = {
  key1 = "value1"
  key2 = "value2"
}

// --- Check Point Settings ---
gateway_version = "R8120-BYOL"
admin_shell = "/bin/bash"
gateway_SICKey = "12345678"
gateway_password_hash = "$6$gfDlSm6XsewuNXlB$Wl85plVYvctRjDRo1ILBqoR3zALNEj2SionJxziwdG5qAL7kkS62pNKCr3Mbrz2CmVdjOD9srDHh9gyU6eeD2/"

// --- Advanced Settings ---
//management_ip_address = "1.2.3.4"
resources_tag_name = "tag-name"
gateway_hostname = "gw-hostname"
allow_upload_download = true
gateway_bootstrap_script = ""
primary_ntp = ""
secondary_ntp = ""
