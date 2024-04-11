resource "google_bigquery_dataset" "datasets" {
  for_each = { for idx, name in var.dataset_names : name => idx }

  dataset_id                 = "${each.key}_layer"
  friendly_name              = each.key
  description                = var.dataset_descriptions[each.key]
  location                   = var.region
  delete_contents_on_destroy = true

}
