resource "google_bigquery_dataset" "bronze_layer" {
  dataset_id                 = "bronze_layer"
  friendly_name              = "bronze"
  description                = "dataset for raw data to be ingested"
  location                   = var.region
  delete_contents_on_destroy = true

}

resource "google_bigquery_dataset" "silver_layer" {
  dataset_id                 = "silver_layer"
  friendly_name              = "silver"
  description                = "Filtered cleaned and augmenteded data"
  location                   = var.region
  delete_contents_on_destroy = true

}

resource "google_bigquery_dataset" "gold_layer" {
  dataset_id                 = "gold_layer"
  friendly_name              = "gold"
  description                = "business level aggregations"
  location                   = var.region
  delete_contents_on_destroy = true

}
