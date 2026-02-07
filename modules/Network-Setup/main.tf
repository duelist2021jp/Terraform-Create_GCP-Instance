resource "google_compute_network" "google_vpc"{
  name = "my-google-vpc"
}

resource "google_compute_subnetwork" "google_subnet"{
  name = "my-google-subnet"
  network = google_compute_network.google_vpc.id
  ip_cidr_range = var.subnet_cidr
}

# 【重要】SSH接続を許可するファイアウォールルール
resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh"
  network = google_compute_network.google_vpc.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  # IAP経由のみ許可する場合や、特定のIPのみに絞る場合はここを調整
  source_ranges = ["0.0.0.0/0"]
}