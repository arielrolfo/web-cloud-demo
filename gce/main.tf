// Configure the Google Cloud provider
provider "google" {
  credentials = "${file("webdemo-8420a22804ea.json")}"
  project     = "webdemo-180503"
  region      = "us-central1"
}

// Create a new instance
resource "google_compute_instance" "default" {
  name         = "backend01"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "ubuntu-1604-lts"
    }
  }

  network_interface {
    network       = "default"
    access_config = {}
  }

  metadata {
    foo = "bar"
  }

  metadata_startup_script = "echo hi > /test.txt"

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}
