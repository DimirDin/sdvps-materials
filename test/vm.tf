data "yandex_compute_image" "gitlab" {
  family = "gitlab"   # последняя LTS-версия из Marketplace
}

resource "yandex_compute_instance" "gitlab" {
  name        = "gitlab"
  zone        = var.zone
  platform_id = "standard-v3"

  resources {
    cores         = 4
    memory        = 8
    core_fraction = 100
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.gitlab.id
      size     = 30
      type     = "network-ssd"
    }
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.gitlab.id
    nat                = true
    security_group_ids = [yandex_vpc_security_group.gitlab.id]
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}