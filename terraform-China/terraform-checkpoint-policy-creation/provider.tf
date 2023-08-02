terraform {
  required_providers {
    checkpoint = {
      source  = "checkpointsw/checkpoint"
      version = "~> 1.6.0"
    }
  }
}

# Configure the Check Point Provider for GAIA API
provider "checkpoint" {
  server   = var.mgmt-ip
  username = var.api-username
  password = var.api-password
  context  = var.provider-context
}

