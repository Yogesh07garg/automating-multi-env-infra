terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.30"
    }
  }
  
  backend "s3"{
    bucket = "terraform-bucket-for-all-env"
    key = "env/dev/terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "dynamo-db-table"

 }
}

