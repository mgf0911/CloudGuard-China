//PLEASE refer to README.md for accepted values FOR THE VARIABLES BELOW

// --- VPC Network Configuration ---
vpc_id = "vpc-"
public_vswitch_id = "vsw-"
private_vswitch_id = "vsw-"
private_route_table = "vtb-"

// --- ECS Instance Configuration ---
gateway_name = "Check-Point-Gateway-tf"
gateway_instance_type = "ecs.g7ne.xlarge"
key_name = "SGM-CP-Key"
allocate_and_associate_eip = true
volume_size = 100
ram_role_name = "CPFW"
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
resources_tag_name = "tag-name"
gateway_hostname = "gw-hostname"
allow_upload_download = true
gateway_bootstrap_script = ""
primary_ntp = ""
secondary_ntp = ""
