variable "sa_name" {
  type    = string
  default = "sample-sa"
}

variable "rg_name" {
  type    = string
  default = "sample-rg"
}

variable "infrastructure_encryption_enabled" {
  type    = bool
  default = true
}

variable "sa_config" {
  type = map(object({
    name                              = string
    account_tier                      = string
    infrastructure_encryption_enabled = bool
  }))
  default = {
    storage_account1 = {
    name                              = "for_each_sa"
    account_tier                      = "Standard"
    infrastructure_encryption_enabled = false
  }}
}