#######################################4#######################################8
#                                                                              #
#                              Variable definitioms                            #
#                                                                              #
#######################################4#######################################8


variable "NFS_provider"                {
                                         type    = string
                                         default = "NONE"
                                       }

variable "infrastructure"              {
                                         description = "Details of the Azure infrastructure to deploy the SAP landscape into"
                                         default     = {}
                                       }

variable "options"                     {
                                         description = "Configuration options"
                                         default     = {}
                                       }

variable "authentication"              {
                                         description = "Details of ssh key pair"
                                         default = {
                                                     username            = "azureadm",
                                                     path_to_public_key  = "",
                                                     path_to_private_key = ""
                                                   }
                                       }

variable "key_vault"                   {
                                         description = "The user brings existing Azure Key Vaults"
                                         default     = { }
                                       }

variable "diagnostics_storage_account" {
                                         description = "Storage account information for diagnostics account"
                                        default      = {
                                                         arm_id = ""
                                                       }
                                       }

variable "witness_storage_account"     {
                                        description = "Storage account information for witness storage account"
                                        default     = {
                                                        arm_id = ""
                                                      }
                                       }

variable "deployment"                  {
                                         description = "The type of deployment"
                                         default     = "update"
                                       }

variable "terraform_template_version"  {
                                         description = "The version of Terraform templates that were identified in the state file"
                                         default     = ""
                                       }

variable "dns_label"                   {
                                         description = "DNS label"
                                         default     = ""
                                       }
variable "vis_subscription_id"         {
                                         type        = string
                                         description = "Customer subscription id where VIS is deployed."
                                       }

variable "vis_tenant_id"               {
                                         type        = string
                                         description = "Customer subscription tenant id."
                                       }

variable "vis_msi_client_id"           {
                                         type        = string
                                         description = "VIS MI client id."
                                         sensitive   = true
                                       }

variable "user_msi_certificate"        {
                                         type		  = string
                                         description = "The user msi certificate"
                                         sensitive   = true
                                       }
