output "vpc_name" {
  value = google_compute_network.google_vpc.name
}

output "subnet_name"{
  value = google_compute_subnetwork.google_subnet.name
}