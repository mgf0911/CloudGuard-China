resource "tencentcloud_instance" "internal_host" {
  count                   = 1
  instance_name           = "${var.project}-internal-host"
  availability_zone       = data.tencentcloud_availability_zones_by_product.cvm.zones.0.name
  image_id                = local.ubuntu_image
  instance_type           = var.internal_type
  key_ids                 = [var.key_name]
  orderly_security_groups = [tencentcloud_security_group.secgroup.id]

  stopped_mode     = "STOP_CHARGING"
  system_disk_type = "CLOUD_PREMIUM"
  system_disk_size = 50

  subnet_id = tencentcloud_subnet.internal_backend_subnet.id
  vpc_id    = tencentcloud_vpc.internal_vpc.id
}

data "tencentcloud_instances" "internal_host_info" {
  instance_id = tencentcloud_instance.internal_host[0].id
}
