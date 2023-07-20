variable "serviceendpoint_azurerm" {
  type        = any
  default     = {}
  description = "Resource definition, default settings are defined within locals and merged with var settings. For more information look at [Outputs](#Outputs)."
}
variable "serviceendpoint_azurecr" {
  type        = any
  default     = {}
  description = "Resource definition, default settings are defined within locals and merged with var settings. For more information look at [Outputs](#Outputs)."
}
variable "serviceendpoint_dockerregistry" {
  type        = any
  default     = {}
  description = "Resource definition, default settings are defined within locals and merged with var settings. For more information look at [Outputs](#Outputs)."
}
variable "serviceendpoint_generic_git" {
  type        = any
  default     = {}
  description = "Resource definition, default settings are defined within locals and merged with var settings. For more information look at [Outputs](#Outputs)."
}

locals {
  default = {
    // resource definition
    serviceendpoint_azurerm = {
      service_endpoint_name         = ""
      azurerm_management_group_id   = null
      azurerm_management_group_name = null
      azurerm_subscription_id       = null
      azurerm_subscription_name     = null
      environment                   = null
      description                   = null
      resource_group                = null
      credentials                   = {}
    }
    serviceendpoint_azurecr = {
      service_endpoint_name = ""
      description           = null
    }
    serviceendpoint_dockerregistry = {
      service_endpoint_name = ""
      description           = null
      docker_registry       = null
      docker_username       = null
      docker_email          = null
      docker_password       = null
      registry_type         = null
    }
    serviceendpoint_generic_git = {
      service_endpoint_name   = ""
      username                = null
      password                = null
      description             = null
      enable_pipelines_access = null
    }
  }

  // compare and merge custom and default values
  // deep merge of all custom and default values
  serviceendpoint_azurerm = {
    for serviceendpoint_azurerm in keys(var.serviceendpoint_azurerm) :
    serviceendpoint_azurerm => merge(local.default.serviceendpoint_azurerm, var.serviceendpoint_azurerm[serviceendpoint_azurerm])
  }
  serviceendpoint_azurecr = {
    for serviceendpoint_azurecr in keys(var.serviceendpoint_azurecr) :
    serviceendpoint_azurecr => merge(local.default.serviceendpoint_azurecr, var.serviceendpoint_azurecr[serviceendpoint_azurecr])
  }
  serviceendpoint_dockerregistry = {
    for serviceendpoint_dockerregistry in keys(var.serviceendpoint_dockerregistry) :
    serviceendpoint_dockerregistry => merge(local.default.serviceendpoint_dockerregistry, var.serviceendpoint_dockerregistry[serviceendpoint_dockerregistry])
  }
  serviceendpoint_generic_git = {
    for serviceendpoint_generic_git in keys(var.serviceendpoint_generic_git) :
    serviceendpoint_generic_git => merge(local.default.serviceendpoint_generic_git, var.serviceendpoint_generic_git[serviceendpoint_generic_git])
  }
}
