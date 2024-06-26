terraform {
    cloud {
        hostname = "app.terraform.io"
        organization = "learn-tfc-ar"

        workspaces {
            name = "learn-tfc-ar-wsp"
        }
    }
    required_providers {
        aws = {
          source  = "hashicorp/aws"
          version = "~> 5.45.0"
        }
    }
    required_version = "~> 1.8.0"
}

provider "aws" {
    region = var.region
}

# data "aws_ami" "ubuntu" {
#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }

#   owners = ["099720109477"] # Amazon
# }

# resource "aws_key_pair" "deployer" {
#   key_name   = "deployer-key"
#   public_key = var.pub_ssh_key
# }

# resource "aws_instance" "example" {
#   ami                    = data.aws_ami.ubuntu.id
#   key_name               = aws_key_pair.deployer.key_name
#   instance_type          = "t2.micro"
#   vpc_security_group_ids = [aws_security_group.sg_ssh.id,aws_security_group.sg_web.id]
#   user_data              = <<-EOF
#               #!/bin/bash
#               apt-get update
#               apt-get install -y apache2
#               sed -i -e 's/80/8080/' /etc/apache2/ports.conf
#               echo "Hello World" > /var/www/html/index.html
#               systemctl restart apache2
#               EOF
#   tags = {
#     Name          = "terraform-learn-state-ec2"
#     drift_example = "v1"
#   }
# }

# resource "aws_security_group" "sg_web" {
#   name = "sg_web"
#   ingress {
#     from_port   = "8080"
#     to_port     = "8080"
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   // connectivity to ubuntu mirrors is required to run `apt-get update` and `apt-get install apache2`
#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }

# resource "aws_security_group" "sg_ssh" {
#   name = "sg_ssh"
#   ingress {
#     from_port   = "22"
#     to_port     = "22"
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   // connectivity to ubuntu mirrors is required to run `apt-get update` and `apt-get install apache2`
#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }