terraform {
  required_version = ">= 1.3"
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = ">= 0.85"
    }
  }
}

provider "yandex" {
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  token     = var.token
  zone      = var.zone
}