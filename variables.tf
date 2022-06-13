variable "compute_router_name" {
  type        = string
  description = "Name of the router"
}

variable "network" {
  type        = string
  description = "A reference to the network to which this router belongs"
}

variable "router_nat_name" {
  type        = string
  description = "The name of router_nat"
}

variable "project_id" {
  type        = string
  description = "The project ID to deploy to"
}

variable "region" {
  type        = string
  description = "Region where the router resides"
}

variable "description" {
  type        = string
  description = "An optional description of this resource"
}

variable "bgp" {
  description = "BGP information specific to this router."
  type        = number
}

variable "nat_ip_allocate_option" {
  type        = string
  description = "How external IPs should be allocated for this NAT."
}

variable "source_subnetwork_ip_ranges_to_nat" {
  type        = string
  description = "How NAT should be configured per Subnetwork https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router_nat#source_subnetwork_ip_ranges_to_nat"
}

variable "log_config_enable" {
  type        = bool
  description = "Indicates whether or not to export logs."
}

variable "filter" {
  type        = string
  description = "Specifies the desired filtering of logs on this NAT. Possible values are ERRORS_ONLY, TRANSLATIONS_ONLY, and ALL."
}

variable "google_compute_address_count" {
  type        = number
  description = "The count of compute address should be created"
}

variable "enable_subnetwork" {
  type        = bool
  description = "enable the subnetwork"
  default     = false
}

variable "subnetwork_name" {
  type        = string
  description = "Self-link of subnetwork to NAT"
  default     = ""
}

variable "secondary_ip_range_names" {
  type        = set(string)
  description = "List of the secondary ranges of the subnetwork that are allowed to use NAT."
  default     = []
}

variable "source_ip_ranges_to_nat" {
  type        = set(string)
  description = "List of options for which source IPs in the subnetwork should have NAT enabled"
  default     = []
}

variable "route_name" {
  type        = string
  description = "Name of the route resource."
}

variable "dest_range" {
  type        = string
  description = "The destination range of outgoing packets that this route applies to. Only IPv4 is supported."
}

variable "next_hop_gateway" {
  type        = string
  description = "URL to a gateway that should handle matching packets."
  default     = "default-internet-gateway"
}

variable "priority" {
  type        = number
  description = "The priority of this route."
  default     = 0
}