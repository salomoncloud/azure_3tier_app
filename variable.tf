variable "subscription_id" {
  type = string
}

variable "vm_count" {
type = number
}

variable "client_id" {
  type = string
}

variable "client_secret" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "admin_username" {
  type = string
}

variable "admin_password" {
  type = string
}

variable "admin_password_db" {
  type = string
}

variable "admin_username_db" {
  type = string
}

variable "resource_group_name" {
  type = string
  default = "Mcitterraformrg"
}

variable "location" {
  type = string
  default = "Canada East"
}
