terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0.0"
    }
  }
}

# Configure AWS Providers for both regions
provider "aws" {
  alias  = "virginia"
  region = "us-east-1"
#   call provider: provider = aws.virginia
}

provider "aws" {
  alias  = "tokyo"
  region = "ap-northeast-1"
#   call provider: provider = aws.tokyo
}

module "virginia-network" {
    # source: "./[MODULES]/[NAME]"
    source = "./modules/network"
    providers = {
        aws = aws.virginia
    }
    network = var.virginia-network
}

module "tokyo-network" {
    source = "./modules/network"
    providers = {
        aws = aws.tokyo
    }

    network = var.tokyo-network
}

