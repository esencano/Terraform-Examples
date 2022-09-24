terraform {
  required_providers {
    linode = {
      source = "linode/linode"
      # version = "..."
    }
  }
}

# Configure the Linode Provider
provider "linode" {
  token = var.token
}

resource "linode_lke_cluster" "ercan_cluster" {
  label       = "terraform-example-cluster"
  k8s_version = "1.23"
  region      = "us-southeast"
  tags        = ["staging", "test", "ercan"]

  dynamic "pool" {
    for_each = var.pools
    content {
      type  = pool.value["type"]
      count = pool.value["count"]
      autoscaler {
        min = pool.value["min"]
        max = pool.value["max"]
      }
    }
  }

  # Prevent the count field from overriding autoscaler-created nodes
  /*lifecycle {
    ignore_changes = [
      pool.0.count,
      pool.1.count
    ]
  }*/
}


//Export this cluster's attributes
output "kubeconfig" {
  value     = linode_lke_cluster.ercan_cluster.kubeconfig
  sensitive = true
}

output "api_endpoints" {
  value = linode_lke_cluster.ercan_cluster.api_endpoints
}

output "status" {
  value = linode_lke_cluster.ercan_cluster.status
}

output "id" {
  value = linode_lke_cluster.ercan_cluster.id
}

output "pool" {
  value = linode_lke_cluster.ercan_cluster.pool
}
