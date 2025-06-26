terraform {
  cloud {
    organization = "yumenomatayume"
    hostname     = "app.terraform.io"
    workspaces {
      name = "aws"
    }
  }

  required_version = "~> 1.12.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
