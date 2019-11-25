terraform {
  backend "s3" {
    bucket = "jf-terraform-state"
    key    = "fundamentals/fundamentals.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
    version = "~> 2.0"
    region = "us-east-1"
}
