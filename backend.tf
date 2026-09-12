terraform {
  backend "s3" {
    bucket         = "ram-terraform-state-2026"
    key            = "terraform/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-state-lock"
  }
}
