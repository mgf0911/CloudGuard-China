resource "huaweicloud_identity_agency" "agency" {
  name = "${var.project}-agency"
  delegated_service_name = "op_svc_ecs"
  project_role {
    project = var.region
    roles = ["Tenant Administrator"]
  }
}
