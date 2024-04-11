resource "google_storage_bucket" "example-bucket-ai-terraform-test-2" {
  name          = "example-bucket-ai-terraform-test-2"
  location      = var.region
  force_destroy = true
  labels = {
    "bucket" = var.bucket_default_label
  }
  retention_policy {
    retention_period = var.retention_period
  }
}


resource "google_storage_bucket" "example-bucket-ai-terraform-test-3" {
  name          = "example-bucket-ai-terraform-test-2"
  location      = var.region
  force_destroy = true
  labels = {
    "bucket" = var.bucket_default_label
  }
  retention_policy {
    retention_period = var.retention_period
  }
}
