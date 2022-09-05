variable "name" {
  description = "The name of the Microsoft SQL Server. This needs to be globally unique within Azure."
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Microsoft SQL Server."
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "sql_version" {
  description = "The version for the new server. Valid values are: 2.0 (for v11 server) and 12.0 (for v12 server)."
}
variable "administrator_login" {
  description = "The administrator login name for the new server. Required unless azuread_authentication_only in the azuread_administrator block is true. When omitted, Azure will generate a default username which cannot be subsequently changed. Changing this forces a new resource to be created."
}

variable "administrator_login_password" {
  description = "The password associated with the administrator_login user. Needs to comply with Azure's Password Policy. Required unless azuread_authentication_only in the azuread_administrator block is true."
}

variable "connection_policy" {
  description = "The connection policy the server will use. Possible values are Default, Proxy, and Redirect. Defaults to Default."
}

variable "minimum_tls_version" {
  description = "The Minimum TLS Version for all SQL Database and SQL Data Warehouse databases associated with the server. Valid values are: 1.0, 1.1 and"
}

variable "public_network_access_enabled" {
  description = "Whether public network access is allowed for this server. Defaults to true."
}

variable "outbound_network_restriction_enabled" {
  description = "Whether outbound network traffic is restricted for this server. Defaults to false."
}

variable "primary_user_assigned_identity_id" {
  description = "Specifies the primary user managed identity id. Required if type is UserAssigned and should be combined with user_assigned_identity_ids."
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
}

variable "login_username" {
  description = "The login username of the Azure AD Administrator of this SQL Server."
}

variable "object_id" {
  description = "The object id of the Azure AD Administrator of this SQL Server."
}

variable "tenant_id" {
  description = "The tenant id of the Azure AD Administrator of this SQL Server."
}

variable "azuread_authentication_only" {
  description = "Specifies whether only AD Users and administrators (like azuread_administrator.0.login_username) can be used to login, or also local database users (like administrator_login). When true, the administrator_login and administrator_login_password properties can be omitted."
}

variable "type" {
  description = "Specifies the type of Managed Service Identity that should be configured on this API Management Service. Possible values are SystemAssigned,"
}

variable "identity_ids" {
  description = "Specifies a list of User Assigned Managed Identity IDs to be assigned to this API Management Service."
}