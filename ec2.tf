# Configure the AWS provider
provider "aws" {
  region = "us-east-1"   # Change to your preferred region
}

# Create a key pair (optional if you already have one)
# resource "aws_key_pair" "example" {
#  key_name   = "mobaxterm.pem"
#  public_key = file("C:/Users/aaksh/Downloads/mobaxterm.pem")   # Path to your public key


# Create a security group to allow SSH
# resource "aws_security_group" "example" {
# name        = "example-sg"
#  description = "Allow SSH inbound traffic"

#ssh access
#  ingress {
#   from_port   = 22
#   to_port     = 22
#    protocol    = "tcp"
#   cidr_blocks = ["0.0.0.0/0"]   # Open to all; restrict in production
# }

# HTTP access
# ingress {
#   from_port   = 80
#   to_port     = 80
#   protocol    = "tcp"
#   cidr_blocks = ["0.0.0.0/0"]   # Allows web traffic
# }

# egress {
#   from_port   = 0
#   to_port     = 0
#   protocol    = "-1"
#   cidr_blocks = ["0.0.0.0/0"]
# }
#}

# Launch an EC2 instance
resource "aws_instance" "example" {
  ami           = "ami-0eb38b817b93460ac"   # Amazon Linux 2 AMI (update per region)
  instance_type = "t2.micro"                # Free tier eligible
  key_name      = "mobaxterm"

# Use the default security group  
  vpc_security_group_ids = ["sg-0db484edc0a0c070e"]

  tags = {
    Name = "terrainstance"
  }
}
