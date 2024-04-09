variable "project" {}

variable "credentials_file" {}

variable "region" {
  default = "europe-west2"
}

variable "zone" {
  default = "europe-west2-a"
}

variable "vpc_name" {
  default = "terraform-network"
}
variable "retention_period" {
  default = 2592000
}