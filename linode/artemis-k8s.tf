terraform {
  required_providers {
    linode = {
      source = "linode/linode"
    }
  }
}

provider "linode" {
  token = "" #FIXME
}


resource "linode_lke_cluster" "my-cluster" {
  label       = "Artemis"
  k8s_version = "1.23"
  region      = "eu-central"

  pool {
    type  = "g6-standard-2"
    count = 3
  }
}

