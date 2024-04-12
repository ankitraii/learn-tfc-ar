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
    alias = "useast1"
    region = "us-east-1"
}

# resource "aws_instance" "demo_tfc" {
#     provider = aws.useast1
#     ami = "ami-051f8a213df8bc089"
#     instance_type = "t2.micro"
# }

# output "instance_id" {
#     value = aws_instance.demo_tfc.id
# }
