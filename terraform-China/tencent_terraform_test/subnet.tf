resource "tencentcloud_subnet" "internal_frontend_subnet" {
  name              = "${var.project}-internal_frontend"
  availability_zone = data.tencentcloud_availability_zones_by_product.cvm.zones.0.name
  cidr_block        = "10.100.0.0/24"
  vpc_id            = tencentcloud_vpc.internal_vpc.id
}

resource "tencentcloud_subnet" "internal_backend_subnet" {
  name              = "${var.project}-internal_backend"
  availability_zone = data.tencentcloud_availability_zones_by_product.cvm.zones.0.name
  cidr_block        = "10.100.1.0/24"
  vpc_id            = tencentcloud_vpc.internal_vpc.id
  //route_table_id = tencentcloud_route_table.gw_route_table.id
  //route_table_id = module.gw[0].route_table_id
  route_table_id = var.gw_deployment_type == "Single" ? module.gw[0].route_table_id : module.cluster[0].route_table_id
}
