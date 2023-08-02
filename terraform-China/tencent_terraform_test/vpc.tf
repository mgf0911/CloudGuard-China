resource "tencentcloud_vpc" "internal_vpc" {
  name       = "${var.project}-internal-vpc"
  cidr_block = "10.100.0.0/16"
}
