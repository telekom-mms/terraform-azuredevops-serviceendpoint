/**
* # serviceendpoint
*
* This module manages the microsoft/azuredevops serviceendpoint resources.
* For more information see https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs
*
*/

resource "azuredevops_serviceendpoint_azurerm" "serviceendpoint_azurerm" {
  for_each = var.serviceendpoint_azurerm

  service_endpoint_name         = local.serviceendpoint_azurerm[each.key].service_endpoint_name == "" ? each.key : local.serviceendpoint_azurerm[each.key].service_endpoint_name
  project_id                    = local.serviceendpoint_azurerm[each.key].project_id
  azurerm_spn_tenantid          = local.serviceendpoint_azurerm[each.key].azurerm_spn_tenantid
  azurerm_management_group_id   = local.serviceendpoint_azurerm[each.key].azurerm_management_group_id
  azurerm_management_group_name = local.serviceendpoint_azurerm[each.key].azurerm_management_group_name
  azurerm_subscription_id       = local.serviceendpoint_azurerm[each.key].azurerm_subscription_id
  azurerm_subscription_name     = local.serviceendpoint_azurerm[each.key].azurerm_subscription_name
  environment                   = local.serviceendpoint_azurerm[each.key].environment
  description                   = local.serviceendpoint_azurerm[each.key].description
  resource_group                = local.serviceendpoint_azurerm[each.key].resource_group

  dynamic "credentials" {
    for_each = local.serviceendpoint_azurerm[each.key].credentials

    content {
      serviceprincipalid  = local.serviceendpoint_azurerm[each.key].credentials.serviceprincipalid
      serviceprincipalkey = local.serviceendpoint_azurerm[each.key].credentials.serviceprincipalkey
    }
  }
}

resource "azuredevops_serviceendpoint_azurecr" "serviceendpoint_azurecr" {
  for_each = var.serviceendpoint_azurecr

  service_endpoint_name     = local.serviceendpoint_azurecr[each.key].service_endpoint_name == "" ? each.key : local.serviceendpoint_azurecr[each.key].service_endpoint_name
  project_id                = local.serviceendpoint_azurecr[each.key].project_id
  resource_group            = local.serviceendpoint_azurecr[each.key].resource_group
  azurecr_spn_tenantid      = local.serviceendpoint_azurecr[each.key].azurecr_spn_tenantid
  azurecr_name              = local.serviceendpoint_azurecr[each.key].azurecr_name
  azurecr_subscription_id   = local.serviceendpoint_azurecr[each.key].azurecr_subscription_id
  azurecr_subscription_name = local.serviceendpoint_azurecr[each.key].azurecr_subscription_name
  description               = local.serviceendpoint_azurecr[each.key].description
}

resource "azuredevops_serviceendpoint_dockerregistry" "serviceendpoint_dockerregistry" {
  for_each = var.serviceendpoint_dockerregistry

  service_endpoint_name = local.serviceendpoint_dockerregistry[each.key].service_endpoint_name == "" ? each.key : local.serviceendpoint_dockerregistry[each.key].service_endpoint_name
  project_id            = local.serviceendpoint_dockerregistry[each.key].project_id
  description           = local.serviceendpoint_dockerregistry[each.key].description
  docker_registry       = local.serviceendpoint_dockerregistry[each.key].docker_registry
  docker_username       = local.serviceendpoint_dockerregistry[each.key].docker_username
  docker_email          = local.serviceendpoint_dockerregistry[each.key].docker_email
  docker_password       = local.serviceendpoint_dockerregistry[each.key].docker_password
  registry_type         = local.serviceendpoint_dockerregistry[each.key].registry_type
}

resource "azuredevops_serviceendpoint_generic_git" "serviceendpoint_generic_git" {
  for_each = var.serviceendpoint_generic_git

  service_endpoint_name   = local.serviceendpoint_generic_git[each.key].service_endpoint_name == "" ? each.key : local.serviceendpoint_generic_git[each.key].service_endpoint_name
  project_id              = local.serviceendpoint_generic_git[each.key].project_id
  repository_url          = local.serviceendpoint_generic_git[each.key].repository_url
  username                = local.serviceendpoint_generic_git[each.key].username
  password                = local.serviceendpoint_generic_git[each.key].password
  description             = local.serviceendpoint_generic_git[each.key].description
  enable_pipelines_access = local.serviceendpoint_generic_git[each.key].enable_pipelines_access
}
