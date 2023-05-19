output "public_ip" {
  value = huaweicloud_vpc_eip.gw_eip.address
}

output "frontend_private_ip" {
  value = huaweicloud_compute_instance.gw.network[0].fixed_ip_v4
}

output "backend_private_ip" {
  value = huaweicloud_networking_vip.gw_backend_vip.ip_address
}
