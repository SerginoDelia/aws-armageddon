data "aws_ami" "australiam-ami" {
  provider    = aws.australia
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

# Generate public key on your system
# ssh-keygen -t rsa -b 4096 -f ~/.ssh/australia-key-pair.pem

resource "aws_key_pair" "australia-key-pair" {
  provider = aws.australia
  key_name = "australia-key-pair"
  # file reference the location of the public key
  public_key = file("~/.ssh/australia-key-pair.pem.pub")
}

output "australia-key-pair" {
  value = aws_key_pair.australia-key-pair
}

resource "aws_launch_template" "austria-lt" {
  provider      = aws.australia
  name_prefix   = "app1_LT"
  image_id      = data.aws_ami.australiam-ami.id
  instance_type = "t2.micro"

  key_name               = "MyLinuxBox"
  vpc_security_group_ids = [aws_security_group._1["australia-sg-server"].id]
  user_data = base64encode(<<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    # Get the IMDSv2 token
    TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")
    # Background the curl requests
    curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/local-ipv4 &> /tmp/local_ipv4 &
    curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/placement/availability-zone &> /tmp/az &
    curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/ &> /tmp/macid &
    wait
    macid=$(cat /tmp/macid)
    local_ipv4=$(cat /tmp/local_ipv4)
    az=$(cat /tmp/az)
    vpc=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/$macid/vpc-id)
    # Create HTML file
    cat <<-HTML > /var/www/html/index.html
    <!doctype html>
    <html lang="en" class="h-100">
    <head>
    <title>Details for EC2 instance</title>
    </head>
    <body>
    <div>
    <h1>Malgus Clan</h1>
    <h1>Chains Broken in Ireland</h1>
    <p><b>Instance Name:</b> $(hostname -f) </p>
    <p><b>Instance Private Ip Address: </b> $local_ipv4</p>
    <p><b>Availability Zone: </b> $az</p>
    <p><b>Virtual Private Cloud (VPC):</b> $vpc</p>
    </div>
    </body>
    </html>
    HTML
    # Clean up the temp files
    rm -f /tmp/local_ipv4 /tmp/az /tmp/macid
  EOF
  )
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name    = "app1_LT"
      Service = "application1"
      Owner   = "Chewbacca"
      Planet  = "Mustafar"
    }
  }
  lifecycle {
    create_before_destroy = true
  }
}
