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

variable "path_to_ssh_key" {
  type = string
  default = "~/.ssh/id_rsa.pub"
}

variable "admin_username" {
  type = string
  default = "adminuser"
}
