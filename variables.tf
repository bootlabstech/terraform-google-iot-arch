variable "project" {
  description = "The Project ID where the resources will be created in"
  type        = string

}

# Pub/sub
variable "topic_name" {
  description = "Name of the Topic"
  type        = string

}

# Bucket 
variable "bucket_name" {
  description = "NAme of the Bucket"
  type        = string

}
variable "location" {
  description = "Location where the resources should be created in"
  type        = string

}

# Cloud Functions
variable "function_name" {
  description = "function name"
  type        = string
}

variable "runtime" {
  description = " The runtime in which the function is going to run. Eg. nodejs16 python39 dotnet3 go116 java11 ruby30 php74" 
  type        = string
}
variable "available_memory_mb" {
  description = "Memory (in MB), available to the function. Default value is 256. Possible values include 128, 256, 512, 1024, etc."
  type        = string
}
variable "entry_point" {
  description = "Name of the function that will be executed when the Google Cloud Function is triggered."
  type        = string
}
variable "event_type" {
  description = "The type of event to observe. For example: google.storage.object.finalize"
  type        = string
}
variable "region" {
  description = "value"
  type        = string

}
variable "ingress_settings" {
  description = "String value that controls what traffic can reach the function. Allowed values are ALLOW_ALL, ALLOW_INTERNAL_AND_GCLB and ALLOW_INTERNAL_ONLY"
  type        = string
}
variable "vpc_connector_egress_settings" {
  description = " The egress settings for the connector, controlling what traffic is diverted through it. Allowed values are ALL_TRAFFIC and PRIVATE_RANGES_ONLY. Defaults to PRIVATE_RANGES_ONLY"
  type        = string

}
variable "vpc_connector" {
  description = "The VPC Network Connector that this cloud function can connect to. It should be set up as fully-qualified URI. The format of this field is projects/*/locations/*/connectors/*."
  type        = string

}
# variable "source_archive_bucket" {
#   description = "value"
#   type        = string

# }
# variable "source_archive_object" {
#   description = "value"
#   type        = string

# }
variable "source_repository" {
  description = "value"
  type        = string

}

# Firestore
variable "collection" {
  description = "The collection ID, relative to database. For example: chatrooms or chatrooms/my-document/private-messages."
  type        = string

}
variable "document_id" {
  description = "The client-assigned document ID to use for this document during creation."
  type        = string

}
variable "fields" {
  description = "The document's fields formated as a json string."
  type        = string

}
