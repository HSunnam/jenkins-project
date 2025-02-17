#-------------------------------------------
# ouputs.tf
# - outputs from terraform module
#--------------------------------------------
# Output in the terminal the address of the Jenkins server, once it's created
output "ec2_public_ip" {
  value = module.ec2_instance.public_ip
}