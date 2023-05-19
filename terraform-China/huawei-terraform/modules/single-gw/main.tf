resource "huaweicloud_compute_instance" "gw" {
  name = var.gw_name
  image_id = var.image_id 
  flavor_id = var.flavor_id
  security_group_ids = [var.security_group_ids]
  key_pair = var.key_pair
  agency_name = var.agency_name
  
  network {
    uuid = var.frontend_subnet_id
  }

  network {
    uuid = var.backend_subnet_id
  }
 
}

resource "huaweicloud_vpc_eip" "gw_eip" {
  publicip {
    type = "5_sbgp"
  }

  bandwidth {
    share_type = "PER"
    name = "gw_bandwidth"
    size = 5
    charge_mode = "bandwidth"
  }
}

resource "huaweicloud_compute_eip_associate" "gw_associated" {
  public_ip = huaweicloud_vpc_eip.gw_eip.address
  instance_id = huaweicloud_compute_instance.gw.id
}

resource "huaweicloud_networking_vip" "gw_backend_vip" {
  network_id = var.backend_subnet_id
}

resource "huaweicloud_networking_vip_associate" "backend_vip_attach" {
  vip_id = huaweicloud_networking_vip.gw_backend_vip.id
  port_ids = [
    huaweicloud_compute_instance.gw.network[1].port
  ]
}

resource "huaweicloud_vpc_route" "vpc_route" {
  vpc_id = var.vpc_id
  destination = "0.0.0.0/0"
  type = "vip"
  nexthop = huaweicloud_networking_vip.gw_backend_vip.ip_address
}
