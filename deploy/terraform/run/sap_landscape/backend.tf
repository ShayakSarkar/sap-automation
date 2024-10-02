/*
Description:

  To use remote backend to deploy sap landscape
*/

terraform {
  backend "http" {
    address = "https://localhost:50000/WorkloadZoneStateConfiguration"

    lock_address = "https://localhost:50001/WorkloadZoneStateConfiguration"
    lock_method = "PUT"

    unlock_address = "https://localhost:50001/WorkloadZoneStateConfiguration"
    unlock_method = "DELETE"
  }
}