
/*
    Description:
    Retrieve remote tfstate file of Deployer and current environment's SPN
*/


data "azurerm_client_config" "current" {}

data "terraform_remote_state" "landscape"            {
                                                       backend       = "http"
                                                       config        = {
                                                                          address = "https://localhost:50000/WorkloadZoneStateConfiguration"
                                                                       }
                                                     }