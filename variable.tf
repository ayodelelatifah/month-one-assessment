# AWS Region
variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
}

# Your IP for Bastion Access
variable "my_ip" {
  description = "Your public IP address for SSH access"
  type        = string
}

# EC2 Instance Types
variable "bastion_instance_type" {
  description = "Instance type for Bastion host"
  type        = string
  default     = "t3.micro"
}

variable "web_instance_type" {
  description = "Instance type for Web servers"
  type        = string
  default     = "t3.micro"
}

variable "db_instance_type" {
  description = "Instance type for Database server"
  type        = string
  default     = "t3.small"
}

# Key Pair Name
variable "key_pair_name" {
  description = "Key pair name for EC2 SSH access"
  type        = string
}
