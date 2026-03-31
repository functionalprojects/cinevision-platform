terraform {
  backend "s3" {
    bucket         = "cinevision-terraform-state-prod"
    key            = "prod/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "cinevision-terraform-locks-prod"
    encrypt        = true
  }
}