terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"
  user_data = <<-EOF
                  #!/bin/bash
                        cd /home/ubuntu
                        echo "<h1>web-server test </h1>" > index.html
                  EOF

  tags = {
    #Name = #"ExampleAppServerInstance"
  }
}