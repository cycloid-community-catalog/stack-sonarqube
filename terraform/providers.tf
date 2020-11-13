terraform {
  required_providers {
    helm = {
      source = "hashicorp/helm"
      version = "1.3.2"
    }
  }
}

provider "helm" {
  kubernetes {
    config_path = "${path.module}/.kube/config"
  }
}
