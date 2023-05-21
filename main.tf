terraform {
  cloud {
    organization = "yumenomatayume"
    hostname     = "app.terraform.io"
    workspaces {
      name = "aws"
    }
  }

  required_version = "~> 1.4.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.region
}

module "oidc-with-github-actions" {
  source  = "thetestlabs/oidc-with-github-actions/aws"
  version = "~> 0.1.0"

  github_org = "ymmmtym"
  github_repositories = [
    "aws",
  ]
}

module "terraform-cloud-oidc" {
  source  = "saidsef/terraform-cloud-oidc/aws"
  version = "~> 1.0"

  attach_admin_policy = true
  organisation        = "yumenomatayume"
  projects            = [{ "project" : "aws", "workspaces" : ["*"], "run_phase" : "*" }]
}
