variable "project" {
  type    = string
  default = "terraform"
}

variable "key_name" {
  type    = string
  default = "skey-03a6h44d"
}

variable "key_path" {
  type    = string
  default = ""
}

variable "gw_deployment_type" {
  type    = string
  default = "Cluster"
//  default = "Single"
}

variable "gw_type" {
  type    = string
//  default = "S5.2XLARGE16"
  default = "S5.MEDIUM8"
}

variable "gw_version" { // CP version
  type    = string
  default = "R81.10"
}

variable "gw_image" {
  type = string
  //default = "img-5o0xt623"
  //default = "img-6o2un6ub"
  //default = "img-m10sd50v"
  //default = "img-lca2v0xz"
  default = "img-c8zqftet"
}

variable "gw_password" {
  type    = string
  default = "test123"
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
  default = "S5.MEDIUM8"
}

variable "mgmt_version" { // CP version
  type    = string
  default = "R81.10"
}

variable "mgmt_image" {
  type = string
  //default = "img-hdrbdomn"
  //default = "img-0zdbjmzt"
  //default = "img-gj64fkbl"
  //default = "img-ez7cnru1"
  default = "img-5o99hx2l"
}

variable "mgmt_password" {
  type    = string
  default = "test123"
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
  default = "S5.MEDIUM8"
}

variable "internal_count" {
  type    = number
  default = 0
}

variable "external_type" {
  type    = string
  default = "S5.MEDIUM8"
}

variable "external_count" {
  type    = number
  default = 0
}