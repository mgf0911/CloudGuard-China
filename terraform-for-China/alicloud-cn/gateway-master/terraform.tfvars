//PLEASE refer to README.md for accepted values FOR THE VARIABLES BELOW

// --- VPC Network Configuration ---
vpc_cidr = "10.100.0.0/16"
public_vswitchs_map = {
  "cn-shanghai-m" = 1
}
private_vswitchs_map = {
  "cn-shanghai-m" = 2
}
vswitchs_bit_length = 8

// --- ECS Instance Configuration ---
gateway_name = "Check-Point-Gateway-tf"
gateway_instance_type = "ecs.g7ne.xlarge"
key_name = "SGM-CP-Key"
allocate_and_associate_eip = true
volume_size = 100
ram_role_name = ""
instance_tags = {
  key1 = "value1"
  key2 = "value2"
}

// --- Check Point Settings ---
gateway_version = "R81-BYOL"
admin_shell = "/bin/bash"
gateway_SICKey = "12345678"
gateway_password_hash = "$6$gfDlSm6XsewuNXlB$Wl85plVYvctRjDRo1ILBqoR3zALNEj2SionJxziwdG5qAL7kkS62pNKCr3Mbrz2CmVdjOD9srDHh9gyU6eeD2/"

// --- Advanced Settings ---
resources_tag_name = "tag-name"
gateway_hostname = "gw-hostname"
allow_upload_download = true
gateway_bootstrap_script = "echo 'this is bootstrap script' > /home/admin/testfile.txt"
primary_ntp = ""
secondary_ntp = ""
