resource "google_compute_router" "router" {
  name    = var.compute_router_name
  project = var.project_id
  region  = var.region
  network = var.network

  bgp {
    asn = var.bgp
  }
}

resource "google_compute_address" "nat" {
  project = var.project_id
  count   = var.google_compute_address_count
  name    = "nat-manual-ip-${count.index}"
  region  = google_compute_router.router.region

}

resource "google_compute_router_nat" "nat" {
  project                            = var.project_id
  name                               = var.router_nat_name
  router                             = google_compute_router.router.name
  region                             = var.region
  nat_ip_allocate_option             = var.nat_ip_allocate_option
  source_subnetwork_ip_ranges_to_nat = var.source_subnetwork_ip_ranges_to_nat
  nat_ips                            = google_compute_address.address.*.self_link

  log_config {
    enable = var.log_config_enable
    filter = var.filter
  }

  dynamic "subnetwork" {
    for_each = var.enable_subnetwork ? [{}] : []
    content {
      name                     = var.subnetwork_name
      secondary_ip_range_names = var.secondary_ip_range_names
      source_ip_ranges_to_nat  = var.source_ip_ranges_to_nat
    }
  }
}

resource "google_compute_route" "route" {
  name             = var.route_name
  project          = var.project_id
  dest_range       = var.dest_range
  network          = var.network
  next_hop_gateway = var.next_hop_gateway
  priority         = var.priority
}



