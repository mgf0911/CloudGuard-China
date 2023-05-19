module "gw" {
  source              = "./modules/single-gw"
  count               = var.gw_deployment_type == "Single" ? 1 : 0
  gw_name             = "${var.project}-gateway"
  image_id            = var.gw_image
  flavor_id           = var.gw_type
  security_group_ids  = huaweicloud_networking_secgroup.secgroup.id
  key_pair            = var.key_name
  agency_name         = huaweicloud_identity_agency.agency.name
  frontend_subnet_id  = huaweicloud_vpc_subnet.frontend_subnet.id
  backend_subnet_id   = huaweicloud_vpc_subnet.backend_subnet[0].id
  vpc_id              = huaweicloud_vpc.internal_vpc.id
}

module "cluster" {
  source               = "./modules/ha-cluster"
  count                = var.gw_deployment_type == "Cluster" ? 1 : 0
  cluster_name         = "${var.project}-cluster"
  image_id             = var.gw_image
  flavor_id            = var.gw_type
  security_group_ids   = huaweicloud_networking_secgroup.secgroup.id
  key_pair             = var.key_name
  agency_name          = huaweicloud_identity_agency.agency.name
  frontend_subnet_id   = huaweicloud_vpc_subnet.frontend_subnet.id
  backend_subnet_id    = huaweicloud_vpc_subnet.backend_subnet[0].id
  vpc_id               = huaweicloud_vpc.internal_vpc.id
}

