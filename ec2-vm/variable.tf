#-------------------------------------------
# variables.tf
# - variables used in terraform module
#--------------------------------------------

variable "tags" {
  description = "Common set of tags."
  type        = map(string)
  default     = {}
}

variable "env_prefix" {}
variable "vpc_cidr_block" {}
variable "subnet_cidr_block" {}
variable "availability_zone" {}
variable "instance_type" {}