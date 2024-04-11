terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}

resource "google_compute_network" "vpc_network" {
  name = var.vpc_name
}


resource "google_storage_bucket" "example-bucket-ai-terraform-test" {
  name          = "example-bucket-ai-terraform-test"
  location      = var.region
  force_destroy = true
  labels = {
    "bucket" = "terraform-bucket"
  }
  retention_policy {
    retention_period = 2592000
  }
}

resource "random_id" "bucket_prefix" {
  byte_length = 8
}

resource "google_storage_bucket" "default" {
  name          = "${random_id.bucket_prefix.hex}-bucket-tfstate"
  force_destroy = false
  location      = var.region
  storage_class = "STANDARD"
  versioning {
    enabled = true
  }
}

terraform {
  backend "gcs" {
    bucket = "f8ccfab9a895324b-bucket-tfstate"
    prefix = "terraform/state"
  }
}
