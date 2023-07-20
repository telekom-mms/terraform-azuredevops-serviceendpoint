output "serviceendpoint_azurerm" {
  description = "Outputs all attributes of resource_type."
  value = {
    for serviceendpoint_azurerm in keys(azuredevops_serviceendpoint_azurerm.serviceendpoint_azurerm) :
    serviceendpoint_azurerm => {
      for key, value in azuredevops_serviceendpoint_azurerm.serviceendpoint_azurerm[serviceendpoint_azurerm] :
      key => value
    }
  }
}

output "serviceendpoint_azurecr" {
  description = "Outputs all attributes of resource_type."
  value = {
    for serviceendpoint_azurecr in keys(azuredevops_serviceendpoint_azurecr.serviceendpoint_azurecr) :
    serviceendpoint_azurecr => {
      for key, value in azuredevops_serviceendpoint_azurecr.serviceendpoint_azurecr[serviceendpoint_azurecr] :
      key => value
    }
  }
}

output "serviceendpoint_dockerregistry" {
  description = "Outputs all attributes of resource_type."
  value = {
    for serviceendpoint_dockerregistry in keys(azuredevops_serviceendpoint_dockerregistry.serviceendpoint_dockerregistry) :
    serviceendpoint_dockerregistry => {
      for key, value in azuredevops_serviceendpoint_dockerregistry.serviceendpoint_dockerregistry[serviceendpoint_dockerregistry] :
      key => value
    }
  }
}

output "serviceendpoint_generic_git" {
  description = "Outputs all attributes of resource_type."
  value = {
    for serviceendpoint_generic_git in keys(azuredevops_serviceendpoint_generic_git.serviceendpoint_generic_git) :
    serviceendpoint_generic_git => {
      for key, value in azuredevops_serviceendpoint_generic_git.serviceendpoint_generic_git[serviceendpoint_generic_git] :
      key => value
    }
  }
}

output "variables" {
  description = "Displays all configurable variables passed by the module. __default__ = predefined values per module. __merged__ = result of merging the default values and custom values passed to the module"
  value = {
    default = {
      for variable in keys(local.default) :
      variable => local.default[variable]
    }
    merged = {
      serviceendpoint_azurerm = {
        for key in keys(var.serviceendpoint_azurerm) :
        key => local.serviceendpoint_azurerm[key]
      }
      serviceendpoint_azurecr = {
        for key in keys(var.serviceendpoint_azurecr) :
        key => local.serviceendpoint_azurecr[key]
      }
      serviceendpoint_dockerregistry = {
        for key in keys(var.serviceendpoint_dockerregistry) :
        key => local.serviceendpoint_dockerregistry[key]
      }
      serviceendpoint_generic_git = {
        for key in keys(var.serviceendpoint_generic_git) :
        key => local.serviceendpoint_generic_git[key]
      }
    }
  }
}
