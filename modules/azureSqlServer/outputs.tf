output "mssql_server_name" {
  value = azurerm_mssql_server.mssql_server.name
}
output "mssql_server_id" {
  value = azurerm_mssql_server.mssql_server.id
}

output "mssql_server_princiapl_id" {
  value = azurerm_mssql_server.mssql_server.identity[0].principal_id
}
