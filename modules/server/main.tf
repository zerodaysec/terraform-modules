# Configure the AWS Provider
provider "aws" {
  region = "us-west-2"
}

# Create an EC2 instance with Amazon Linux 2 and additional storage
resource "aws_instance" "example" {
  ami                    = data.aws_ami.amazon_linux2.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.example.id]
  key_name               = "my-key"
  iam_instance_profile   = "arn:aws:iam::123456789012:instance-profile/my-instance-profile"
  metadata_options {
    http_tokens = optional
  }

  # Add a secondary EBS volume for /data drive
  ebs_block_device {
    device_name           = "/dev/sdf"
    volume_size           = 50
    delete_on_termination = false
    encrypted             = true
  }

  # Add a primary EBS volume for /
  root_block_device {
    device_name           = "/dev/sda1"
    volume_size           = 8
    delete_on_termination = false
    encrypted             = true
    # kms_key_id            = aws_kms_key.example.key_id
  }

  # User data to write the hostname to /data/hostname.txt
  user_data = <<-EOF
                                      #!/bin/bash
                                      echo "MyHostname" > /data/hostname.txt
                                      EOF
}
