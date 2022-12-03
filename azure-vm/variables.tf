variable "prefix" {
  default     = "azvmlab"
  description = "The prefix which should be used for all resources in this example"
}

variable "location" {
  default     = "eastasia"
  description = "The Azure Region in which all resources in this example should be created."
}

# centos image

variable "linux_vm_image_publisher" {
  type        = string
  description = "Virtual machine source image publisher"
  default     = "OpenLogic"
}
variable "linux_vm_image_offer" {
  type        = string
  description = "Virtual machine source image offer"
  default     = "CentOS"
}
variable "centos_7_sku" {
  type        = string
  description = "SKU for latest CentOS 8 "
  default     = "7_9"
}
variable "centos_7_gen2_sku" {
  type        = string
  description = "SKU for latest CentOS 8 Gen2"
  default     = "7_9-gen2"
}
variable "centos_8_sku" {
  type        = string
  description = "SKU for latest CentOS 8 "
  default     = "8_5"
}
variable "centos_8_gen2_sku" {
  type        = string
  description = "SKU for latest CentOS 8 Gen2"
  default     = "8_5-gen2"
}

# Azure auth

/* variable "azure_subscription_id" {
  type = string
  description = "Azure Subscription ID"
}
variable "azure_client_id" {
  type = string
  defalut     ="<azure_client_id>"
  description = "Azure Client ID"
}
variable "azure_client_secret" {
  type = string
  description = "Azure Client Secret"
}
variable "azure_tenant_id" {
  type = string
  description = "Azure Tenant ID"
} */