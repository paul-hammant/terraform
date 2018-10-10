variable "region" {
  description ="AWS Region in which you are working"
  default = ""
}
variable "keypair" {
  description = "KeyPair for the region"
  default = ""
}

variable "ec2_ami_id" {
    description ="Amazon ECS-Optimized AMI for ECS Cluster"
    default =""
}


