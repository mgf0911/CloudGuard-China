/*
data "tencentcloud_availability_zones_by_product" "vpc" {
  product = "vpc"
}
*/

// cvm is cloud virtual machine
data "tencentcloud_availability_zones_by_product" "cvm" {
  product = "cvm"
}
