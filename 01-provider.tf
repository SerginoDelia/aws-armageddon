terraform {
  # backend "s3" {
  #   bucket = "agwe-aws-terraform"
  #   key    = "aws6-armageddon"
  #   region = "ap-southeast-2"
  #   encrypt = true
  # }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.77.0"
    }
  }
}
provider "aws" {
  # Configuration options
  region = var.setup.australia
  alias  = "australia"
}

provider "aws" {
  # Configuration options
  region = var.setup.california
  alias  = "california"
}
provider "aws" {
  # Configuration options
  region = var.setup.london
  alias  = "london"
}

provider "aws" {
  # Configuration options
  region = var.setup.new-york
  alias  = "new-york"
}
provider "aws" {
  # Configuration options
  region = var.setup.sao-paulo
  alias  = "sao-paulo"
}

provider "aws" {
  # Configuration options
  region = var.setup.hong-kong
  alias  = "hong-kong"
}

provider "aws" {
  # Configuration options
  region = var.setup.tokyo
  alias  = "tokyo"
}

provider "aws" {
  # Configuration options
  region = var.setup.tokyo-test
  alias  = "tokyo-test"
}
