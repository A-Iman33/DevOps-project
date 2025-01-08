terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.14.1"
    }
  }
}

provider "google" {
  project = "devops-task-447020"
  region = "europe-west2"
}

resource "google_compute_address" "default" {
  name = "devops-static-ip"
}

resource "google_container_cluster" "primary" {
  name               = "devops-cluster"
  location           = "europe-west2"

    node_pool {
    name       = "default-node-pool"
    initial_node_count = 1

    autoscaling {
      min_node_count = 0
      max_node_count = 2
    }

    node_config {
      machine_type = "e2-small"
    }
  }
}

output "kubernetes_cluster_endpoint" {
  value = google_container_cluster.primary.endpoint
}

output "kubernetes_cluster_ca_certificate" {
  value = google_container_cluster.primary.master_auth[0].cluster_ca_certificate
}
