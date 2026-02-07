# 1. Compute Engine インスタンスの作成
resource "google_compute_instance" "vm-instance" {
  name         = "my-instance"
  machine_type = "e2-medium"
  zone         = "asia-northeast1-a"

  # ブートディスクの設定
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2404-lts-amd64"
   }
  }

  # ネットワーク設定
  network_interface {
    network    = var.vpc_name
    subnetwork = var.subnet_name

    # 【重要】パブリックIPを付与する設定
    access_config {
      # 空のブロックにすることで、エフェメラル（一時的）外部IPアドレスが割り当てられます
    }
  }

  metadata = {
    enable-oslogin = "FALSE"
    ssh-keys       = "adminuser:${file("~/.ssh/gcp-vm-rsa-key.pub")}"
  }

  metadata_startup_script = file("~/Documents/GCP/terraform/create_gcp_vm/initial.sh")
}
