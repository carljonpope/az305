variable "name" {
  description = "The name of the MS SQL Database. Changing this forces a new resource to be created."
}

variable "server_id" {
  description = "The id of the MS SQL Server on which to create the database. Changing this forces a new resource to be created."
}

variable "auto_pause_delay_in_minutes" {
  description = "vaTime in minutes after which database is automatically paused. A value of -1 means that automatic pause is disabled. This property is only settable for General Purpose Serverless databases.lue"
}

variable "create_mode" {
  description = "The create mode of the database. Possible values are Copy, Default, OnlineSecondary, PointInTimeRestore, Recovery, Restore, RestoreExternalBackup, RestoreExternalBackupSecondary, RestoreLongTermRetentionBackup and Secondary."
}

variable "creation_source_database_id" {
  description = "The ID of the source database from which to create the new database. This should only be used for databases with create_mode values that use another database as reference. Changing this forces a new resource to be created."
}

variable "collation" {
  description = "Specifies the collation of the database. Changing this forces a new resource to be created."
}

variable "elastic_pool_id" {
  description = "Specifies the ID of the elastic pool containing this database."
}

variable "geo_backup_enabled" {
  description = "A boolean that specifies if the Geo Backup Policy is enabled."
}

variable "ledger_enabled" {
  description = "A boolean that specifies if this is a ledger database. Defaults to false. Changing this forces a new resource to be created."
}

variable "license_type" {
  description = "Specifies the license type applied to this database. Possible values are LicenseIncluded and BasePrice."
}

variable "max_size_gb" {
  description = "The max size of the database in gigabytes."
}

variable "min_capacity" {
  description = "Minimal capacity that database will always have allocated, if not paused. This property is only settable for General Purpose Serverless databases."
}

variable "restore_point_in_time" {
  description = "Specifies the point in time (ISO8601 format) of the source database that will be restored to create the new database. This property is only settable for create_mode= PointInTimeRestore databases."
}

variable "recover_database_id" {
  description = "The ID of the database to be recovered. This property is only applicable when the create_mode is Recovery."
}

variable "restore_dropped_database_id" {
  description = "The ID of the database to be restored. This property is only applicable when the create_mode is Restore."
}

variable "read_replica_count" {
  description = "The number of readonly secondary replicas associated with the database to which readonly application intent connections may be routed. This property is only settable for Hyperscale edition databases."
}

variable "read_scale" {
  description = "If enabled, connections that have application intent set to readonly in their connection string may be routed to a readonly secondary replica. This property is only settable for Premium and Business Critical databases."
}

variable "sample_name" {
  description = "Specifies the name of the sample schema to apply when creating this database. Possible value is AdventureWorksLT."
}

variable "sku_name" {
  description = "Specifies the name of the SKU used by the database. For example, GP_S_Gen5_2,HS_Gen4_1,BC_Gen5_2, ElasticPool, Basic,S0, P2 ,DW100c, DS100. Changing this from the HyperScale service tier to another service tier will force a new resource to be created."
}

variable "storage_account_type" {
  description = "Specifies the storage account type used to store backups for this database. Possible values are Geo, GeoZone, Local and Zone. The default value is Geo."
}

variable "transparent_data_encryption_enabled" {
  description = "If set to true, Transparent Data Encryption will be enabled on the database. Defaults to true."
}

variable "zone_redundant" {
  description = "Whether or not this database is zone redundant, which means the replicas of this database will be spread across multiple availability zones. This property is only settable for Premium and Business Critical databases."
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
}

variable "audit_storage_account_access_key" {
  description = "Specifies the access key to use for the auditing storage account."
}

variable "audit_storage_endpoint" {
  description = "Specifies the blob storage endpoint"
}

variable "audit_storage_account_access_key_is_secondary" {
  description = "Specifies whether storage_account_access_key value is the storage's secondary key."
}

variable "audit_retention_in_days" {
  description = "Specifies the number of days to retain logs for in the storage account."
}

variable "audit_log_monitoring_enabled" {
  description = "Enable audit events to Azure Monitor?"
}

variable "lt_weekly_retention" {
  description = "The weekly retention policy for an LTR backup in an ISO 8601 format. Valid value is between 1 to 520 weeks. e.g. P1Y, P1M, P1W or P7D."
}

variable "lt_monthly_retention" {
  description = "The monthly retention policy for an LTR backup in an ISO 8601 format. Valid value is between 1 to 120 months. e.g. P1Y, P1M, P4W or P30D."
}

variable "lt_yearly_retention" {
  description = "The yearly retention policy for an LTR backup in an ISO 8601 format. Valid value is between 1 to 10 years. e.g. P1Y, P12M, P52W or P365D."
}

variable "lt_week_of_year" {
  description = "The week of year to take the yearly backup. Value has to be between 1 and 52."
}

variable "st_retention_days" {
  description = "Point In Time Restore configuration. Value has to be between 7 and 35."
}

variable "st_backup_interval_in_hours" {
  description = "The hours between each differential backup. This is only applicable to live databases but not dropped databases. Value has to be 12 or 24. Defaults to 12 hours."
}

variable "td_state" {
  description = "The State of the Policy. Possible values are Enabled, Disabled or New."
}

variable "td_disabled_alerts" {
  description = "Specifies a list of alerts which should be disabled. Possible values include Access_Anomaly, Sql_Injection and Sql_Injection_Vulnerability."
}

variable "td_email_account_admins" {
  description = "Should the account administrators be emailed when this alert is triggered?"
}

variable "td_email_addresses" {
  description = "A list of email addresses which alerts should be sent to."
}

variable "td_retention_days" {
  description = "Specifies the number of days to keep in the Threat Detection audit logs."
}

variable "td_storage_account_access_key" {
  description = "Specifies the identifier key of the Threat Detection audit storage account. Required if state is Enabled."
}

variable "td_storage_endpoint" {
  description = "Specifies the blob storage endpoint (e.g. https://example.blob.core.windows.net). This blob storage will hold all Threat Detection audit logs. Required if state is Enabled."
}