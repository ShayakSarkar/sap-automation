/*
    Description:
    Retrieve remote tfstate file of Deployer and current environment's SPN
*/

data "azurerm_client_config" "current" {}

data "terraform_remote_state" "deployer" {
  backend                              = "http"
  count                                = length(try(var.deployer_tfstate_key, "")) > 0 ? 1 : 0
  config                               = {
                                           address = "https://localhost:50000/WorkloadZoneStateConfiguration"
                                         }
}