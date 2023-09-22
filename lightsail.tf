resource "aws_lightsail_instance" "centos_instance" {
  name              = "centos_instance"
  availability_zone = "us-east-1a" # Change this to your desired availability zone
  blueprint_id      = "centos_7_1901_01"
  bundle_id         = "nano_1_0" # Change this to your desired Lightsail instance type
  user_data         = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install unzip wget httpd -y
    sudo wget https://github.com/utrains/static-resume/archive/refs/heads/main.zip
    sudo unzip main.zip
    sudo rm -rf /var/www/html/*
    sudo cp -r static-resume-main/* /var/www/html/
    sudo systemctl start httpd
    sudo systemctl enable httpd
    EOF
}

