resource "tencentcloud_instance" "gw" {
  instance_name = var.gw_name
  availability_zone = var.availability_zone
  image_id = var.image_id
  instance_type = var.instance_type
  //key_ids = [var.key_name]
  orderly_security_groups = [var.security_group]
  
  stopped_mode = "STOP_CHARGING"
  system_disk_type = "CLOUD_PREMIUM"
  system_disk_size = 100

  allocate_public_ip = true
  internet_charge_type = "TRAFFIC_POSTPAID_BY_HOUR"
  internet_max_bandwidth_out = 5
  
  subnet_id = var.frontend_subnet_id
  vpc_id = var.vpc_id

  // Sets password to test123
  user_data_raw = <<EOF
#!/bin/bash
clish -c 'set user admin password-hash $1$TjtLKT6L$kkhq2lT0yL4gvrcTUt.bv0' -s
clish -c 'set user admin shell "/bin/bash"' -s
EOF
}

resource "tencentcloud_eni" "frontend" {
  name = "${var.project}-frontend-eni"
  vpc_id = var.vpc_id
  subnet_id = var.frontend_subnet_id
  ipv4_count = 2
}

resource "tencentcloud_eni_attachment" "gw_eni_attach1" {
  depends_on = [
    tencentcloud_eni.frontend,
    tencentcloud_instance.gw
  ]
  eni_id = tencentcloud_eni.frontend.id
  instance_id = tencentcloud_instance.gw.id
}

resource "tencentcloud_eni" "backend" {
  name = "${var.project}-backend-eni"
  vpc_id = var.vpc_id
  subnet_id = var.backend_subnet_id
  ipv4_count = 2
}

resource "tencentcloud_eni_attachment" "gw_eni_attach2" {
  depends_on = [
    tencentcloud_eni.backend,
    tencentcloud_instance.gw,
    tencentcloud_eni_attachment.gw_eni_attach1,
  ]
  eni_id = tencentcloud_eni.backend.id
  instance_id = tencentcloud_instance.gw.id
}

resource "tencentcloud_route_table" "gw_route_table" {
  name = "${var.project}-route-table"
  vpc_id = var.vpc_id
}

resource "tencentcloud_route_entry" "route_entry" {
  depends_on = [
    tencentcloud_eni.backend,
    tencentcloud_instance.gw,
    tencentcloud_eni_attachment.gw_eni_attach2
  ]
  vpc_id         = var.vpc_id
  route_table_id = tencentcloud_route_table.gw_route_table.id
  cidr_block     = "0.0.0.0/0"
  next_type      = "instance"
  next_hub       = tencentcloud_eni.backend.ipv4_info[0].ip
}

resource "tencentcloud_eip" "public_ips" {
  count                = 2
  name                 = "public-ip-${count.index + 1}"
  internet_charge_type = "TRAFFIC_POSTPAID_BY_HOUR"
  internet_max_bandwidth_out = 5
  type                 = "EIP"
}

resource "tencentcloud_eip_association" "public_ip_attachment1" {
   depends_on = [
    tencentcloud_eni.frontend,
    tencentcloud_instance.gw,
    tencentcloud_eni_attachment.gw_eni_attach1,
    tencentcloud_eip.public_ips
  ]
  eip_id               = tencentcloud_eip.public_ips[0].id
  network_interface_id = tencentcloud_eni.frontend.id
  private_ip           = tencentcloud_eni.frontend.ipv4_info[0].ip
}

resource "tencentcloud_eip_association" "public_ip_attachment2" {
  depends_on = [
    tencentcloud_eni.frontend,
    tencentcloud_instance.gw,
    tencentcloud_eni_attachment.gw_eni_attach1,
    tencentcloud_eip.public_ips,
    tencentcloud_eip_association.public_ip_attachment1
  ]
  eip_id               = tencentcloud_eip.public_ips[1].id
  network_interface_id = tencentcloud_eni.frontend.id
  private_ip           = tencentcloud_eni.frontend.ipv4_info[1].ip
}

data "tencentcloud_instances" "gw_info" {
  instance_id = tencentcloud_instance.gw.id
}
/*
resource "tencentcloud_route_table_entry" "route_table_entry" {
  depends_on = [
    tencentcloud_eni.backend,
    tencentcloud_instance.gw,
    tencentcloud_eni_attachment.gw_eni_attachment
  ]
  destination_cidr_block = "0.0.0.0/0"
  next_hub = tencentcloud_eni.backend.ipv4_info[0].ip
  next_type = "CVM"
  route_table_id = tencentcloud_route_table.gw_route_table.id
  //route_table_id = tencentcloud_subnet.internal_backend_subnet.route_table_id
}
*/

