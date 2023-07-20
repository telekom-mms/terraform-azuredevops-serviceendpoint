data "azurerm_subscription" "current" {}

module "container" {
  source = "registry.terraform.io/telekom-mms/container/azurerm"
  container_registry = {
    crmms = {
      location            = "westeurope"
      resource_group_name = "rg-mms-github"
    }
  }
}

module "core" {
  source = "../terraform-azuredevops-core"
  project = {
    mms = {}
  }
}

module "serviceendpoint" {
  source = "../terraform-azuredevops-serviceendpoint"
  serviceendpoint_azurerm = {
    mms = {
      project_id                = module.core.project["mms"].id
      azurerm_subscription_id   = data.azurerm_subscription.current.subscription_id
      azurerm_subscription_name = data.azurerm_subscription.current.display_name
      azurerm_spn_tenantid      = data.azurerm_subscription.current.tenant_id
      description               = "Azure Resource Manager Connection"
    }
  }
  serviceendpoint_azurecr = {
    crmms = {
      project_id                = module.core.project["mms"].id
      resource_group            = module.container.container_registry["crmms"].resource_group_name
      azurecr_spn_tenantid      = data.azurerm_subscription.current.tenant_id
      azurecr_name              = module.container.container_registry["crmms"].name
      azurecr_subscription_id   = data.azurerm_subscription.current.subscription_id
      azurecr_subscription_name = data.azurerm_subscription.current.display_name
      description               = "Azure Container Registry Connection"
    }
  }
  serviceendpoint_dockerregistry = {
    docker = {
      project_id  = module.core.project["mms"].id
      description = "Docker Registry Connection"
    }
  }
  serviceendpoint_generic_git = {
    github = {
      project_id              = module.core.project["mms"].id
      repository_url          = "https://github.com/telekom-mms/terraform-template"
      description             = "GitHub Repository Connection for terraform template"
      enable_pipelines_access = "true"
    }
  }
}
