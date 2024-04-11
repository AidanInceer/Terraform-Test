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


variable "dataset_names" {
  description = "List of dataset names"
  type        = list(string)
  default     = ["bronze", "silver", "gold"]
}

variable "dataset_descriptions" {
  description = "Map of dataset descriptions"
  type        = map(string)
  default = {
    bronze = "Description for bronze dataset"
    silver = "Description for silver dataset"
    gold   = "Description for gold dataset"
  }
}
