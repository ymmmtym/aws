module "oidc-with-github-actions" {
  source  = "thetestlabs/oidc-with-github-actions/aws"
  version = "0.1.4"

  github_org = "ymmmtym"
  github_repositories = [
    "aws",
  ]
}

module "terraform-cloud-oidc" {
  source  = "saidsef/terraform-cloud-oidc/aws"
  version = ">= 1"

  attach_read_only_policy = true
  organisation     = "yumenomatayume"
  projects         = [{ "project" : "aws", "workspaces" : ["*"], "run_phase" : "*" }]
}
