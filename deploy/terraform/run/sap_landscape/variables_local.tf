
#######################################4#######################################8
#                                                                              #
#                            Local Variables                                   #
#                                                                              #
#######################################4#######################################8

locals {

  version_label                        = trimspace(file("${path.module}/../../../configs/version.txt"))

  // The environment of sap landscape and sap system
  environment                          = upper(local.infrastructure.environment)

  vnet_logical_name                    = local.infrastructure.vnets.sap.logical_name


  // Locate the tfstate storage account
  // These values should not matter.
  saplib_subscription_id               = var.vis_subscription_id
  saplib_resource_group_name           = "shayak-testinfra-rg"
  tfstate_storage_account_name         = "tfbackendsdafacss"
  tfstate_container_name               = "workloadzonecontainer"

  // Retrieve the arm_id of deployer's Key Vault from deployer's terraform.tfstate
  spn_key_vault_arm_id                 = var.spn_key_vault_arm_id

  deployer_subscription_id             = var.vis_subscription_id

  spn                                  = {
                                           subscription_id      = var.vis_subscription_id,
                                           client_id            = var.vis_msi_client_id,
                                           client_certificate   = var.user_msi_certificate,
                                           tenant_id            = var.vis_tenant_id
                                         }

  cp_spn                               = {
                                           subscription_id      = var.vis_subscription_id
                                           client_id            = var.vis_msi_client_id,
                                           client_certificate   = var.user_msi_certificate
                                           tenant_id            = var.vis_tenant_id
                                         }

// Setting object id null since use_spn will always be false for us.
  service_principal                    = {
                                           subscription_id = var.vis_subscription_id,
                                           tenant_id       = var.vis_tenant_id,
                                           object_id       = null
                                         }

  account                              = {
                                          subscription_id = var.vis_subscription_id,
                                          tenant_id       = var.vis_tenant_id,
                                          object_id       = data.azurerm_client_config.current.object_id
                                        }

  custom_names                         = length(var.name_override_file) > 0 ? (
                                           jsondecode(file(format("%s/%s", path.cwd, var.name_override_file)))
                                          ) : (
                                          null
                                        )
}
