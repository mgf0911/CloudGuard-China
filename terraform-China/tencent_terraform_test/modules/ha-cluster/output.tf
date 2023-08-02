output "route_table_id" {
  value = tencentcloud_route_table.gw_route_table.id
}
/*
output "public_ip" {
  value = tencentcloud_instance.gw.public_ip
}

output "frontend_private_ip" {
  value = data.tencentcloud_instances.gw_info.instance_list[0].private_ip
}
*/
