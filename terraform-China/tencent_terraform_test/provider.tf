terraform {
  required_providers {
    tencentcloud = {
      source  = "tencentcloudstack/tencentcloud"
      version = "~> 1.81.16"
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
}

//provider "tencentcloud" {
//  secret_id  = var.secret_id
//  secret_key = var.secret_key
//  region     = var.region
//}

