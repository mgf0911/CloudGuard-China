resource "huaweicloud_compute_instance" "mgmt" {
  count = local.mgmt_needs_deployment ? 1 : 0
  name = "${var.project}-mgmt"
  image_id = var.mgmt_image
  flavor_id = var.mgmt_type
  security_group_ids = [huaweicloud_networking_secgroup.secgroup.id]
  key_pair = var.key_name
  agency_name = huaweicloud_identity_agency.agency.name
  
  network {
    uuid = huaweicloud_vpc_subnet.frontend_subnet.id
  }
}

resource "huaweicloud_vpc_eip" "mgmt_eip" {
  count = local.mgmt_needs_deployment ? 1 : 0
  publicip {
    type = "5_sbgp"
  }

  bandwidth {
    share_type = "PER"
    name = "mgmt_bandwidth"
    size = 5
    charge_mode = "bandwidth"
  }
}

resource "huaweicloud_compute_eip_associate" "mgmt_associated" {
  count = local.mgmt_needs_deployment ? 1 : 0
  public_ip = huaweicloud_vpc_eip.mgmt_eip[0].address
  instance_id = huaweicloud_compute_instance.mgmt[0].id
}
  
