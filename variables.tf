# --------------------------------------------------------------------------------
#                                  Variables
# --------------------------------------------------------------------------------

variable "project_id" {
  type        = string
  description = "GCP project ID."
}

variable "vpc_id" {
  type        = string
  default     = "primary"
  description = "The VPC fot the subnetwork."
}

variable "subnets" {
  type        = map(any)
  description = "GCP subnet properties map."
  default     = {}
}