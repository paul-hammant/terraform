########################### ECS Config ################################

variable "ecs_cluster" {
  description = "ECS cluster name"
  default = "kss"
}

variable "ecs_key_pair_name" {
    description = "EC2 instance key pair name"
}

variable "ec2_ami_id" {
    description = "Amazon ECS-Optimized AMI ID"
}

variable "ec2_instance_type" {
    description = "Amazon ECS-Optimized Instance Type"
    default = "t2.medium"
}

variable "ec2_role_name" {
    description = "EC2 Instance Role Name"
    default = "terraform-ec2-instance-role"
}
variable "ecs_role_name" {
    description = "ECS Service Role Name"
    default = "terraform-ecs-service-role"
}


########################### Autoscale Config ################################

variable "max_instance_size" {
  description = "Maximum number of instances in the cluster"
  default = 1
}

variable "min_instance_size" {
  description = "Minimum number of instances in the cluster"
  default = 1
}

variable "desired_capacity" {
  description = "Desired number of instances in the cluster"
  default = 1
}

variable "alb_security_group" {
  description = "ALB Security Group"
  default = ""
}


########################### Test VPC Config ################################
variable "vpc" {
  description = "VPC name for Test environment"
}
variable "vpc_private_01" {
  description = "Private Subnet ID"
}