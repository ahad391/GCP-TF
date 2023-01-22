provider "google" {
  project     = "devopsabdul"
  region      = "us-central1"
}

resource "google_compute_instance" "myfirstvm" {
  name         = "instance-2"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-2004-focal-v20230113"
    }
  }

  network_interface {
    network = "default"
  }
}