variable "setup" {
  type = map(string)
  default = {
    australia  = "ap-southeast-2"
    california = "us-west-1"
    hong-kong  = "ap-east-1"
    london     = "eu-west-2"
    new-york   = "us-east-1"
    sao-paulo  = "sa-east-1"
    tokyo      = "ap-northeast-1"
    tokyo-test = "ap-northeast-1"
  }
}

variable "network" {
  type = map(map(map(map(string))))
  default = {
    vpcs = {
      australia = {
        australia = {
          region = "ap-southeast-2"
          cidr   = "10.44.0.0/16"
          name   = "australia"
        }
      }
      california = {
        california = {
          region = "us-west-1"
          cidr   = "10.46.0.0/16"
          name   = "california"
        }
      }
      hong-kong = {
        hong-kong = {
          region = "ap-east-1"
          cidr   = "10.45.0.0/16"
          name   = "hong-kong"
        }
      }
      london = {
        london = {
          region = "eu-west-2"
          cidr   = "10.42.0.0/16"
          name   = "london"
        }
      }
      new-york = {
        new-york = {
          region = "us-east-1"
          cidr   = "10.41.0.0/16"
          name   = "new-york"
        }
      }
      sao-paulo = {
        sao-paulo = {
          region = "sa-east-1"
          cidr   = "10.43.0.0/16"
          name   = "sao-paulo"
        }
      }
      tokyo = {
        tokyo = {
          region = "ap-northeast-1"
          cidr   = "10.40.0.0/16"
          name   = "tokyo"
        }
      }
      tokyo-test = {
        tokyo-test = {
          region = "ap-northeast-1"
          cidr   = "10.47.0.0/16"
          name   = "tokyo-test"
        }
      }
    }
    subnets = {
      australia = {
        australia-a-public = {
          vpc  = "australia"
          cidr = "10.44.1.0/24"
          az   = "ap-southeast-2a"
        }
        australia-b-public = {
          vpc  = "australia"
          cidr = "10.44.2.0/24"
          az   = "ap-southeast-2b"
        }
      }
      california = {
        california-a-public = {
          vpc  = "california"
          cidr = "10.46.1.0/24"
          az   = "us-west-1a"
        }
        california-b-public = {
          vpc  = "california"
          cidr = "10.46.2.0/24"
          az   = "us-west-1b"
        }
      }
      hong-kong = {
        hong-kong-a-public = {
          vpc  = "hong-kong"
          cidr = "10.45.1.0/24"
          az   = "ap-east-1a"
        }
        hong-kong-b-public = {
          vpc  = "hong-kong"
          cidr = "10.45.2.0/24"
          az   = "ap-east-1b"
        }
      }
      london = {
        london-a-public = {
          vpc  = "london"
          cidr = "10.42.1.0/24"
          az   = "eu-west-2a"
        }
        london-b-public = {
          vpc  = "london"
          cidr = "10.42.2.0/24"
          az   = "eu-west-2b"
        }
      }
      new-york = {
        new-york-a-public = {
          vpc  = "new-york"
          cidr = "10.41.1.0/24"
          az   = "us-east-1a"
        }
        new-york-b-public = {
          vpc  = "new-york"
          cidr = "10.41.2.0/24"
          az   = "us-east-1b"
        }
      }
      sao-paulo = {
        sao-paulo-a-public = {
          vpc  = "sao-paulo"
          cidr = "10.43.1.0/24"
          az   = "sa-east-1a"
        }
        sao-paulo-c-public = {
          vpc  = "sao-paulo"
          cidr = "10.43.3.0/24"
          az   = "sa-east-1c"
        }
      }
      tokyo = {
        tokyo-a-public = {
          vpc  = "tokyo"
          cidr = "10.40.1.0/24"
          az   = "ap-northeast-1a"
        }
        tokyo-d-public = {
          vpc  = "tokyo"
          cidr = "10.40.4.0/24"
          az   = "ap-northeast-1d"
        }
        # tokyo-c-private = {
        #   vpc  = "tokyo"
        #   cidr = "10.40.13.0/24"
        #   az   = "ap-northeast-1d"
        # }
      }
      tokyo-test = {
        tokyotest-b-public = {
          vpc  = "tokyo-test"
          cidr = "10.47.3.0/24"
          az   = "ap-northeast-1c"
        }
        tokyotest-c-public = {
          vpc  = "tokyo-test"
          cidr = "10.47.4.0/24"
          az   = "ap-northeast-1d"
        }
      }
    }
  }
}