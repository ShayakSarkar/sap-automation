
locals {

  version_label                        = trimspace(file("${path.module}/../../../configs/version.txt"))
  // The environment of sap landscape and sap system
  environment                          = upper(local.infrastructure.environment)
  vnet_sap_arm_id                      = try(data.terraform_remote_state.landscape.outputs.vnet_sap_arm_id, "")

  vnet_logical_name                    = local.infrastructure.vnets.sap.logical_name
  vnet_sap_exists                      = length(local.vnet_sap_arm_id) > 0 ? true : false


  db_sid                              = upper(try(local.database.instance.sid, "HDB"))
  sap_sid                             = upper(try(local.application_tier.sid, local.db_sid))
  web_sid                             = upper(try(var.web_sid, local.sap_sid))

  enable_db_deployment                = length(local.database.platform) > 0

  db_zonal_deployment                 = length(try(local.database.zones, [])) > 0

  // Locate the tfstate storage account
  saplib_subscription_id               = var.vis_subscription_id
  saplib_resource_group_name           = "shayak-testinfra-rg"
  tfstate_storage_account_name         = "tfbackendsdafacss"
  tfstate_container_name               = "workloadzonecontainer"

  // Retrieve the arm_id of deployer's Key Vault
  spn_key_vault_arm_id               = var.spn_key_vault_arm_id

  deployer_subscription_id           = length(local.spn_key_vault_arm_id) > 0 ? split("/", local.spn_key_vault_arm_id)[2] : ""

  spn                                = {
                                         subscription_id      = var.vis_subscription_id,
                                         client_id            = var.vis_msi_client_id,
                                         client_certificate   = var.user_msi_certificate,
                                         tenant_id            = var.vis_tenant_id
                                       }

  cp_spn                             = {
                                        subscription_id      = var.vis_subscription_id
                                        client_id            = var.vis_msi_client_id,
                                        client_certificate   = var.user_msi_certificate
                                        tenant_id            = var.vis_tenant_id
                                      }

  service_principal                  = {
                                         subscription_id = var.vis_subscription_id,
                                         tenant_id       = var.vis_tenant_id,
                                         object_id       = null
                                       }

  account                            = {
                                        subscription_id = var.vis_subscription_id,
                                        tenant_id       = var.vis_tenant_id,
                                        object_id       = null
                                      }

  custom_names                       = length(var.name_override_file) > 0 ? (
                                        jsondecode(file(format("%s/%s", path.cwd, var.name_override_file)))) : (
                                        null
                                      )

}
