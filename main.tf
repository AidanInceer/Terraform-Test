terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  project     = var.project
  region      = var.region
  zone        = var.zone
}

resource "google_compute_network" "vpc_network" {
  name = var.vpc_name
}


resource "google_storage_bucket" "example-bucket-" {
  name          = "example-bucket"
  location      = var.region
  force_destroy = true
  labels = {
    "bucket" = "terraform-bucket"
  }
  retention_policy {
    retention_period = 2592000
  }
}
