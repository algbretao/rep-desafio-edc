provider "aws" {
  region = var.regiao
}

# Centralizar o arquivo de controle de estado do terraform
terraform {
  backend "s3" {
    bucket = "terraform-state-andrebretao"
    key = "state/desafio-algbretao/terraform.tfstate"
    region = "us-east-1"
  }
}