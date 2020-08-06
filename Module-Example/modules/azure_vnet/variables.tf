variable "enabled_for_disk_encryption" {
  description = "The Prefix used for all resources in this example"
  default = "false"
}


variable "object_id" {
  description = "Object Id of Web App or Function App"
  default = ""
}

variable "resource_group_name" {
  description = "resource_group_name"
  default = ""
}

variable "location" {
  description = "location"
  default = "westus"
}
