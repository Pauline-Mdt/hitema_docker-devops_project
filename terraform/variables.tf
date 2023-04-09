variable "prefix" {
  type = string
  default = "hitema_docker-devops"
}

variable "location" {
  type = string
  default = "France Central"
}

variable "environnement" {
  type = string
  default = "Production"
}

variable "admin_username" {
  type = string
  default = "adminuser"
}

variable "ssh_public_key" {
  type = string
}
