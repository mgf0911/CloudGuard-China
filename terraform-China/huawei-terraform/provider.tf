terraform {
  required_providers {
    huaweicloud = {
      source = "huaweicloud/huaweicloud"
      version = ">= 1.20.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0.3"
    }
    htpasswd = {
      source  = "loafoe/htpasswd"
      version = "~> 1.0.4"
    }
  }
  required_version = ">= 1.3.0"
}

provider "huaweicloud" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}


