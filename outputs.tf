output "service_principal_client_id" {
  value = azuread_service_principal.aks_sp.application_id
}


output "service_principal_client_secret" {
  value = random_string.password.result
}