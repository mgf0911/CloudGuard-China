resource "tencentcloud_security_group" "secgroup" {
  name = "${var.project}-all-ports-open"
}

resource "tencentcloud_security_group_rule" "ingress_rule" {
  security_group_id = tencentcloud_security_group.secgroup.id
  type              = "ingress"
  policy            = "ACCEPT"
  cidr_ip           = "0.0.0.0/0"
}

resource "tencentcloud_security_group_rule" "egress_rule" {
  security_group_id = tencentcloud_security_group.secgroup.id
  type              = "egress"
  policy            = "ACCEPT"
  cidr_ip           = "0.0.0.0/0"
}
