output "single_gateway_ip" {
  value = var.gw_deployment_type == "Single" ? module.gw[0].public_ip : ""
}

output "management_ip" {
  value = local.mgmt_ip 
}

output "internal_ip" {
  value = huaweicloud_compute_instance.internal_host[*].network[0].fixed_ip_v4
}

output "external_ip" {
  value = huaweicloud_vpc_eip.external_host_eip[*].address
}

output "cluster_ip" {
  value = var.gw_deployment_type == "Cluster" ? module.cluster[0].cluster_public_ip : ""
}

output "cluster_member_a_ip" {
  value = var.gw_deployment_type == "Cluster" ? module.cluster[0].cluster_member_1_public_ip : ""
}

output "cluster_member_b_ip" {
  value = var.gw_deployment_type == "Cluster" ? module.cluster[0].cluster_member_2_public_ip : ""
}

output "single_gateway_private_ip" {
  value = var.gw_deployment_type == "Single" ? module.gw[0].frontend_private_ip : ""
}

output "cluster_private_ip" {
  value = var.gw_deployment_type == "Cluster" ? module.cluster[0].cluster_frontend_ip : ""
}

output "cluster_member_a_private_ip" {
  value = var.gw_deployment_type == "Cluster" ? module.cluster[0].cluster_member_1_frontend_ip : ""
}

output "cluster_member_b_private_ip" {
  value = var.gw_deployment_type == "Cluster" ? module.cluster[0].cluster_member_2_frontend_ip : ""
}
