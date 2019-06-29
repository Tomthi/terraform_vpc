terraform {
  backend "s3" {}
}

data "terraform_remote_state" "master_state" {
  backend = "s3"
  config {
    bucket     = "tfstates"
    region     = "${var.region}"
    key        = "${var.environment}/${var.service_name}.tfstate"
    encrypt     = true
  }
}

variable "region" { default = "us-east-1" }

provider "aws" {
  region = "${var.region}"
}

variable "service_name" { default = "" }
variable "product_id" { default = "" }
