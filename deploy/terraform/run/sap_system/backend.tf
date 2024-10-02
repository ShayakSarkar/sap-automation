/*
  Description:
  To use remote backend to deploy sap system(s)
*/

terraform {
  backend "http" {
    address = "https://localhost:50000/SAPInfraStateConfiguration"

    lock_address = "https://localhost:50001/SAPInfraStateConfiguration"
    lock_method = "PUT"

    unlock_address = "https://localhost:50001/SAPInfraStateConfiguration"
    unlock_method = "DELETE"
  }
}