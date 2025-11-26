# Month 1 Assessment – Terraform Deployment for TechCorp

## Project Overview
This project demonstrates provisioning a secure and highly available web application infrastructure on AWS using Terraform. The deployment includes a VPC, public and private subnets, a bastion host, web and database servers, and an Application Load Balancer (ALB).

## Infrastructure Overview
- **VPC:** 10.0.0.0/16 with DNS support and hostnames enabled
- **Subnets:**
  - Public: 10.0.1.0/24, 10.0.2.0/24
  - Private: 10.0.3.0/24, 10.0.4.0/24
- **Internet & NAT Gateways:** Internet gateway for public subnets, NAT gateways for private subnet internet access
- **Security Groups:**
  - Web SG: HTTP(80), HTTPS(443) from anywhere, SSH(22) from Bastion
  - DB SG: MySQL(3306) from Web SG, SSH(22) from Bastion
  - Bastion SG: SSH(22) from your IP
- **EC2 Instances:**
  - Bastion Host: t3.micro in public subnet
  - Web Servers: 2x t3.micro in private subnets with Apache installed
  - Database Server: 1x t3.small in private subnet with PostgresDB
- **ALB:** Public ALB with target group pointing to web servers and health checks

## Prerequisites
- Terraform >= 1.5
- AWS CLI configured with appropriate IAM credentials
- Key pair created in AWS (referenced in `terraform.tfvars`)
- Your current IP address for bastion SSH access

## Directory Structure
terraform-assessment/
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars.example
├── user_data/
│   ├── web_server_setup.sh
│   └── db_server_setup.sh
└── README.md


## Deployment Steps
1. **Clone the repository:**
```bash
git clone <repo-url>
cd terraform-assessment
cp terraform.tfvars.example terraform.tfvars
# Update region, key pair, instance types, and your IP addresses
terraform init
terraform plan
terraform apply
Access the infrastructure:

SSH to the bastion host

SSH from bastion to web and DB servers

Access web application via ALB URL

Cleanup
terraform destroy

Outputs

VPC ID: Displayed after apply

Bastion Public IP: Displayed after apply

ALB DNS Name: Displayed after apply
