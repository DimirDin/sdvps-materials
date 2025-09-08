resource "yandex_vpc_network" "gitlab" {
  name = "gitlab-net"
}

resource "yandex_vpc_subnet" "gitlab" {
  name           = "gitlab-subnet"
  zone           = var.zone
  network_id     = yandex_vpc_network.gitlab.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

resource "yandex_vpc_security_group" "gitlab" {
  name       = "gitlab-sg"
  network_id = yandex_vpc_network.gitlab.id

  ingress {
    protocol       = "TCP"
    description    = "HTTP"
    port           = 80
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    protocol       = "TCP"
    description    = "HTTPS"
    port           = 443
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    protocol       = "TCP"
    description    = "SSH"
    port           = 22
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    protocol       = "ANY"
    from_port      = 0
    to_port        = 65535
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
}