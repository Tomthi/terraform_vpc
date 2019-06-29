variable "vpc_id" {
  default = ""
}

variable "environment" {
  default = ""
}

variable "route53_internal_zone_id" {
  default = ""
}

variable "ssh_key_name" {
  default = ""
}

variable "iam_instance_profile" {
  default = ""
}

variable "static_routes" {
  default = ["192.168.0.0/16", "172.18.0.0/16"]
