resource "huaweicloud_vpc" "internal_vpc" {
  name = "${var.project}-internal-vpc"
  cidr = "10.0.0.0/16"
}

resource "huaweicloud_vpc" "external_vpc" {
  count = (local.mgmt_only || var.external_count == 0) ? 0 : 1
  name = "${var.project}-external-vpc"
  cidr = "10.1.0.0/16"
}
