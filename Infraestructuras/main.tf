terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.108.0"
    }
  }
}
provider "azurerm" {
  features {}
}

# resource "azurerm_resource_group" "rg" {
#   name     = "learnk8sResourceGroup"
#   location = "northeurope"
# }

resource "azurerm_kubernetes_cluster" "cluster" {
  name                = "ClusterProyecto"
  location            = "East US"
  resource_group_name = "piarnedo2"
  dns_prefix          = "learnk8scluster"

  default_node_pool {
    name       = "default"
    node_count = "2"
    vm_size    = "standard_d2_v2"
    enable_node_public_ip = true   //Asigna una ip publica aleatorio a ambos nodos creados en el Cluster de AKS
  }

  identity {
    type = "SystemAssigned"
  }
}