terraform {
  required_version = ">= 1.0"
  backend "remote" {
    organization = "my-org"
    workspaces {
      name = "my-workspace"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
