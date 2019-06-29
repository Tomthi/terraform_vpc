/*
  Production Corporate IT VPC. 
  Author: tthi 
  Date:   02-05-2019
  Terraform Version: v 0.12
*/

#####################################################################################
# Datasources
#####################################################################################

# Empty #

#####################################################################################
# Variables
#####################################################################################
 
 # All variables nust now be declaiered. 
 variable "service_name" {}

#####################################################################################
# Modules
#####################################################################################

# VPC Module
module "thinet" {
  source = "terraform-aws-modules/vpc/aws"

  # version                          = "1.53.0"
  version = "2.7.0"
  name    = "thinet"
  cidr    = "172.35.0.0/16"
  azs     = ["us-east-1e", "us-east-1d", "us-east-1f"]

  public_subnets  = ["172.35.10.0/24", "172.35.20.0/24", "172.35.30.0/24"]
  private_subnets = ["172.35.40.0/24", "172.35.50.0/24", "172.35.60.0/24"]

  enable_dns_hostnames = true
  enable_dns_support   = true

  enable_nat_gateway = true
  single_nat_gateway = true

  enable_vpn_gateway = true

  enable_dhcp_options      = true
  dhcp_options_domain_name = "thinet.local"

  # dhcp_options_domain_name_servers = ["127.0.0.1", "10.10.0.2"]

  tags = {
    Name      = "thi_net"
    env       = "prod"
    terraform = "true"
  }
}

# Secuirty Groups
# Security Groups provisioned in security_groups.tf
#####################################################################################
# Resources
####################################################################################
