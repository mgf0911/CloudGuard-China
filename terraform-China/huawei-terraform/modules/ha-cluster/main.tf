resource "huaweicloud_compute_instance" "cluster" {
  count = 2
  name = "${var.cluster_name}-${count.index + 1}"
  image_id = var.image_id
  flavor_id = var.flavor_id
  security_group_ids = [var.security_group_ids]
  key_pair = var.key_pair
  agency_name = var.agency_name

  network {
    uuid = var.frontend_subnet_id
    source_dest_check = false
  }

  network {
    uuid = var.backend_subnet_id
    source_dest_check = false
  }
}

resource "huaweicloud_vpc_eip" "cluster_members_eip" {
  count = 2
  publicip {
    type = "5_sbgp"
  }

  bandwidth {
    share_type = "PER"
    name = "member_bandwidth-${count.index + 1}"
    size = 5
    charge_mode = "bandwidth"
  }
}

resource "huaweicloud_compute_eip_associate" "member_associated" {
  count = 2
  public_ip = huaweicloud_vpc_eip.cluster_members_eip[count.index].address
  instance_id = huaweicloud_compute_instance.cluster[count.index].id
}

resource "huaweicloud_networking_vip" "cluster_frontend_vip" {
  network_id = var.frontend_subnet_id
}

resource "huaweicloud_networking_vip" "cluster_backend_vip" {
  network_id = var.backend_subnet_id
}

resource "huaweicloud_networking_vip_associate" "frontend_vip_attach" {
  vip_id = huaweicloud_networking_vip.cluster_frontend_vip.id
  port_ids = [
    huaweicloud_compute_instance.cluster[0].network[0].port
  ]
}

resource "huaweicloud_networking_vip_associate" "backend_vip_attach" {
  vip_id = huaweicloud_networking_vip.cluster_backend_vip.id
  port_ids = [
    huaweicloud_compute_instance.cluster[0].network[1].port
  ]
}

resource "huaweicloud_vpc_eip" "cluster_eip" {
  publicip {
    type = "5_sbgp"
  }

  bandwidth {
    share_type = "PER"
    name = "cluster_bandwidth"
    size = 5
    charge_mode = "bandwidth"
  }
}

resource "huaweicloud_vpc_eip_associate" "cluster_associated" {
  public_ip = huaweicloud_vpc_eip.cluster_eip.address
  port_id = huaweicloud_networking_vip.cluster_frontend_vip.id
}

resource "huaweicloud_vpc_route" "cluster_route" {
  vpc_id = var.vpc_id
  destination = "0.0.0.0/0"
  type = "vip"
  nexthop = huaweicloud_networking_vip.cluster_backend_vip.ip_address
}

