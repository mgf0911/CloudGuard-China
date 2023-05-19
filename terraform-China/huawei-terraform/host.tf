resource "huaweicloud_compute_instance" "internal_host" {
  count = local.mgmt_only ? 0 : var.internal_count
  name = format("${var.project}-internal-host%s", var.internal_count > 1 ? "-${count.index + 1}" : "")
  image_id = local.ubuntu_image
  flavor_id = var.internal_type
  security_group_ids = [huaweicloud_networking_secgroup.secgroup.id]
  key_pair = var.key_name
  agency_name = huaweicloud_identity_agency.agency.name

  network {
    uuid = huaweicloud_vpc_subnet.backend_subnet[0].id
  }
}

resource "huaweicloud_compute_instance" "external_host" {
  count = local.mgmt_only ? 0 : var.external_count
  name = format("${var.project}-external-host%s", var.external_count > 1 ? "-${count.index + 1}" : "")
  image_id = local.ubuntu_image
  flavor_id = var.external_type
  security_group_ids = [huaweicloud_networking_secgroup.secgroup.id]
  key_pair = var.key_name
  agency_name = huaweicloud_identity_agency.agency.name

  network {
    uuid = huaweicloud_vpc_subnet.external_frontend_subnet[0].id
  }
}

resource "huaweicloud_vpc_eip" "external_host_eip" {
  count = local.mgmt_only ? 0 : var.external_count
  publicip {
    type = "5_sbgp"
  }

  bandwidth {
    share_type = "PER"
    name = "external_host_bandwidth"
    size = 5
    charge_mode = "bandwidth"
  }
}

resource "huaweicloud_compute_eip_associate" "external_host_associated" {
  count = local.mgmt_only ? 0 : var.external_count
  public_ip = huaweicloud_vpc_eip.external_host_eip[count.index].address
  instance_id = huaweicloud_compute_instance.external_host[count.index].id
}

