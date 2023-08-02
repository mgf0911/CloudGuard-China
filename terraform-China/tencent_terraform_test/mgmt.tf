resource "tencentcloud_instance" "mgmt" {
  count             = 1
  instance_name     = "${var.project}-mgmt"
  availability_zone = data.tencentcloud_availability_zones_by_product.cvm.zones.0.name
  image_id          = var.mgmt_image
  instance_type     = var.mgmt_type
  //key_ids = [var.key_name]
  orderly_security_groups = [tencentcloud_security_group.secgroup.id]

  stopped_mode     = "STOP_CHARGING"
  system_disk_type = "CLOUD_PREMIUM"
  system_disk_size = 100

  allocate_public_ip         = true
  internet_charge_type       = "TRAFFIC_POSTPAID_BY_HOUR"
  internet_max_bandwidth_out = 5

  subnet_id = tencentcloud_subnet.internal_frontend_subnet.id
  vpc_id    = tencentcloud_vpc.internal_vpc.id

  // Sets password to test123
  user_data_raw = <<EOF
#!/bin/bash
clish -c 'set user admin password-hash $1$TjtLKT6L$kkhq2lT0yL4gvrcTUt.bv0' -s
clish -c 'set user admin shell "/bin/bash"' -s
EOF
}
