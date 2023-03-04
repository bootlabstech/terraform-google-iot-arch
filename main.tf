# Creating Pub/Sub topic for Cloud Functions trigger
resource "google_pubsub_topic" "topic" {
  name    = var.topic_name
  project = var.project
}

# Creating bucket to store message from pub/sub
resource "google_storage_bucket" "main" {
  name                        = var.bucket_name
  project                     = var.project
  location                    = var.location
  uniform_bucket_level_access = true
  depends_on = [
    google_pubsub_topic.topic
  ]


}
# Creating Cloud Functions triggered by Pub/Sub
resource "google_cloudfunctions_function" "function" {
  name    = var.function_name
  runtime = var.runtime
  project = var.project
  region  = var.region

  available_memory_mb           = var.available_memory_mb
  source_repository             = var.source_repository
  # source_archive_bucket         = var.source_archive_bucket # interpolation referencing
  # source_archive_object         = var.source_archive_object # interpolation referencing
  entry_point                   = var.entry_point
  ingress_settings              = var.ingress_settings
  vpc_connector_egress_settings = var.vpc_connector_egress_settings
  vpc_connector                 = var.vpc_connector

  event_trigger {
    event_type = "google.pubsub.topic.publish"
    resource   = google_pubsub_topic.topic.name # interpolation referencing
  }
  depends_on = [
    google_firestore_document.main
  ]
}
# Creating Firestore Database
resource "google_firestore_document" "main" {
  project     = var.project
  collection  = var.collection
  document_id = var.document_id
  fields      = var.fields
  depends_on = [
    google_storage_bucket.main
  ]
}