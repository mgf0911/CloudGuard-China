module "add-host" {
  source             = "./modules/add-host"
  count              = var.deployment_type == "add-host" ? 1 : 0
  mgmt-ip         = "mgmt-ip"
  api-username    = "api-username"
  api-password    = "api-password"
  provider-context = "provider-context"
  new-policy-pkg   = "new-policy-pkg"
}

module "add-network" {
  source             = "./modules/add-network"
  count              = var.deployment_type == "add-network" ? 1 : 0
  mgmt-ip         = "mgmt-ip"
  api-username    = "api-username"
  api-password    = "api-password"
  provider-context = "provider-context"
  new-policy-pkg   = "new-policy-pkg"
}
module "add-services-rules" {
  source             = "./modules/add-services-rules"
  count              = var.deployment_type == "add-services-rules" ? 1 : 0
  mgmt-ip         = "mgmt-ip"
  api-username    = "api-username"
  api-password    = "api-password"
  provider-context = "provider-context"
  new-policy-pkg   = "new-policy-pkg"
}
