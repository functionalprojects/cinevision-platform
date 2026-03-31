terraform {
  backend "s3" {
    bucket         = "cinevision-terraform-state-dev"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "cinevision-terraform-locks-dev"
    encrypt        = true
  }
}