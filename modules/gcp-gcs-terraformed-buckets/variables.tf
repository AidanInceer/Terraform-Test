variable "project" {
  default = "ai-data-warehousing"
}

variable "region" {
  default = "europe-west2"
}

variable "zone" {
  default = "europe-west2-a"
}

variable "bucket_default_label" {
  default = "terraform-bucket"
}

variable "retention_period" {
  default = 2592000
}