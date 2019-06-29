/*
  Production Corporate IT VPC. 
  Author: tthi 
  Date:   02-05-2019
  Terraform Version: v 0.12
  Security Groups for corporate IT resources
*/

#####################################################################################
# Datasources
#####################################################################################

# Empty #

#####################################################################################
# Modules
#####################################################################################

# Secuirty Groups
module "corporate_sg_vpn" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "3.0.1"

  name                = "corporate-vpn-all"
  description         = "Allow VPN Access"
  vpc_id              = module.thinet.vpc_id
  ingress_cidr_blocks = ["172.35.0.0/16"]

  ingress_with_cidr_blocks = [
    {
      rule        = "all-all"
      cidr_blocks = "172.18.0.0/16,192.168.0.0/16,10.10.178.0/24"
      description = "allow all inbound traffic from vpn"
    },
  ]

  tags = {
    Name      = "corporate-vpn-all"
    env       = "prod"
    terraform = "true"
  }
}


module "corporate_sg_all_internal" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "3.0.1"

  name        = "corporate-all-internal"
  description = "Allow All Internal"
  vpc_id      = module.thinet.vpc_id

  ingress_cidr_blocks = ["172.35.0.0/16"]

  ingress_with_cidr_blocks = [
    {
      rule        = "all-all"
      cidr_blocks = "172.35.40.0/24,172.35.50.0/24,172.35.60.0/24"
      description = "allow all inbound between subnets"
    },
  ]
  tags = {
    Name      = "corporate-all-internal"
    env       = "prod"
    terraform = "true"
  }
}

module "corporate_sg_all_public" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "3.0.1"

  name        = "corporate-all-public"
  description = "Allow All Public"
  vpc_id      = module.thinet.vpc_id

  ingress_cidr_blocks = ["172.35.0.0/16"]

  ingress_with_cidr_blocks = [
    {
      rule        = "all-all"
      cidr_blocks = "0.0.0.0/0"
      description = "allow all inbound public"
    },
  ]

  tags = {
    Name      = "corporate-all-public"
    env       = "prod"
    terraform = "true"
  }
}

#####################################################################################
# Resources
####################################################################################
