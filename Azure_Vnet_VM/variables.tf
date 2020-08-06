variable "prefix" {
  description = "The Prefix used for all resources in this example"
  default = "Dev"
}

variable "location" {
  description = "The Azure Region in which all resources in this example should be created."
  default = "West US 2"
}

variable "vm_size" {}
variable "publisher" {}
variable "offer" {}
variable "sku" {}
variable "image_version" {}
variable "admin_username" {}
variable "admin_password" {}