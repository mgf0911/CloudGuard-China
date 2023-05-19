variable "region" {
  type = string
}

variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}

variable "project" {
  type    = string
  default = "huawei"
}

variable "key_name" {
  type    = string
  default = ""
}

variable "key_path" {
  type    = string
  default = ""
}

variable "gw_deployment_type" {
  type    = string
  default = "None"
}

variable "gw_type" {
  type    = string
  default = "s6.large.4"
}

variable "gw_version" { // CP version
  type    = string
  default = "R81.10"
}

variable "gw_image" {
  type    = string
  default = ""
}

variable "gw_password" {
  type    = string
  default = ""
}

variable "gw_user_data_filepath" {
  type    = string
  default = ""
}

variable "mgmt_deployment_type" {
  type    = string
  default = "None"
}

variable "mgmt_import" {
  type    = bool
  default = false
}

variable "mgmt_type" {
  type    = string
  default = "s6.large.4"
}

variable "mgmt_version" { // CP version
  type    = string
  default = "R81.10"
}

variable "mgmt_image" {
  type    = string
  default = ""
}

variable "mgmt_password" {
  type    = string
  default = ""
}

variable "mgmt_user_data_filepath" {
  type    = string
  default = ""
}

variable "mgmt_ip" {
  type    = string
  default = ""
}

variable "mgmt_key_path" {
  type    = string
  default = ""
}

variable "mgmt_policy_name" {
  type    = string
  default = "Standard"
}

variable "mgmt_install_policy" {
  type    = bool
  default = true
}

variable "internal_type" {
  type    = string
  default = "s6.large.4"
}

variable "internal_count" {
  type    = number
  default = 0
}

variable "external_type" {
  type    = string
  default = "s6.large.4"
}

variable "external_count" {
  type    = number
  default = 0
}


