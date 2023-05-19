output "cluster_public_ip" {
  value = huaweicloud_vpc_eip.cluster_eip.address
}

output "cluster_member_1_public_ip" {
  value = huaweicloud_vpc_eip.cluster_members_eip[0].address
}

output "cluster_member_2_public_ip" {
  value = huaweicloud_vpc_eip.cluster_members_eip[1].address
}

output "cluster_frontend_ip" {
  value = huaweicloud_networking_vip.cluster_frontend_vip.ip_address
}

output "cluster_member_1_frontend_ip" {
  value = huaweicloud_compute_instance.cluster[0].network[0].fixed_ip_v4
}

output "cluster_member_2_frontend_ip" {
  value = huaweicloud_compute_instance.cluster[1].network[0].fixed_ip_v4
}

output "cluster_backend_ip" {
  value = huaweicloud_networking_vip.cluster_backend_vip.ip_address
}

output "cluster_member_1_backend_ip" {
  value = huaweicloud_compute_instance.cluster[0].network[1].fixed_ip_v4
}

output "cluster_member_2_backend_ip" {
  value = huaweicloud_compute_instance.cluster[1].network[1].fixed_ip_v4
}
