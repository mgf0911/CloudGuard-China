module "gw" {
  source             = "./modules/single-gw"
  count              = var.gw_deployment_type == "Single" ? 1 : 0
  project            = var.project
  gw_name            = "${var.project}-gateway"
  availability_zone  = data.tencentcloud_availability_zones_by_product.cvm.zones.0.name
  image_id           = var.gw_image
  instance_type      = var.gw_type
  security_group     = tencentcloud_security_group.secgroup.id
  frontend_subnet_id = tencentcloud_subnet.internal_frontend_subnet.id
  backend_subnet_id  = tencentcloud_subnet.internal_backend_subnet.id
  vpc_id             = tencentcloud_vpc.internal_vpc.id
}

module "cluster" {
  source             = "./modules/ha-cluster"
  count              = var.gw_deployment_type == "Cluster" ? 1 : 0
  project            = var.project
  gw_name            = "${var.project}-gateway"
  availability_zone  = data.tencentcloud_availability_zones_by_product.cvm.zones.0.name
  image_id           = var.gw_image
  instance_type      = var.gw_type
  security_group     = tencentcloud_security_group.secgroup.id
  frontend_subnet_id = tencentcloud_subnet.internal_frontend_subnet.id
  backend_subnet_id  = tencentcloud_subnet.internal_backend_subnet.id
  vpc_id             = tencentcloud_vpc.internal_vpc.id
}

