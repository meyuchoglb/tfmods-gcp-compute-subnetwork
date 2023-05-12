# --------------------------------------------------------------------------------
#                                    Outputs
# --------------------------------------------------------------------------------

output "subnets" {
  value = {
    for subnet in keys(google_compute_subnetwork.subnets) : subnet => {
      id        = google_compute_subnetwork.subnets[subnet].id
      name      = subnet
      self_link = google_compute_subnetwork.subnets[subnet].self_link
    }
  }
  description = "VPC subnet IDs map"
}