resource "huaweicloud_networking_secgroup" "secgroup" {
  name = "${var.project}-all-ports-open"
}

resource "huaweicloud_networking_secgroup_rule" "ingress_rule" {
  direction = "ingress"
  ethertype = "IPv4"
  security_group_id = huaweicloud_networking_secgroup.secgroup.id
  action = "allow"
  remote_ip_prefix = "0.0.0.0/0"
}

