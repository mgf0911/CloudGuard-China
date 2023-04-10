//PLEASE refer to README.md for accepted values FOR THE VARIABLES BELOW

// --- VPC Network Configuration ---
vpc_id = "vpc-uf6hvz422gmjuocdss4cz"
cluster_vswitch_id = "vsw-uf6vbsv9305fk1v8jjqvn"
mgmt_vswitch_id = "vsw-uf609ic16psc10v86qf8q"
private_vswitch_id = "vsw-uf67ur79a2xyulb6bmhhz"
private_route_table = "vtb-uf6hj34fgrq07b2f6bb81"

// --- ECS Instance Configuration ---
gateway_name = "Check-Point-Cluster-tf"
gateway_instance_type = "ecs.g7ne.large"
key_name = "SGM-CP-Key"
allocate_and_associate_eip = false
volume_size = 100
ram_role_name = ""
instance_tags = {
  key1 = "value1"
  key2 = "value2"
}

// --- Check Point Settings ---
gateway_version = "R8110-BYOL"
admin_shell = "/bin/bash"
gateway_SICKey = "12345678"
gateway_password_hash = "$6$gfDlSm6XsewuNXlB$Wl85plVYvctRjDRo1ILBqoR3zALNEj2SionJxziwdG5qAL7kkS62pNKCr3Mbrz2CmVdjOD9srDHh9gyU6eeD2/"

// --- Advanced Settings ---
//management_ip_address = "10.0.10.207"
resources_tag_name = "eip"
gateway_hostname = "gw"
allow_upload_download = true
gateway_bootstrap_script = ""
primary_ntp = ""
secondary_ntp = ""
