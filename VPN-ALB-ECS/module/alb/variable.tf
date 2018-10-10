variable "workload" {
 description = "Name of ALB"
 default = "kss"
}

variable "alb_internet_accessbility" {
 description = "Internet accessibility to the application load balancer "
 default = "false"
}

variable "deletion_protection" {
 description = "Enable deletion protection on the ALB, default is false"
 default = "false"
}

variable "alb_load_balancer_type" {
 description = "Type of load balancer to be created, possible values are application and network"
 default = "application"
}

variable "vpc" {
 description = "VPC ID"
 default = ""
}

variable "custom-subnets" {
 description = "Subnet for ALB"
 default = []
}


