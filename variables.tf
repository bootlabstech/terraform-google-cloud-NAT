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

variable "subnetwork" {
  type = list(object({
    name                     = string
    secondary_ip_range_names = set(string)
    source_ip_ranges_to_nat  = set(string)
  }))
  description = "Self-link of subnetwork to NAT"
}

variable "google_compute_address_count" {
  type        = number
  description = "The count of compute address should be created"
}