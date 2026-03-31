terraform {
  backend "s3" {
    bucket         = "cinevision-terraform-state-staging"
    key            = "staging/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "cinevision-terraform-locks-staging"
    encrypt        = true
  }
}