resource "htpasswd_password" "gw_password" {
  password = var.gw_password
}

resource "htpasswd_password" "mgmt_password" {
  password = var.mgmt_password
}


