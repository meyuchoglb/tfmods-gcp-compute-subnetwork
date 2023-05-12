resource "google_compute_subnetwork" "subnets" {
  for_each = var.subnets

  project                  = var.project_id
  name                     = each.key
  ip_cidr_range            = each.value.ip_range
  region                   = each.value.region
  network                  = var.vpc_id
  private_ip_google_access = lookup(each.value, "private_ip_google_access", true)
  purpose                  = lookup(each.value, "purpose", null)
  role                     = lookup(each.value, "role", null)

  dynamic "secondary_ip_range" {
    for_each = lookup(each.value, "ip_range_pods", null) == null ? [] : [each.value]
    content {
      range_name    = local.gke_pods_range_name
      ip_cidr_range = secondary_ip_range.value["ip_range_pods"]
    }
  }

  dynamic "secondary_ip_range" {
    for_each = lookup(each.value, "ip_range_services", null) == null ? [] : [each.value]
    content {
      range_name    = local.gke_services_range_name
      ip_cidr_range = secondary_ip_range.value["ip_range_services"]
    }
  }

  dynamic "secondary_ip_range" {
    for_each = lookup(each.value, "ip_range_storage", null) == null ? [] : [each.value]
    content {
      range_name    = local.storage_range_name
      ip_cidr_range = secondary_ip_range.value["ip_range_storage"]
    }
  }

  dynamic "log_config" {
    for_each = lookup(each.value, "subnet_flow_logs", true) ? [{
      aggregation_interval = lookup(each.value, "subnet_flow_logs_interval", "INTERVAL_5_MIN")
      flow_sampling        = lookup(each.value, "subnet_flow_logs_sampling", "0.5")
      metadata             = lookup(each.value, "subnet_flow_logs_metadata", "INCLUDE_ALL_METADATA")
      filter_expr          = lookup(each.value, "subnet_flow_logs_filter", "true")
    }] : []
    content {
      aggregation_interval = log_config.value.aggregation_interval
      flow_sampling        = log_config.value.flow_sampling
      metadata             = log_config.value.metadata
      filter_expr          = log_config.value.filter_expr
    }
  }
 
}
