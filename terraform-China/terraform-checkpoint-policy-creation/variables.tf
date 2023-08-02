variable "mgmt-name" {
    description = "Put the hostname of your management"
    type = string
    default = "ckpmgmt"
}
variable "mgmt-ip" {
    description = "Put the public IP address of your management"
    type = string
}
variable "api-username" {
    type = string
    sensitive = true
}
variable "api-password" {
    type = string
    sensitive = true
}
variable "provider-context" {
    description = "It can be used either web_api or gaia_api"
    default= "web_api"
}

variable "new-policy-pkg" {
    description = "Define the name of your azure policy package"
    type = string
}
