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

resource "linode_instance" "web" {
  label     = "web_instance"
  image     = "linode/ubuntu22.04"
  region    = "us-southeast"
  type      = "g6-nanode-1"
  root_pass = var.root_pass

  group      = "test_env"
  tags       = ["test", "ercan"]
  private_ip = true
  interface {
    purpose      = "vlan"
    label        = "test"
    ipam_address = "10.0.0.1/24"
  }
}