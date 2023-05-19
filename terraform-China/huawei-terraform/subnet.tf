resource "huaweicloud_vpc_subnet" "frontend_subnet" {
  name = "${var.project}-internal_frontend"
  cidr = "10.0.0.0/24"
  gateway_ip = "10.0.0.1"
  vpc_id = huaweicloud_vpc.internal_vpc.id
}

resource "huaweicloud_vpc_subnet" "backend_subnet" {
  count = local.mgmt_only ? 0 : 1
  name = "${var.project}-internal_backend"
  cidr = "10.0.1.0/24"
  gateway_ip = "10.0.1.1"
  vpc_id = huaweicloud_vpc.internal_vpc.id
}

resource "huaweicloud_vpc_subnet" "external_frontend_subnet" {
  count = (local.mgmt_only || var.external_count == 0) ? 0 : 1
  name = "${var.project}-external_frontend"
  cidr = "10.1.0.0/24"
  gateway_ip = "10.1.0.1"
  vpc_id = huaweicloud_vpc.external_vpc[0].id
}
