locals {
  gw_versions = [
    //"R8110-PAYG-NGTP",
   // "R8110-PAYG-NGTX",
    "R8110-BYOL"
  ]
  mgmt_versions = [
    //"R8110-PAYG",
    "R8110-BYOL"
  ]
}

locals {
  gw_values = var.chkp_type == "gateway" ? local.gw_versions : []
  mgmt_values = var.chkp_type == "management" ? local.mgmt_versions : []
 // standalone_values = var.chkp_type == "standalone" ? local.standalone_versions : []
  allowed_values = coalescelist(local.gw_values, local.mgmt_values)//, local.standalone_values)
  is_allowed_type = index(local.allowed_values, var.version_license)
}