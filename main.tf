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

terraform {
  backend "gcs" {
    bucket = "f8ccfab9a895324b-bucket-tfstate"
    prefix = "terraform/state"
  }
}

module "gcp-gcs-buckets" {
  source = "./modules/gcp-gcs-terraformed-buckets"
}

module "gcp-bigquery" {
  source = "./modules/gcp-bigquery"
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


