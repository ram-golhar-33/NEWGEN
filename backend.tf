terraform {
  backend "s3" {
    bucket       = "ram-terraform-state-2026-001"
    key          = "terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
  }
}
