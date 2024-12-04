data "aws_ami" "australia-ami" {
  provider    = aws.australia
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

# Generate rsa key pair on your system
# ssh-keygen -t rsa -b 4096 -f ~/.ssh/aws.pem

resource "aws_key_pair" "australia-key-pair" {
  provider = aws.australia
  key_name = "australia-key-pair"
  # file reference the location of the public key
  public_key = file("~/.ssh/aws.pem.pub")
}

data "aws_ami" "california-ami" {
  provider    = aws.california
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

resource "aws_key_pair" "california-key-pair" {
  provider = aws.california
  key_name = "california-key-pair"
  # file reference the location of the public key
  public_key = file("~/.ssh/aws.pem.pub")
}

data "aws_ami" "hong-kong-ami" {
  provider    = aws.hong-kong
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

# Generate rsa key pair on your system
# ssh-keygen -t rsa -b 4096 -f ~/.ssh/aws.pem

resource "aws_key_pair" "hong-kong-key-pair" {
  provider = aws.hong-kong
  key_name = "hong-kong-key-pair"
  # file reference the location of the public key
  public_key = file("~/.ssh/aws.pem.pub")
}

data "aws_ami" "london-ami" {
  provider    = aws.london
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

resource "aws_key_pair" "london-key-pair" {
  provider = aws.london
  key_name = "london-key-pair"
  # file reference the location of the public key
  public_key = file("~/.ssh/aws.pem.pub")
}

data "aws_ami" "new-york-ami" {
  provider    = aws.new-york
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

resource "aws_key_pair" "new-york-key-pair" {
  provider = aws.new-york
  key_name = "new-york-key-pair"
  # file reference the location of the public key
  public_key = file("~/.ssh/aws.pem.pub")
}

data "aws_ami" "sao-paulo-ami" {
  provider    = aws.sao-paulo
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

resource "aws_key_pair" "sao-paulo-key-pair" {
  provider = aws.sao-paulo
  key_name = "sao-paulo-key-pair"
  # file reference the location of the public key
  public_key = file("~/.ssh/aws.pem.pub")
}

data "aws_ami" "tokyo-ami" {
  provider    = aws.tokyo
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

resource "aws_key_pair" "tokyo-key-pair" {
  provider = aws.tokyo
  key_name = "tokyo-key-pair"
  # file reference the location of the public key
  public_key = file("~/.ssh/aws.pem.pub")
}
