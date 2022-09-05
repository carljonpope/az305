resource "azurerm_mssql_database" "mssql_database" {
  name                                = var.name
  server_id                           = var.server_id
  auto_pause_delay_in_minutes         = var.auto_pause_delay_in_minutes
  create_mode                         = var.create_mode
  creation_source_database_id         = var.creation_source_database_id
  collation                           = var.collation
  elastic_pool_id                     = var.elastic_pool_id
  geo_backup_enabled                  = var.geo_backup_enabled
  ledger_enabled                      = var.ledger_enabled
  license_type                        = var.license_type
  max_size_gb                         = var.max_size_gb
  min_capacity                        = var.min_capacity
  restore_point_in_time               = var.create_mode == "PointInTimeRestore" ? var.restore_point_in_time : null
  recover_database_id                 = var.recover_database_id
  restore_dropped_database_id         = var.restore_dropped_database_id
  read_replica_count                  = var.read_replica_count
  read_scale                          = var.read_scale
  sample_name                         = var.sample_name
  sku_name                            = var.sku_name
  storage_account_type                = var.storage_account_type
  transparent_data_encryption_enabled = var.transparent_data_encryption_enabled
  zone_redundant                      = var.zone_redundant
  tags                                = var.tags

  lifecycle {
    ignore_changes = [
      tags["CreatedDate"]
    ]
  }

  long_term_retention_policy {
    weekly_retention  = var.lt_weekly_retention
    monthly_retention = var.lt_monthly_retention
    yearly_retention  = var.lt_yearly_retention
    week_of_year      = var.lt_week_of_year
  }

  short_term_retention_policy {
    retention_days           = var.st_retention_days
    backup_interval_in_hours = var.st_backup_interval_in_hours
  }

  threat_detection_policy {
    state                      = var.td_state
    disabled_alerts            = var.td_disabled_alerts
    email_account_admins       = var.td_email_account_admins
    email_addresses            = var.td_email_addresses
    retention_days             = var.td_retention_days
    storage_account_access_key = var.td_storage_account_access_key
    storage_endpoint           = var.td_storage_endpoint
  }
}