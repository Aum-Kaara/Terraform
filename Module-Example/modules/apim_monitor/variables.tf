variable "api_management_name" {
  description = "The name of API Management"
  default = "api.management.name"
}

variable "rejectedeventhub_threshold" {
  description = "Backend Response Alert Threshold"
  default = 1000
}

variable "failedeventhub_threshold" {
  description = "failedeventhub_threshold"
  default = 1000
}


variable "backend_response_threshold" {
  description = "Backend Response Alert Threshold"
  default = 1000
}

variable "timedouteventhub_threshold" {
  description = "timedout eventhub threshold"
  default = 1
}
variable "droppedeventhub_threshold" {
  description = "droppedeventhub_threshold"
  default = 1
}
variable "high_cpacity_threshold" {
  description = "droppedeventhub_threshold"
  default = 1
}
variable "gatewayresponse_threshold" {
  description = "gatewayresponse_threshold"
  default = 1000
}


variable "resource_group_name" {
  description = "resource_group_name"
  default = ""
}

variable "location" {
  description = "location"
  default = "westus"
}

variable "action_group_id" {
  description = "action_group_id"
  default = "westus"
}

variable "api_management_id" {
  description = "api_management_id"
  default = ""
}

variable "app_version" {
  description = "The Azure Region in which all resources in this example should be created."
  default = "1.0.0.0"
}

variable "area_prefix" {
  description = "The Azure Region in which all resources in this example should be created."
  default = "dev"
}
variable "environment" {
  description = "The Azure Region in which all resources in this example should be created."
  default = "dev"
}



